import psycopg2
from psycopg2 import extras
import os


def run():
    conn = psycopg2.connect(os.environ["DATABASE_URL"])
    conn.autocommit = True

    with conn.cursor() as cur:
        try:
            cur.execute('select user_id, ei_id, profile_visibility from "user"')
            i = 0
            with conn.cursor() as insert:
                for user in cur:
                    user_id = user[0]
                    ei_id = user[1]
                    if ei_id is None:
                        continue

                    profile_visibility = user[2]

                    # migrate to new account table
                    insert.execute(
                        """
						insert into account (user_id, game_id, account_visibility, position)
						values (%s, %s, %s, 0)
					    returning account_id;
					""",
                        (user_id, ei_id, profile_visibility),
                    )
                    i += 1

                    # migrate the basic saves, changing `account_id` which holds `user_` ids to `acct_` ids
                    insert_account_res = insert.fetchone()
                    account_id = insert_account_res[0]
                    offset = 0
                    limit = 100
                    count = 0

                    while True:
                        ugh = conn.cursor()
                        ugh.execute(
                            """
                            select
                                time, computed_earnings_bonus,
                                soul_eggs, eggs_of_prophecy, er_soul_food_level,
                                er_prophecy_bonus_level, clothed_earnings_bonus,
                                prestige_count, backup_time
                            from basic_save_v1 
                            where account_id = %s
                            limit %s offset %s
                            """,
                            (user_id, limit, offset),
                        )

                        saves = ugh.fetchall()
                        if not saves:
                            break
                        count += len(saves)

                        extras.execute_values(
                            insert,
                            """
                            insert into basic_save_v1(
                                time, account_id, computed_earnings_bonus,
                                soul_eggs, eggs_of_prophecy, er_soul_food_level,
                                er_prophecy_bonus_level, clothed_earnings_bonus,
                                prestige_count, backup_time
                            ) values %s
                            """,
                            [(save[0], account_id, *save[1:9]) for save in saves],
                        )

                        offset += limit

                    print(f"successfully migrated {user_id} with {count} saves")
        except (Exception, psycopg2.DatabaseError) as error:
            print(error)

    print(f"migration complete - {i} rows inserted")

    # for save in ugh:
    # insert.execute(
    #     """
    # 	insert into basic_save_v1(
    # 		time, user_id, computed_earnings_bonus,
    # 		soul_eggs, eggs_of_prophecy, er_soul_food_level,
    # 		er_prophecy_bonus_level, clothed_earnings_bonus,
    # 		prestige_count, backup_time
    # 	) values (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
    # """,
    #     (
    #         save[0],
    #         account_id,
    #         save[1],
    #         save[2],
    #         save[3],
    #         save[4],
    #         save[5],
    #         save[6],
    #         save[7],
    #         save[8],
    #     ),
    # )
    # saves += 1
