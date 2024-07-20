import psycopg2
import os 

def run():
	# create psycopg2 connection from env var DATABASE_URL
	conn = psycopg2.connect(os.environ['DATABASE_URL'])
	conn.autocommit = True

	with conn.cursor() as cur:
		try:
			cur.execute("select user_id, ei_id, profile_visibility from \"user\"")
			i = 0
			with conn.cursor() as insert:
				for row in cur:
					insert.execute("""
						insert into account (user_id, game_id, account_visibility)
						values (%s, %s, %s)
					""", (row[0], row[1], row[2]))
					i += 1
		except (Exception, psycopg2.DatabaseError) as error:
			print(error)

	print(f"migration complete - {i} rows inserted")
