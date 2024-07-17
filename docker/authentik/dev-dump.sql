--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	auth	permission
2	auth	group
3	contenttypes	contenttype
4	sessions	session
5	authentik_crypto	certificatekeypair
6	authentik_events	event
7	authentik_events	notificationtransport
8	authentik_events	notificationrule
9	authentik_events	notification
10	authentik_events	notificationwebhookmapping
11	authentik_flows	flow
12	authentik_flows	stage
13	authentik_flows	flowstagebinding
14	authentik_flows	flowtoken
15	authentik_outposts	outpost
16	authentik_outposts	outpostserviceconnection
17	authentik_outposts	dockerserviceconnection
18	authentik_outposts	kubernetesserviceconnection
19	authentik_policies_dummy	dummypolicy
20	authentik_policies_event_matcher	eventmatcherpolicy
21	authentik_policies_expiry	passwordexpirypolicy
22	authentik_policies_expression	expressionpolicy
23	authentik_policies_password	passwordpolicy
24	authentik_policies_reputation	reputationpolicy
25	authentik_policies_reputation	reputation
26	authentik_policies	policy
27	authentik_policies	policybinding
28	authentik_policies	policybindingmodel
29	authentik_providers_ldap	ldapprovider
30	authentik_providers_oauth2	oauth2provider
31	authentik_providers_oauth2	scopemapping
32	authentik_providers_oauth2	refreshtoken
33	authentik_providers_oauth2	authorizationcode
34	authentik_providers_oauth2	devicetoken
35	authentik_providers_oauth2	accesstoken
36	authentik_providers_proxy	proxyprovider
37	authentik_providers_radius	radiusprovider
38	authentik_providers_saml	samlpropertymapping
39	authentik_providers_saml	samlprovider
40	authentik_providers_scim	scimmapping
41	authentik_providers_scim	scimprovider
42	authentik_providers_scim	scimuser
43	authentik_providers_scim	scimgroup
44	authentik_rbac	role
45	authentik_rbac	systempermission
46	authentik_sources_ldap	ldappropertymapping
47	authentik_sources_ldap	ldapsource
48	authentik_sources_oauth	oauthsource
49	authentik_sources_oauth	useroauthsourceconnection
50	authentik_sources_plex	plexsource
51	authentik_sources_plex	plexsourceconnection
52	authentik_sources_saml	samlsource
53	authentik_sources_saml	usersamlsourceconnection
54	authentik_stages_authenticator_duo	authenticatorduostage
55	authentik_stages_authenticator_duo	duodevice
56	authentik_stages_authenticator_sms	authenticatorsmsstage
57	authentik_stages_authenticator_sms	smsdevice
58	authentik_stages_authenticator_static	authenticatorstaticstage
59	authentik_stages_authenticator_static	staticdevice
60	authentik_stages_authenticator_static	statictoken
61	authentik_stages_authenticator_totp	authenticatortotpstage
62	authentik_stages_authenticator_totp	totpdevice
63	authentik_stages_authenticator_validate	authenticatorvalidatestage
64	authentik_stages_authenticator_webauthn	webauthndevice
65	authentik_stages_authenticator_webauthn	authenticatewebauthnstage
66	authentik_stages_captcha	captchastage
67	authentik_stages_consent	consentstage
68	authentik_stages_consent	userconsent
69	authentik_stages_deny	denystage
70	authentik_stages_dummy	dummystage
71	authentik_stages_email	emailstage
72	authentik_stages_identification	identificationstage
73	authentik_stages_invitation	invitationstage
74	authentik_stages_invitation	invitation
75	authentik_stages_password	passwordstage
76	authentik_stages_prompt	prompt
77	authentik_stages_prompt	promptstage
78	authentik_stages_user_delete	userdeletestage
79	authentik_stages_user_login	userloginstage
80	authentik_stages_user_logout	userlogoutstage
81	authentik_stages_user_write	userwritestage
82	authentik_tenants	tenant
83	authentik_blueprints	blueprintinstance
84	guardian	groupobjectpermission
85	guardian	userobjectpermission
86	authentik_core	user
87	authentik_core	propertymapping
88	authentik_core	source
89	authentik_core	usersourceconnection
90	authentik_core	token
91	authentik_core	provider
92	authentik_core	group
93	authentik_core	application
94	authentik_core	authenticatedsession
95	authentik_enterprise	license
96	authentik_enterprise	licenseusage
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can view permission	1	view_permission
5	Can add group	2	add_group
6	Can change group	2	change_group
7	Can delete group	2	delete_group
8	Can view group	2	view_group
9	Can add content type	3	add_contenttype
10	Can change content type	3	change_contenttype
11	Can delete content type	3	delete_contenttype
12	Can view content type	3	view_contenttype
13	Can add session	4	add_session
14	Can change session	4	change_session
15	Can delete session	4	delete_session
16	Can view session	4	view_session
17	Can add Certificate-Key Pair	5	add_certificatekeypair
18	Can change Certificate-Key Pair	5	change_certificatekeypair
19	Can delete Certificate-Key Pair	5	delete_certificatekeypair
20	Can view Certificate-Key Pair	5	view_certificatekeypair
21	Can add Event	6	add_event
22	Can change Event	6	change_event
23	Can delete Event	6	delete_event
24	Can view Event	6	view_event
25	Can add Notification Transport	7	add_notificationtransport
26	Can change Notification Transport	7	change_notificationtransport
27	Can delete Notification Transport	7	delete_notificationtransport
28	Can view Notification Transport	7	view_notificationtransport
29	Can add Notification Rule	8	add_notificationrule
30	Can change Notification Rule	8	change_notificationrule
31	Can delete Notification Rule	8	delete_notificationrule
32	Can view Notification Rule	8	view_notificationrule
33	Can add Notification	9	add_notification
34	Can change Notification	9	change_notification
35	Can delete Notification	9	delete_notification
36	Can view Notification	9	view_notification
37	Can add Webhook Mapping	10	add_notificationwebhookmapping
38	Can change Webhook Mapping	10	change_notificationwebhookmapping
39	Can delete Webhook Mapping	10	delete_notificationwebhookmapping
40	Can view Webhook Mapping	10	view_notificationwebhookmapping
41	Can add Flow	11	add_flow
42	Can change Flow	11	change_flow
43	Can delete Flow	11	delete_flow
44	Can view Flow	11	view_flow
45	Can export a Flow	11	export_flow
46	Can inspect a Flow's execution	11	inspect_flow
47	View Flow's cache metrics	11	view_flow_cache
48	Clear Flow's cache metrics	11	clear_flow_cache
49	Can add stage	12	add_stage
50	Can change stage	12	change_stage
51	Can delete stage	12	delete_stage
52	Can view stage	12	view_stage
53	Can add Flow Stage Binding	13	add_flowstagebinding
54	Can change Flow Stage Binding	13	change_flowstagebinding
55	Can delete Flow Stage Binding	13	delete_flowstagebinding
56	Can view Flow Stage Binding	13	view_flowstagebinding
57	Can add Flow Token	14	add_flowtoken
58	Can change Flow Token	14	change_flowtoken
59	Can delete Flow Token	14	delete_flowtoken
60	Can view Flow Token	14	view_flowtoken
61	Can add Outpost	15	add_outpost
62	Can change Outpost	15	change_outpost
63	Can delete Outpost	15	delete_outpost
64	Can view Outpost	15	view_outpost
65	Can add Outpost Service-Connection	16	add_outpostserviceconnection
66	Can change Outpost Service-Connection	16	change_outpostserviceconnection
67	Can delete Outpost Service-Connection	16	delete_outpostserviceconnection
68	Can view Outpost Service-Connection	16	view_outpostserviceconnection
69	Can add Docker Service-Connection	17	add_dockerserviceconnection
70	Can change Docker Service-Connection	17	change_dockerserviceconnection
71	Can delete Docker Service-Connection	17	delete_dockerserviceconnection
72	Can view Docker Service-Connection	17	view_dockerserviceconnection
73	Can add Kubernetes Service-Connection	18	add_kubernetesserviceconnection
74	Can change Kubernetes Service-Connection	18	change_kubernetesserviceconnection
75	Can delete Kubernetes Service-Connection	18	delete_kubernetesserviceconnection
76	Can view Kubernetes Service-Connection	18	view_kubernetesserviceconnection
77	Can add Dummy Policy	19	add_dummypolicy
78	Can change Dummy Policy	19	change_dummypolicy
79	Can delete Dummy Policy	19	delete_dummypolicy
80	Can view Dummy Policy	19	view_dummypolicy
81	Can add Event Matcher Policy	20	add_eventmatcherpolicy
82	Can change Event Matcher Policy	20	change_eventmatcherpolicy
83	Can delete Event Matcher Policy	20	delete_eventmatcherpolicy
84	Can view Event Matcher Policy	20	view_eventmatcherpolicy
85	Can add Password Expiry Policy	21	add_passwordexpirypolicy
86	Can change Password Expiry Policy	21	change_passwordexpirypolicy
87	Can delete Password Expiry Policy	21	delete_passwordexpirypolicy
88	Can view Password Expiry Policy	21	view_passwordexpirypolicy
89	Can add Expression Policy	22	add_expressionpolicy
90	Can change Expression Policy	22	change_expressionpolicy
91	Can delete Expression Policy	22	delete_expressionpolicy
92	Can view Expression Policy	22	view_expressionpolicy
93	Can add Password Policy	23	add_passwordpolicy
94	Can change Password Policy	23	change_passwordpolicy
95	Can delete Password Policy	23	delete_passwordpolicy
96	Can view Password Policy	23	view_passwordpolicy
97	Can add Reputation Policy	24	add_reputationpolicy
98	Can change Reputation Policy	24	change_reputationpolicy
99	Can delete Reputation Policy	24	delete_reputationpolicy
100	Can view Reputation Policy	24	view_reputationpolicy
101	Can add Reputation Score	25	add_reputation
102	Can change Reputation Score	25	change_reputation
103	Can delete Reputation Score	25	delete_reputation
104	Can view Reputation Score	25	view_reputation
105	Can add Policy	26	add_policy
106	Can change Policy	26	change_policy
107	Can delete Policy	26	delete_policy
108	Can view Policy	26	view_policy
109	View Policy's cache metrics	26	view_policy_cache
110	Clear Policy's cache metrics	26	clear_policy_cache
111	Can add Policy Binding	27	add_policybinding
112	Can change Policy Binding	27	change_policybinding
113	Can delete Policy Binding	27	delete_policybinding
114	Can view Policy Binding	27	view_policybinding
115	Can add Policy Binding Model	28	add_policybindingmodel
116	Can change Policy Binding Model	28	change_policybindingmodel
117	Can delete Policy Binding Model	28	delete_policybindingmodel
118	Can view Policy Binding Model	28	view_policybindingmodel
119	Can add LDAP Provider	29	add_ldapprovider
120	Can change LDAP Provider	29	change_ldapprovider
121	Can delete LDAP Provider	29	delete_ldapprovider
122	Can view LDAP Provider	29	view_ldapprovider
123	Can add OAuth2/OpenID Provider	30	add_oauth2provider
124	Can change OAuth2/OpenID Provider	30	change_oauth2provider
125	Can delete OAuth2/OpenID Provider	30	delete_oauth2provider
126	Can view OAuth2/OpenID Provider	30	view_oauth2provider
127	Can add Scope Mapping	31	add_scopemapping
128	Can change Scope Mapping	31	change_scopemapping
129	Can delete Scope Mapping	31	delete_scopemapping
130	Can view Scope Mapping	31	view_scopemapping
131	Can add OAuth2 Refresh Token	32	add_refreshtoken
132	Can change OAuth2 Refresh Token	32	change_refreshtoken
133	Can delete OAuth2 Refresh Token	32	delete_refreshtoken
134	Can view OAuth2 Refresh Token	32	view_refreshtoken
135	Can add Authorization Code	33	add_authorizationcode
136	Can change Authorization Code	33	change_authorizationcode
137	Can delete Authorization Code	33	delete_authorizationcode
138	Can view Authorization Code	33	view_authorizationcode
139	Can add Device Token	34	add_devicetoken
140	Can change Device Token	34	change_devicetoken
141	Can delete Device Token	34	delete_devicetoken
142	Can view Device Token	34	view_devicetoken
143	Can add OAuth2 Access Token	35	add_accesstoken
144	Can change OAuth2 Access Token	35	change_accesstoken
145	Can delete OAuth2 Access Token	35	delete_accesstoken
146	Can view OAuth2 Access Token	35	view_accesstoken
147	Can add Proxy Provider	36	add_proxyprovider
148	Can change Proxy Provider	36	change_proxyprovider
149	Can delete Proxy Provider	36	delete_proxyprovider
150	Can view Proxy Provider	36	view_proxyprovider
151	Can add Radius Provider	37	add_radiusprovider
152	Can change Radius Provider	37	change_radiusprovider
153	Can delete Radius Provider	37	delete_radiusprovider
154	Can view Radius Provider	37	view_radiusprovider
155	Can add SAML Property Mapping	38	add_samlpropertymapping
156	Can change SAML Property Mapping	38	change_samlpropertymapping
157	Can delete SAML Property Mapping	38	delete_samlpropertymapping
158	Can view SAML Property Mapping	38	view_samlpropertymapping
159	Can add SAML Provider	39	add_samlprovider
160	Can change SAML Provider	39	change_samlprovider
161	Can delete SAML Provider	39	delete_samlprovider
162	Can view SAML Provider	39	view_samlprovider
163	Can add SCIM Mapping	40	add_scimmapping
164	Can change SCIM Mapping	40	change_scimmapping
165	Can delete SCIM Mapping	40	delete_scimmapping
166	Can view SCIM Mapping	40	view_scimmapping
167	Can add SCIM Provider	41	add_scimprovider
168	Can change SCIM Provider	41	change_scimprovider
169	Can delete SCIM Provider	41	delete_scimprovider
170	Can view SCIM Provider	41	view_scimprovider
171	Can add scim user	42	add_scimuser
172	Can change scim user	42	change_scimuser
173	Can delete scim user	42	delete_scimuser
174	Can view scim user	42	view_scimuser
175	Can add scim group	43	add_scimgroup
176	Can change scim group	43	change_scimgroup
177	Can delete scim group	43	delete_scimgroup
178	Can view scim group	43	view_scimgroup
179	Can add Role	44	add_role
180	Can change Role	44	change_role
181	Can delete Role	44	delete_role
182	Can view Role	44	view_role
183	Can assign permissions to users	44	assign_role_permissions
184	Can unassign permissions from users	44	unassign_role_permissions
185	Can view system info	45	view_system_info
186	Can view system tasks	45	view_system_tasks
187	Can run system tasks	45	run_system_tasks
188	Can access admin interface	45	access_admin_interface
189	Can add LDAP Property Mapping	46	add_ldappropertymapping
190	Can change LDAP Property Mapping	46	change_ldappropertymapping
191	Can delete LDAP Property Mapping	46	delete_ldappropertymapping
192	Can view LDAP Property Mapping	46	view_ldappropertymapping
193	Can add LDAP Source	47	add_ldapsource
194	Can change LDAP Source	47	change_ldapsource
195	Can delete LDAP Source	47	delete_ldapsource
196	Can view LDAP Source	47	view_ldapsource
197	Can add OAuth Source	48	add_oauthsource
198	Can change OAuth Source	48	change_oauthsource
199	Can delete OAuth Source	48	delete_oauthsource
200	Can view OAuth Source	48	view_oauthsource
201	Can add User OAuth Source Connection	49	add_useroauthsourceconnection
202	Can change User OAuth Source Connection	49	change_useroauthsourceconnection
203	Can delete User OAuth Source Connection	49	delete_useroauthsourceconnection
204	Can view User OAuth Source Connection	49	view_useroauthsourceconnection
205	Can add Plex Source	50	add_plexsource
206	Can change Plex Source	50	change_plexsource
207	Can delete Plex Source	50	delete_plexsource
208	Can view Plex Source	50	view_plexsource
209	Can add User Plex Source Connection	51	add_plexsourceconnection
210	Can change User Plex Source Connection	51	change_plexsourceconnection
211	Can delete User Plex Source Connection	51	delete_plexsourceconnection
212	Can view User Plex Source Connection	51	view_plexsourceconnection
213	Can add SAML Source	52	add_samlsource
214	Can change SAML Source	52	change_samlsource
215	Can delete SAML Source	52	delete_samlsource
216	Can view SAML Source	52	view_samlsource
217	Can add User SAML Source Connection	53	add_usersamlsourceconnection
218	Can change User SAML Source Connection	53	change_usersamlsourceconnection
219	Can delete User SAML Source Connection	53	delete_usersamlsourceconnection
220	Can view User SAML Source Connection	53	view_usersamlsourceconnection
221	Can add Duo Authenticator Setup Stage	54	add_authenticatorduostage
222	Can change Duo Authenticator Setup Stage	54	change_authenticatorduostage
223	Can delete Duo Authenticator Setup Stage	54	delete_authenticatorduostage
224	Can view Duo Authenticator Setup Stage	54	view_authenticatorduostage
225	Can add Duo Device	55	add_duodevice
226	Can change Duo Device	55	change_duodevice
227	Can delete Duo Device	55	delete_duodevice
228	Can view Duo Device	55	view_duodevice
229	Can add SMS Authenticator Setup Stage	56	add_authenticatorsmsstage
230	Can change SMS Authenticator Setup Stage	56	change_authenticatorsmsstage
231	Can delete SMS Authenticator Setup Stage	56	delete_authenticatorsmsstage
232	Can view SMS Authenticator Setup Stage	56	view_authenticatorsmsstage
233	Can add SMS Device	57	add_smsdevice
234	Can change SMS Device	57	change_smsdevice
235	Can delete SMS Device	57	delete_smsdevice
236	Can view SMS Device	57	view_smsdevice
237	Can add Static Authenticator Stage	58	add_authenticatorstaticstage
238	Can change Static Authenticator Stage	58	change_authenticatorstaticstage
239	Can delete Static Authenticator Stage	58	delete_authenticatorstaticstage
240	Can view Static Authenticator Stage	58	view_authenticatorstaticstage
241	Can add Static Device	59	add_staticdevice
242	Can change Static Device	59	change_staticdevice
243	Can delete Static Device	59	delete_staticdevice
244	Can view Static Device	59	view_staticdevice
245	Can add Static Token	60	add_statictoken
246	Can change Static Token	60	change_statictoken
247	Can delete Static Token	60	delete_statictoken
248	Can view Static Token	60	view_statictoken
249	Can add TOTP Authenticator Setup Stage	61	add_authenticatortotpstage
250	Can change TOTP Authenticator Setup Stage	61	change_authenticatortotpstage
251	Can delete TOTP Authenticator Setup Stage	61	delete_authenticatortotpstage
252	Can view TOTP Authenticator Setup Stage	61	view_authenticatortotpstage
253	Can add TOTP Device	62	add_totpdevice
254	Can change TOTP Device	62	change_totpdevice
255	Can delete TOTP Device	62	delete_totpdevice
256	Can view TOTP Device	62	view_totpdevice
257	Can add Authenticator Validation Stage	63	add_authenticatorvalidatestage
258	Can change Authenticator Validation Stage	63	change_authenticatorvalidatestage
259	Can delete Authenticator Validation Stage	63	delete_authenticatorvalidatestage
260	Can view Authenticator Validation Stage	63	view_authenticatorvalidatestage
261	Can add WebAuthn Device	64	add_webauthndevice
262	Can change WebAuthn Device	64	change_webauthndevice
263	Can delete WebAuthn Device	64	delete_webauthndevice
264	Can view WebAuthn Device	64	view_webauthndevice
265	Can add WebAuthn Authenticator Setup Stage	65	add_authenticatewebauthnstage
266	Can change WebAuthn Authenticator Setup Stage	65	change_authenticatewebauthnstage
267	Can delete WebAuthn Authenticator Setup Stage	65	delete_authenticatewebauthnstage
268	Can view WebAuthn Authenticator Setup Stage	65	view_authenticatewebauthnstage
269	Can add Captcha Stage	66	add_captchastage
270	Can change Captcha Stage	66	change_captchastage
271	Can delete Captcha Stage	66	delete_captchastage
272	Can view Captcha Stage	66	view_captchastage
273	Can add Consent Stage	67	add_consentstage
274	Can change Consent Stage	67	change_consentstage
275	Can delete Consent Stage	67	delete_consentstage
276	Can view Consent Stage	67	view_consentstage
277	Can add User Consent	68	add_userconsent
278	Can change User Consent	68	change_userconsent
279	Can delete User Consent	68	delete_userconsent
280	Can view User Consent	68	view_userconsent
281	Can add Deny Stage	69	add_denystage
282	Can change Deny Stage	69	change_denystage
283	Can delete Deny Stage	69	delete_denystage
284	Can view Deny Stage	69	view_denystage
285	Can add Dummy Stage	70	add_dummystage
286	Can change Dummy Stage	70	change_dummystage
287	Can delete Dummy Stage	70	delete_dummystage
288	Can view Dummy Stage	70	view_dummystage
289	Can add Email Stage	71	add_emailstage
290	Can change Email Stage	71	change_emailstage
291	Can delete Email Stage	71	delete_emailstage
292	Can view Email Stage	71	view_emailstage
293	Can add Identification Stage	72	add_identificationstage
294	Can change Identification Stage	72	change_identificationstage
295	Can delete Identification Stage	72	delete_identificationstage
296	Can view Identification Stage	72	view_identificationstage
297	Can add Invitation Stage	73	add_invitationstage
298	Can change Invitation Stage	73	change_invitationstage
299	Can delete Invitation Stage	73	delete_invitationstage
300	Can view Invitation Stage	73	view_invitationstage
301	Can add Invitation	74	add_invitation
302	Can change Invitation	74	change_invitation
303	Can delete Invitation	74	delete_invitation
304	Can view Invitation	74	view_invitation
305	Can add Password Stage	75	add_passwordstage
306	Can change Password Stage	75	change_passwordstage
307	Can delete Password Stage	75	delete_passwordstage
308	Can view Password Stage	75	view_passwordstage
309	Can add Prompt	76	add_prompt
310	Can change Prompt	76	change_prompt
311	Can delete Prompt	76	delete_prompt
312	Can view Prompt	76	view_prompt
313	Can add Prompt Stage	77	add_promptstage
314	Can change Prompt Stage	77	change_promptstage
315	Can delete Prompt Stage	77	delete_promptstage
316	Can view Prompt Stage	77	view_promptstage
317	Can add User Delete Stage	78	add_userdeletestage
318	Can change User Delete Stage	78	change_userdeletestage
319	Can delete User Delete Stage	78	delete_userdeletestage
320	Can view User Delete Stage	78	view_userdeletestage
321	Can add User Login Stage	79	add_userloginstage
322	Can change User Login Stage	79	change_userloginstage
323	Can delete User Login Stage	79	delete_userloginstage
324	Can view User Login Stage	79	view_userloginstage
325	Can add User Logout Stage	80	add_userlogoutstage
326	Can change User Logout Stage	80	change_userlogoutstage
327	Can delete User Logout Stage	80	delete_userlogoutstage
328	Can view User Logout Stage	80	view_userlogoutstage
329	Can add User Write Stage	81	add_userwritestage
330	Can change User Write Stage	81	change_userwritestage
331	Can delete User Write Stage	81	delete_userwritestage
332	Can view User Write Stage	81	view_userwritestage
333	Can add Tenant	82	add_tenant
334	Can change Tenant	82	change_tenant
335	Can delete Tenant	82	delete_tenant
336	Can view Tenant	82	view_tenant
337	Can add Blueprint Instance	83	add_blueprintinstance
338	Can change Blueprint Instance	83	change_blueprintinstance
339	Can delete Blueprint Instance	83	delete_blueprintinstance
340	Can view Blueprint Instance	83	view_blueprintinstance
341	Can add group object permission	84	add_groupobjectpermission
342	Can change group object permission	84	change_groupobjectpermission
343	Can delete group object permission	84	delete_groupobjectpermission
344	Can view group object permission	84	view_groupobjectpermission
345	Can add user object permission	85	add_userobjectpermission
346	Can change user object permission	85	change_userobjectpermission
347	Can delete user object permission	85	delete_userobjectpermission
348	Can view user object permission	85	view_userobjectpermission
349	Can add User	86	add_user
350	Can change User	86	change_user
351	Can delete User	86	delete_user
352	Can view User	86	view_user
353	Reset Password	86	reset_user_password
354	Can impersonate other users	86	impersonate
355	Can assign permissions to users	86	assign_user_permissions
356	Can unassign permissions from users	86	unassign_user_permissions
357	Can add Property Mapping	87	add_propertymapping
358	Can change Property Mapping	87	change_propertymapping
359	Can delete Property Mapping	87	delete_propertymapping
360	Can view Property Mapping	87	view_propertymapping
361	Can add source	88	add_source
362	Can change source	88	change_source
363	Can delete source	88	delete_source
364	Can view source	88	view_source
365	Can add user source connection	89	add_usersourceconnection
366	Can change user source connection	89	change_usersourceconnection
367	Can delete user source connection	89	delete_usersourceconnection
368	Can view user source connection	89	view_usersourceconnection
369	Can add Token	90	add_token
370	Can change Token	90	change_token
371	Can delete Token	90	delete_token
372	Can view Token	90	view_token
373	View token's key	90	view_token_key
374	Can add provider	91	add_provider
375	Can change provider	91	change_provider
376	Can delete provider	91	delete_provider
377	Can view provider	91	view_provider
378	Can add Group	92	add_group
379	Can change Group	92	change_group
380	Can delete Group	92	delete_group
381	Can view Group	92	view_group
382	Can add Application	93	add_application
383	Can change Application	93	change_application
384	Can delete Application	93	delete_application
385	Can view Application	93	view_application
386	Can add Authenticated Session	94	add_authenticatedsession
387	Can change Authenticated Session	94	change_authenticatedsession
388	Can delete Authenticated Session	94	delete_authenticatedsession
389	Can view Authenticated Session	94	view_authenticatedsession
390	Can add License	95	add_license
391	Can change License	95	change_license
392	Can delete License	95	delete_license
393	Can view License	95	view_license
394	Can add License Usage	96	add_licenseusage
395	Can change License Usage	96	change_licenseusage
396	Can delete License Usage	96	delete_licenseusage
397	Can view License Usage	96	view_licenseusage
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: authentik_blueprints_blueprintinstance; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_blueprints_blueprintinstance (created, last_updated, managed, instance_uuid, name, metadata, path, context, last_applied, last_applied_hash, status, enabled, managed_models, content) FROM stdin;
2024-06-19 00:55:11.86539+00	2024-06-19 00:55:34.549235+00	\N	44de8ece-073c-4717-a1e8-b11c9a424b9b	Default - Invalidation flow	{"name": "Default - Invalidation flow", "labels": {}}	default/flow-default-invalidation-flow.yaml	{}	2024-06-19 00:55:34.549238+00	a143bf2b9a1d20e2078389f7c37d213e51c52ea6a8df8f8ae7a7e6a1bb129ec4b862803aa44b8b1dbfe727e98e45cedac7a1a03632065040c87f045dcabab86a	successful	t	{}	
2024-06-19 00:55:11.867453+00	2024-06-19 00:55:34.566722+00	\N	e4aded0c-bf93-479a-9038-70282863a40d	Default - Provider authorization flow (implicit consent)	{"name": "Default - Provider authorization flow (implicit consent)", "labels": {}}	default/flow-default-provider-authorization-implicit-consent.yaml	{}	2024-06-19 00:55:34.566725+00	2321088d922a57fdb741f6857eb48d3090210b552a6ecadf9b08de4832f574c5231f37943da3dfda3a4fa07c900d236ace3d237710e2e986a207c758859c1ecb	successful	t	{}	
2024-06-19 00:55:11.866601+00	2024-06-19 00:55:34.57598+00	\N	482da55a-0a77-49a0-ac09-1880127db303	Default - Provider authorization flow (explicit consent)	{"name": "Default - Provider authorization flow (explicit consent)", "labels": {}}	default/flow-default-provider-authorization-explicit-consent.yaml	{}	2024-06-19 00:55:34.575983+00	598eee861d8814c0dc200542f59e5d8085c140f7131e87a9fc6baf688a3e9e7b0a32e865c439084f76b11992ce056be574e5aba2664375cee287206d66d345c9	successful	t	{}	
2024-06-19 00:55:11.853218+00	2024-06-19 00:55:34.449475+00	\N	4c8e762e-f32a-4375-b1d3-fc263b106b4b	Default - Tenant	{"name": "Default - Tenant", "labels": {}}	default/default-tenant.yaml	{}	2024-06-19 00:55:34.449477+00	65a18916f00bcac6bb8a2fb5d05f891eb1473ef262d4d9c78afeba012efbaf1330c2141923f7ffade17472be0c19b9f0b53b40f46e66f07a35bb6d2c00922aee	successful	t	{}	
2024-06-19 00:55:11.861696+00	2024-06-19 00:55:34.483668+00	\N	48b4c865-1b45-4526-aa70-1c6bcfc182b4	Default - Static MFA setup flow	{"name": "Default - Static MFA setup flow", "labels": {}}	default/flow-default-authenticator-static-setup.yaml	{}	2024-06-19 00:55:34.483671+00	552f08718b573593e1b643f47734a1c185d7bc9efbea9c8d3dc49e6fd5060cd979098637fa20d958f4c3c9ff375e0fde3b871c956b87ebfbb1fb9319ba073bcb	successful	t	{}	
2024-06-19 00:55:11.862983+00	2024-06-19 00:55:34.513729+00	\N	d4d6ed94-ee35-4a70-b28c-765be222bd7c	Default - TOTP MFA setup flow	{"name": "Default - TOTP MFA setup flow", "labels": {}}	default/flow-default-authenticator-totp-setup.yaml	{}	2024-06-19 00:55:34.513731+00	43d2dcce568cbbe0f5409f52e2250ce4aa28ca34049cfc6f284070a2c28f81e85bb11fcf797f171beb1cb7aa15d70f26175ba9010b615563cac6057fc2563104	successful	t	{}	
2024-06-19 00:55:11.860221+00	2024-06-19 00:55:34.520834+00	\N	1060759c-03a4-42dc-ba37-afca253f416c	Default - Authentication flow	{"name": "Default - Authentication flow", "labels": {}}	default/flow-default-authentication-flow.yaml	{}	2024-06-19 00:55:34.520836+00	4a184d3cf46bcc05e3e6e2428b1100877d3b3a6ddf934a936d65f26ef81bc5cfb5481cf3128217ee3bbf4d1a83060f4b0c7b43a88546827b9e65fdaa361e8259	successful	t	{}	
2024-06-19 00:55:11.864206+00	2024-06-19 00:55:34.546289+00	\N	15ed716d-3468-4611-9d7c-f8bcc2c499f7	Default - WebAuthn MFA setup flow	{"name": "Default - WebAuthn MFA setup flow", "labels": {}}	default/flow-default-authenticator-webauthn-setup.yaml	{}	2024-06-19 00:55:34.546291+00	67ef724536f41c451b9a88edd01100bd9ba4460f41b88f86a1385f9df30617371d0ddb610526b0a93aa32b9918475a63db03dfcf57bf7d0b02e7b509f9d35870	successful	t	{}	
2024-06-19 00:55:11.857+00	2024-06-19 00:55:34.147519+00	\N	a3fc2ba2-2106-4960-8133-f50aa559455c	Default - Events Transport & Rules	{"name": "Default - Events Transport & Rules", "labels": {}}	default/events-default.yaml	{}	2024-06-19 00:55:34.147522+00	bbee0ba3e8e51ea5290dbb2081c7c0a18f633766ff8f43c8897d68d0ea51b648cdffb345239b55cbab72d041972e80aea793d8a7a379f25aca02882f9fbf94ff	successful	t	{}	
2024-06-19 00:55:11.870315+00	2024-06-19 00:55:34.619696+00	\N	63ddb610-ec4c-456c-859f-dc8d97a4d8e8	Default - Source authentication flow	{"name": "Default - Source authentication flow", "labels": {}}	default/flow-default-source-authentication.yaml	{}	2024-06-19 00:55:34.619698+00	d86613f21394af35d554692e9868e7e714bb7cbd99a362ef3b64476edc1ffcb832443610f193d3d116685a360a1734482a7152b6b6bc8913f45be9aac3934233	successful	t	{}	
2024-06-19 00:55:11.877662+00	2024-06-19 00:55:34.70105+00	\N	47b36601-f254-46ae-b1d1-711ad8bf3fea	Default - User settings flow	{"name": "Default - User settings flow", "labels": {}}	default/flow-default-user-settings-flow.yaml	{}	2024-06-19 00:55:34.701054+00	192e32332465563ca0ec85be2ef4057a6bb8aeb3a291503d184f66c45377caa313225dc367780ef5ea4f1c86fbddc0b7706dd4cf0a3b9f5528abc98c790a883b	successful	t	{}	
2024-06-19 00:55:11.914687+00	2024-06-19 00:55:34.829939+00	\N	423d7056-626a-4c73-8e4a-ff3c2f2a2016	System - OAuth2 Provider - Scopes	{"name": "System - OAuth2 Provider - Scopes", "labels": {"blueprints.goauthentik.io/system": "true"}}	system/providers-oauth2.yaml	{}	2024-06-19 00:55:34.829942+00	bef8877737dd0345a5e88ef83518cbcdd45b2345037f925dc51eb7097bdbd0c4e1565aacdf08ec3ce2c0b90f8bcba013fa8618ea12881062e4e59d87a2abf992	successful	t	{}	
2024-06-19 00:55:11.874115+00	2024-06-19 00:55:34.637778+00	\N	de2fb289-a2be-47eb-ba93-1450b0c479d3	Default - Source pre-authentication flow	{"name": "Default - Source pre-authentication flow", "labels": {}}	default/flow-default-source-pre-authentication.yaml	{}	2024-06-19 00:55:34.63778+00	51b6b65fb60f2f925d80b38cf173e7aa1bc00a074990e8d0b0dfaae088007ceb9051d0722f41500da309af5d0c78417dfa08a40c706203c3d6ee1eb613ad564c	successful	t	{}	
2024-06-19 00:55:11.884584+00	2024-06-19 00:55:34.770074+00	\N	cb409972-718f-468c-a365-4fea0ca83b7a	Default - Password change flow	{"name": "Default - Password change flow", "labels": {}}	default/flow-password-change.yaml	{}	2024-06-19 00:55:34.770076+00	6d7f1794e5a024d80e373fa9c9c791fa4837c690ad70d707fdf16208dec7c4b7feb490ab83f1db3e7d37f3d3ea41dfc4b06d87a221ffb208c076ff6672c27cc1	successful	t	{}	
2024-06-19 00:55:11.873237+00	2024-06-19 00:55:34.672121+00	\N	6f44c6e7-496d-4946-ba8d-243611aa54e1	Default - Source enrollment flow	{"name": "Default - Source enrollment flow", "labels": {}}	default/flow-default-source-enrollment.yaml	{}	2024-06-19 00:55:34.672123+00	09d441466d7e215601551bcd7c147616bf3794909f706c99c8fe527120d6fc612c1e4885c09bca433b97273e6a3fb10840d957bd7c898b14495a7bb245060792	successful	t	{}	
2024-06-19 00:55:11.882412+00	2024-06-19 00:55:34.804789+00	\N	32577f4f-b0e0-4b01-b867-9658deb376a1	Default - Out-of-box-experience flow	{"name": "Default - Out-of-box-experience flow", "labels": {}}	default/flow-oobe.yaml	{}	2024-06-19 00:55:34.804792+00	92a35a46db8ccbcd707c6065bf07797ab7a45406e24660d921224fb534875a2e204acf9bc65bcfc3a7b6f876414f0ee6d43669fa51244022afdf1b51aac11940	successful	t	{}	
2024-06-19 00:55:11.915654+00	2024-06-19 00:55:34.838101+00	\N	117e95c1-55eb-4763-b742-68f47a056a7c	System - Proxy Provider - Scopes	{"name": "System - Proxy Provider - Scopes", "labels": {"blueprints.goauthentik.io/system": "true"}}	system/providers-proxy.yaml	{}	2024-06-19 00:55:34.838109+00	e05899bfad26c4868f2dd91a99eaa53ce0e31595e8d89bbf50a126eb349a0993873694902347c3239ddaed872d557a5a1a62e29dc9f32a02aba5980656234fb8	successful	t	{}	
2024-06-19 00:55:11.919086+00	2024-06-19 00:55:34.860124+00	\N	91c49864-dfa1-4b73-8881-54b6b8bcd563	System - SCIM Provider - Mappings	{"name": "System - SCIM Provider - Mappings", "labels": {"blueprints.goauthentik.io/system": "true"}}	system/providers-scim.yaml	{}	2024-06-19 00:55:34.860127+00	55307bd6d933b0fab5843dd5ea78dfd7aab0cedb7f1683541c411208086932e185f4038f49c3d2311dc6725f63f8dde95f8bdd4febfdb9e8afdb397b39ca0c65	successful	t	{}	
2024-06-19 00:55:11.911381+00	2024-06-19 00:55:34.805372+00	\N	533f80ac-f6fc-4beb-8236-11c99c60e6b6	Migration - Remove old prompt fields	{"name": "Migration - Remove old prompt fields", "labels": {"blueprints.goauthentik.io/description": "Migrate to 2023.2, remove unused prompt fields"}}	migrations/migrate-prompt-name.yaml	{}	2024-06-19 00:55:34.805374+00	75617432af2bb8d9cbf74db0ba9d6ec1b123811fdb40975685386c85d8fa4046cc4749a8e6f1f3e0c1068e45bf2af73914c6ede5b3d31fa2ac3195a53b94cf43	successful	t	{}	
2024-06-19 00:55:11.913167+00	2024-06-19 00:55:34.821941+00	\N	5e8366c9-328a-4937-96af-2bc8a975a596	authentik Bootstrap	{"name": "authentik Bootstrap", "labels": {"blueprints.goauthentik.io/system": "true", "blueprints.goauthentik.io/description": "This blueprint configures the default admin user and group, and configures them for the [Automated install](https://goauthentik.io/docs/installation/automated-install).\n", "blueprints.goauthentik.io/system-bootstrap": "true"}}	system/bootstrap.yaml	{}	2024-06-19 00:55:34.821943+00	c572042434ffa2218c5a30a656cbf10c80c434f19c596cdd9bc6aa37897af3be3f0ab0a73e332ebafb72bdf8a1a15937fb62c9077b484602edf4a196b632aa45	successful	t	{}	
2024-06-19 00:55:11.917796+00	2024-06-19 00:55:34.874436+00	\N	9108ec91-2307-476a-8cf6-f7c219e7a78d	System - SAML Provider - Mappings	{"name": "System - SAML Provider - Mappings", "labels": {"blueprints.goauthentik.io/system": "true"}}	system/providers-saml.yaml	{}	2024-06-19 00:55:34.874439+00	15301d80ffa95fa0c37bc14fe3b5aaa74224a5998f82cdbd1a701ab96f05290b05dcee25df7053282c516383a6ba9890cbaac11aeca0fe1f9717f24e3d819ae3	successful	t	{}	
2024-06-19 00:55:11.921684+00	2024-06-19 00:55:34.912272+00	\N	12a035fd-0a93-4fe4-bba8-76bac15c3cd8	System - LDAP Source - Mappings	{"name": "System - LDAP Source - Mappings", "labels": {"blueprints.goauthentik.io/system": "true"}}	system/sources-ldap.yaml	{}	2024-06-19 00:55:34.912277+00	cd457d2cef04cfc24d7bbadfac35d8ee1e91b04a0a1662a18a0428e97043bdbfbe7a23b21b065d2e201c291c99f22a38b32436d76edfa86dbae3a5dc4d0ae4fc	successful	t	{}	
\.


--
-- Data for Name: authentik_policies_policybindingmodel; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_policies_policybindingmodel (pbm_uuid, policy_engine_mode) FROM stdin;
e8e2aafe-d8ce-4843-9d52-d5928092ba64	any
08b0c17d-8ded-4ee7-a1b4-3e54cb2651d5	any
dfadc4c6-039c-4db9-aeba-d747989cc1f3	any
db7a6c40-9662-432e-8207-3472cd3939bd	any
05ececf6-4943-4bb8-80c4-1e01ffd5ddf2	any
45dfe77b-bf6c-4903-b852-fae84ac14088	any
849a0b25-960d-4861-a41d-77804415d315	any
ab9239c9-5104-4403-8257-33a432a02b82	any
09337a58-8e97-4a10-8c7f-51c95001871c	any
0c84e135-41dd-41ac-b6fc-b324886a28c7	any
1122480b-af5c-4f6e-a269-4b2d45e5865f	any
e530bf9f-c8a7-4178-8add-074018a5a25b	any
05103a3f-5a71-4ace-9e29-43054ef516b4	any
d14875a2-ea3f-4df1-92ef-4020d57a02a9	any
d44dd3c4-50f3-4f13-b8cb-206f151a0504	any
f959b4e6-2464-44ca-9e48-ff59fde45036	any
890b79e5-33e4-4c58-81d2-191658e0e12d	any
b2af9d11-28bf-44a8-a493-94ccd2127640	any
07fe0a22-118a-46a9-9d30-d0cc8b5e1225	any
2d88955c-3763-42fd-8362-de43d9105605	any
4a837ff1-5459-4beb-978d-d0feb20dc0eb	any
4595a80e-796b-49d3-984d-8635eeb6310e	any
82b559a5-caa1-4904-9835-448c9ef52213	any
2d30844a-3fe1-4501-8544-c4bd5b7fa5d4	any
3b3a1803-d619-4b90-ad90-5cee034d981c	any
e2ac3347-cab3-4c1f-9dd7-bd2c8dbaee6b	any
8c709b37-1910-4926-81bf-95afb9dd42f3	any
229216fd-7424-4321-81c2-ccfa8a89261b	any
c91d3ce0-2c9c-408b-8d61-1dcc9629d9d4	any
1c7b242e-d689-42c4-acb0-71475b528560	any
66e1ee4b-deca-4602-92f5-593c920fcad2	any
8dbac640-2f02-4f23-9941-9330d52fe836	any
eabce391-672a-4e96-85c9-fd514c7d2b89	any
466b0ca0-2bf5-4b29-a473-9dc37318f0c5	any
4f7c6ed0-8c23-49be-8df7-5119d41d4d80	any
275c1d93-9354-4fff-ab35-b14369e3b207	any
577397d3-f54e-4706-981b-a31f8f8a57b2	any
495ae345-e1e3-47b0-ad6f-f77ff5b2a5dc	any
\.


--
-- Data for Name: authentik_flows_flow; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_flows_flow (flow_uuid, name, slug, designation, policybindingmodel_ptr_id, title, background, compatibility_mode, layout, denied_action, authentication) FROM stdin;
2de57b71-641b-4831-9d0f-d1c488cb74b4	Authorize Application	default-provider-authorization-implicit-consent	authorization	3b3a1803-d619-4b90-ad90-5cee034d981c	Redirecting to %(app)s		f	stacked	message_continue	require_authenticated
d31da7d3-176c-4b6d-b07c-61c79eb161a0	Authorize Application	default-provider-authorization-explicit-consent	authorization	e2ac3347-cab3-4c1f-9dd7-bd2c8dbaee6b	Redirecting to %(app)s		f	stacked	message_continue	require_authenticated
b944b781-bdc2-493b-a0a0-99a35e45379d	Welcome to authentik!	default-source-authentication	authentication	229216fd-7424-4321-81c2-ccfa8a89261b	Welcome to authentik!		f	stacked	message_continue	require_unauthenticated
079e919e-b82a-4081-a3a6-3e74f2ea281f	Welcome to authentik! Please select a username.	default-source-enrollment	enrollment	1c7b242e-d689-42c4-acb0-71475b528560	Welcome to authentik! Please select a username.		f	stacked	message_continue	none
438a0f0d-1d5e-40b1-9975-d9c10cecd1a7	Pre-Authentication	default-source-pre-authentication	stage_configuration	66e1ee4b-deca-4602-92f5-593c920fcad2	Pre-authentication		f	stacked	message_continue	none
deb5d725-c4ec-4f10-9a86-176b5dd17b07	User settings	default-user-settings-flow	stage_configuration	275c1d93-9354-4fff-ab35-b14369e3b207	Update your info		f	stacked	message_continue	require_authenticated
c932406f-003d-4aa4-85ed-527096352e11	Change Password	default-password-change	stage_configuration	ab9239c9-5104-4403-8257-33a432a02b82	Change password		f	stacked	message_continue	require_authenticated
990f2a1e-ba01-45a4-aeb2-589c780892bd	default-oobe-setup	initial-setup	stage_configuration	05ececf6-4943-4bb8-80c4-1e01ffd5ddf2	Welcome to authentik!		f	stacked	message_continue	require_superuser
0b577208-0411-499f-ab67-b42856fbacdb	default-authenticator-static-setup	default-authenticator-static-setup	stage_configuration	d14875a2-ea3f-4df1-92ef-4020d57a02a9	Setup Static OTP Tokens		f	stacked	message_continue	require_authenticated
dedfb836-3b41-45fe-89e5-615a1d091c18	Welcome to authentik!	default-authentication-flow	authentication	f959b4e6-2464-44ca-9e48-ff59fde45036	Welcome to authentik!		f	stacked	message_continue	none
23e607e1-7e59-4517-ba5c-3bdc22d752bc	default-authenticator-totp-setup	default-authenticator-totp-setup	stage_configuration	07fe0a22-118a-46a9-9d30-d0cc8b5e1225	Setup Two-Factor authentication		f	stacked	message_continue	require_authenticated
d79cfa73-4bc9-4698-af98-74e69aaa70c8	default-authenticator-webauthn-setup	default-authenticator-webauthn-setup	stage_configuration	82b559a5-caa1-4904-9835-448c9ef52213	Setup WebAuthn		f	stacked	message_continue	require_authenticated
6dd86ecb-3ba3-40a2-aae1-ae2bef07f689	Logout	default-invalidation-flow	invalidation	466b0ca0-2bf5-4b29-a473-9dc37318f0c5	Default Invalidation Flow		f	stacked	message_continue	none
\.


--
-- Data for Name: authentik_core_provider; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_core_provider (id, authorization_flow_id, name, authentication_flow_id, backchannel_application_id, is_backchannel) FROM stdin;
1	2de57b71-641b-4831-9d0f-d1c488cb74b4	EIDash	dedfb836-3b41-45fe-89e5-615a1d091c18	\N	f
\.


--
-- Data for Name: authentik_core_application; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_core_application (policybindingmodel_ptr_id, name, slug, meta_launch_url, meta_description, meta_publisher, provider_id, meta_icon, "group", open_in_new_tab) FROM stdin;
08b0c17d-8ded-4ee7-a1b4-3e54cb2651d5	EIDash	eidash				1			f
\.


--
-- Data for Name: authentik_core_user; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_core_user (id, password, last_login, username, first_name, last_name, email, is_active, date_joined, uuid, name, password_change_date, attributes, path, type) FROM stdin;
1	!QYcv9ND2sody1DFdblsb2Tl6ENt0tvUiJjVfRPJu	\N	AnonymousUser				t	2024-06-19 00:55:20.688019+00	3e9e6ebd-6130-43ce-9a3d-43bf4a967341		2024-06-19 00:55:20.688165+00	{}	users	internal
2	!Oq2w9NMuf5X2xYjFmNWQJat4mOLqULR37BOHD9O1	\N	ak-outpost-8a128d96bfd643bbba3d850ff246bd52				t	2024-06-19 00:55:24.656428+00	70e87f09-2b5f-4702-84e6-4aca48c43006	Outpost authentik Embedded Outpost Service-Account	2024-06-19 00:55:24.656572+00	{}	goauthentik.io/outposts	internal_service_account
6	pbkdf2_sha256$600000$vyY2c8N8GN7i5KPaK4Pfc5$3Gaa2hHzgxDN6RR9Uofq8tcpLMEZN4Vdg+eaRnwazEc=	2024-07-17 23:55:05.580939+00	akadmin			admin@eidash.fyko.net	t	2024-06-19 00:55:29.256566+00	53f30a52-459a-41ec-9e42-1a50b4ed8401	authentik Default Admin	2024-07-04 22:10:42.985568+00	{}	users	internal
\.


--
-- Data for Name: authentik_core_authenticatedsession; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_core_authenticatedsession (expires, expiring, uuid, session_key, last_ip, last_user_agent, last_used, user_id) FROM stdin;
2024-07-31 23:55:05.548039+00	t	a727d690-d8df-4dcc-9e97-49fc2b556e22	ed30pivst0kl2h72g5ld0m9auhy5ed1x	192.168.107.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	2024-07-17 23:55:05.548394+00	6
\.


--
-- Data for Name: authentik_core_group; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_core_group (group_uuid, name, attributes, parent_id, is_superuser) FROM stdin;
a7d3897d-f620-4dbd-8156-2448886c8ae3	authentik Admins	{}	\N	t
\.


--
-- Data for Name: authentik_rbac_role; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_rbac_role (uuid, name, group_id) FROM stdin;
\.


--
-- Data for Name: authentik_core_group_roles; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_core_group_roles (id, group_id, role_id) FROM stdin;
\.


--
-- Data for Name: authentik_core_propertymapping; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_core_propertymapping (pm_uuid, name, expression, managed) FROM stdin;
1bb93ede-10b5-4c94-ae5f-859ebcacac1d	authentik default OAuth Mapping: OpenID 'email'	return {
    "email": request.user.email,
    "email_verified": True
}	goauthentik.io/providers/oauth2/scope-email
824f08af-e8d0-40ce-bd70-e96cf6bbe0c3	authentik default OAuth Mapping: OpenID 'profile'	return {
    # Because authentik only saves the user's full name, and has no concept of first and last names,
    # the full name is used as given name.
    # You can override this behaviour in custom mappings, i.e. `request.user.name.split(" ")`
    "name": request.user.name,
    "given_name": request.user.name,
    "preferred_username": request.user.username,
    "nickname": request.user.username,
    # groups is not part of the official userinfo schema, but is a quasi-standard
    "groups": [group.name for group in request.user.ak_groups.all()],
}	goauthentik.io/providers/oauth2/scope-profile
d9471722-5913-4cff-bbd7-70d40e338f96	authentik default SAML Mapping: UPN	return request.user.attributes.get('upn', request.user.email)	goauthentik.io/providers/saml/upn
da3b3444-4b06-4a36-a936-e016bbf086ab	authentik default SCIM Mapping: User	# Some implementations require givenName and familyName to be set
givenName, familyName = request.user.name, ""
# This default sets givenName to the name before the first space
# and the remainder as family name
# if the user's name has no space the givenName is the entire name
# (this might cause issues with some SCIM implementations)
if " " in request.user.name:
    givenName, _, familyName = request.user.name.partition(" ")

# photos supports URLs to images, however authentik might return data URIs
avatar = request.user.avatar
photos = None
if "://" in avatar:
    photos = [{"value": avatar, "type": "photo"}]

locale = request.user.locale()
if locale == "":
    locale = None

emails = []
if request.user.email != "":
    emails = [{
        "value": request.user.email,
        "type": "other",
        "primary": True,
    }]
return {
    "userName": request.user.username,
    "name": {
        "formatted": request.user.name,
        "givenName": givenName,
        "familyName": familyName,
    },
    "displayName": request.user.name,
    "photos": photos,
    "locale": locale,
    "active": request.user.is_active,
    "emails": emails,
}	goauthentik.io/providers/scim/user
a4a9c3a8-361f-4bbe-814d-6051ce3be643	authentik default OAuth Mapping: Proxy outpost	# This mapping is used by the authentik proxy. It passes extra user attributes,
# which are used for example for the HTTP-Basic Authentication mapping.
return {
    "sid": request.http_request.session.session_key,
    "ak_proxy": {
        "user_attributes": request.user.group_attributes(request),
        "is_superuser": request.user.is_superuser,
    }
}	goauthentik.io/providers/proxy/scope-proxy
c05521d0-c697-447f-aca4-a8e3a7f35845	authentik default SAML Mapping: Name	return request.user.name	goauthentik.io/providers/saml/name
8f8fafad-c228-4a70-a227-fca3bb08d6a0	authentik default SCIM Mapping: Group	return {
    "displayName": group.name,
}	goauthentik.io/providers/scim/group
8c1689c2-1719-4795-b85a-46a7e7846e36	authentik default SAML Mapping: Email	return request.user.email	goauthentik.io/providers/saml/email
4add4a3e-24b7-4751-80a7-66481d2ca506	authentik default SAML Mapping: Username	return request.user.username	goauthentik.io/providers/saml/username
3475301f-f02c-458d-863e-d5caeef7c24d	authentik default OAuth Mapping: OpenID 'openid'	# This scope is required by the OpenID-spec, and must as such exist in authentik.
# The scope by itself does not grant any information
return {}	goauthentik.io/providers/oauth2/scope-openid
e4eac546-bb21-4e42-9b73-71ed1d2f73e0	authentik default SAML Mapping: User ID	return request.user.pk	goauthentik.io/providers/saml/uid
2fdc5aa6-e5fc-4c93-a4ca-378ff38bcea0	authentik default SAML Mapping: Groups	for group in request.user.ak_groups.all():
    yield group.name	goauthentik.io/providers/saml/groups
b6fa0488-a8c3-43df-a6c4-b6ab014d4813	authentik default SAML Mapping: WindowsAccountname (Username)	return request.user.username	goauthentik.io/providers/saml/ms-windowsaccountname
d7ae07d0-665d-4c17-aeb7-c9b519fa95ba	authentik default LDAP Mapping: DN to User Path	dn = ldap.get("distinguishedName")
path_elements = []
for pair in dn.split(","):
    attr, _, value = pair.partition("=")
    # Ignore elements from the Root DSE and the canonical name of the object
    if attr.lower() in ["cn", "dc"]:
        continue
    path_elements.append(value)
path_elements.reverse()

path = source.get_user_path()
if len(path_elements) > 0:
    path = f"{path}/{'/'.join(path_elements)}"
return path	goauthentik.io/sources/ldap/default-dn-path
d562c945-1eb5-40f5-a2db-ace785f68c8c	authentik default LDAP Mapping: Name	return ldap.get('name')	goauthentik.io/sources/ldap/default-name
9e3c4359-561c-4a92-9955-88d5328152be	authentik default LDAP Mapping: mail	return ldap.get('mail')	goauthentik.io/sources/ldap/default-mail
900ec8b9-0757-4ca3-9d7a-3202bd51d423	authentik default Active Directory Mapping: sAMAccountName	return ldap.get('sAMAccountName')	goauthentik.io/sources/ldap/ms-samaccountname
44078a67-e319-4e10-8948-23ff68fd5187	authentik default Active Directory Mapping: userPrincipalName	return list_flatten(ldap.get('userPrincipalName'))	goauthentik.io/sources/ldap/ms-userprincipalname
af418008-e712-46ff-bcca-d9d2a2b51eb0	authentik default Active Directory Mapping: givenName	return list_flatten(ldap.get('givenName'))	goauthentik.io/sources/ldap/ms-givenName
04b6a3c7-46cb-4abe-a49b-658e5d70e305	authentik default Active Directory Mapping: sn	return list_flatten(ldap.get('sn'))	goauthentik.io/sources/ldap/ms-sn
808ba92b-8874-48dd-a484-234897e1d96f	authentik default OpenLDAP Mapping: uid	return ldap.get('uid')	goauthentik.io/sources/ldap/openldap-uid
57f3bfdd-aab2-4979-bd50-b8d72bfda5e9	authentik default OpenLDAP Mapping: cn	return ldap.get('cn')	goauthentik.io/sources/ldap/openldap-cn
\.


--
-- Data for Name: authentik_core_provider_property_mappings; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_core_provider_property_mappings (id, provider_id, propertymapping_id) FROM stdin;
1	1	824f08af-e8d0-40ce-bd70-e96cf6bbe0c3
2	1	1bb93ede-10b5-4c94-ae5f-859ebcacac1d
3	1	3475301f-f02c-458d-863e-d5caeef7c24d
\.


--
-- Data for Name: authentik_core_source; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_core_source (policybindingmodel_ptr_id, name, slug, enabled, authentication_flow_id, enrollment_flow_id, managed, user_matching_mode, user_path_template, icon) FROM stdin;
e8e2aafe-d8ce-4843-9d52-d5928092ba64	authentik Built-in	authentik-built-in	t	\N	\N	goauthentik.io/sources/inbuilt	identifier	goauthentik.io/sources/%(slug)s	
\.


--
-- Data for Name: authentik_core_source_property_mappings; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_core_source_property_mappings (id, source_id, propertymapping_id) FROM stdin;
\.


--
-- Data for Name: authentik_core_token; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_core_token (token_uuid, expires, expiring, description, user_id, intent, identifier, key, managed) FROM stdin;
0e188c7e-5b93-4780-a08c-7b11ea077b00	2024-06-19 08:44:00.143398+00	f	Autogenerated by authentik for Outpost authentik Embedded Outpost	2	api	ak-outpost-8a128d96-bfd6-43bb-ba3d-850ff246bd52-api	IpO5jUlUBlnwg4tXmauql8I9rsaIEQ0iWxQSKucKEjcZKAh5HeAiXQ30ZXnc	goauthentik.io/outpost/ak-outpost-8a128d96-bfd6-43bb-ba3d-850ff246bd52-api
\.


--
-- Data for Name: authentik_core_user_ak_groups; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_core_user_ak_groups (id, user_id, group_id) FROM stdin;
4	6	a7d3897d-f620-4dbd-8156-2448886c8ae3
\.


--
-- Data for Name: authentik_core_user_groups; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_core_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: authentik_core_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_core_user_user_permissions (id, user_id, permission_id) FROM stdin;
60	2	21
\.


--
-- Data for Name: authentik_core_usersourceconnection; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_core_usersourceconnection (id, created, last_updated, source_id, user_id) FROM stdin;
\.


--
-- Data for Name: authentik_crypto_certificatekeypair; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_crypto_certificatekeypair (created, last_updated, kp_uuid, name, certificate_data, key_data, managed) FROM stdin;
2024-06-19 00:55:22.80026+00	2024-06-19 00:55:22.800272+00	23777475-3dc2-4373-bfba-d4bb8439d5be	authentik Internal JWT Certificate	-----BEGIN CERTIFICATE-----
MIIFHzCCAwegAwIBAgIQJ7cFTMaDQZCN+5Kpc9DLOzANBgkqhkiG9w0BAQsFADAe
MRwwGgYDVQQDDBNhdXRoZW50aWsgMjAyMy4xMC40MB4XDTI0MDYxODAwNTUyMloX
DTI1MDYxNDAwNTUyMlowVzErMCkGA1UEAwwiYXV0aGVudGlrIEludGVybmFsIEpX
VCBDZXJ0aWZpY2F0ZTESMBAGA1UECgwJYXV0aGVudGlrMRQwEgYDVQQLDAtTZWxm
LXNpZ25lZDCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAOdjHDQr6YUq
M3lOlj8Annj6M7+rtHnjcbiKkarFiN4sTE3R1kba/LOAktm6gnwTiwP9JYniOA89
xVt+rcsz6i1sky1wUfhgfXHG/yBMzWs7j1Ot4P80NYiR4N/wBQdQZ/g83M+koX42
a9kAeTiWCfCTkwdoLhl/z91PMPokjf1b/NMHbDc4FAfi1AO3Ev4zRqFn324kcjy+
l2eGCUtH9WWZmGqzw2WBWk1jMNsMUuedFuCqr2KWgAwk1f3yjR0pbBa7iWP9ZQu6
6RpgT6fBgZy1chAAv7StltjVnhgsu5QxSswHrx5eQPWmXgmtV52/qnt1K5tSlKkr
TqQWEr5QG1AfhkeGI3U/5bQTfHUOQYr5Tja9UHo8U98kFOBKTSox+jttxMe4Ciz6
IqkjbAA6iWHIIZ/MLFZ9Qhb3lN56+EBh/Gg3fiy8/kdvs8591VVRccRMRINlFldf
AyouhVvAavojREAxfl4dJ6ZF9W2HwUqAa4g0cU2nGGUk5tAvMH9IaqvtiORaM8Vt
v0pqsEP/ldzKwC5FA0av+TBrKxz7mhb2ECYR99vXIAMR6xMzW4b+YLWD15Em9TKQ
GIF04/ULbnGff/KgY1MUUckdArtdqtcaBFyCIxlFJWaIuUTBvryKvNIXcc8uY20y
NhOZLYG4ZxW60+EHWTb8z/wUcHIXujOhAgMBAAGjIDAeMBwGA1UdEQEB/wQSMBCC
DmdvYXV0aGVudGlrLmlvMA0GCSqGSIb3DQEBCwUAA4ICAQB2evXKLQnj3XPRuAvu
NRBW5Rxfu8fIVM0OcGH1RSlB9Oh0wZdw+RedrmSY2dwiQ71O9otWc1/E6pvnD9VY
AuQol2ZmcQQ7aIYQpM7DYwwCSAOeIt7sLb8upKZSPkzwfadMkTbWfxy8HDawa670
M72cBNVvIleQ0lh3fytvtnyRkPYX3e7KYrlfTPiyFjcFuArP69qsUDkyBNwaMn+b
s9C//IepNljezl6aRCxXbsRfYlNp8GztFAT3pxxQBziB+mCGMx8t2DdeRZBHyQq7
y/dE6YrSNlb/+mjWzf1uDvxurSv52d452ArEUQmVt+3afjNLH2+eUfOdz8Tby8A3
WhaJcgRr4cLAeEkIuyDHDazEmDvFcUhCAOku01vyJQjPtT3p8nt6tzuFI8NNT0px
osUVxYTNGg7N6A2r08w27pYS2vaQp1r6ajShEB1ydOAIkt3ddgVdq6lheoji8Eyf
F6EiPQP+83cd25MqqcYugJ5GApvHih9NDAP4IcRQ9IDZQrRAehLw9vFLB+PLIvW2
rHKLWmKuNRmpzRcyvsb1WJkX6gk7/BLWlW51hjFwY4C36pKi7aVhIKdOu7rCRerH
QfveS/SkWx1vhbXI4/hwCKBkCAT89dNUN2/bknxjxQVls3Nh+uoSR7dlb495Qp6t
bietxPnOjzQTeyiwg41XWvD02A==
-----END CERTIFICATE-----
	-----BEGIN RSA PRIVATE KEY-----
MIIJKAIBAAKCAgEA52McNCvphSozeU6WPwCeePozv6u0eeNxuIqRqsWI3ixMTdHW
Rtr8s4CS2bqCfBOLA/0lieI4Dz3FW36tyzPqLWyTLXBR+GB9ccb/IEzNazuPU63g
/zQ1iJHg3/AFB1Bn+Dzcz6ShfjZr2QB5OJYJ8JOTB2guGX/P3U8w+iSN/Vv80wds
NzgUB+LUA7cS/jNGoWffbiRyPL6XZ4YJS0f1ZZmYarPDZYFaTWMw2wxS550W4Kqv
YpaADCTV/fKNHSlsFruJY/1lC7rpGmBPp8GBnLVyEAC/tK2W2NWeGCy7lDFKzAev
Hl5A9aZeCa1Xnb+qe3Urm1KUqStOpBYSvlAbUB+GR4YjdT/ltBN8dQ5BivlONr1Q
ejxT3yQU4EpNKjH6O23Ex7gKLPoiqSNsADqJYcghn8wsVn1CFveU3nr4QGH8aDd+
LLz+R2+zzn3VVVFxxExEg2UWV18DKi6FW8Bq+iNEQDF+Xh0npkX1bYfBSoBriDRx
TacYZSTm0C8wf0hqq+2I5FozxW2/SmqwQ/+V3MrALkUDRq/5MGsrHPuaFvYQJhH3
29cgAxHrEzNbhv5gtYPXkSb1MpAYgXTj9QtucZ9/8qBjUxRRyR0Cu12q1xoEXIIj
GUUlZoi5RMG+vIq80hdxzy5jbTI2E5ktgbhnFbrT4QdZNvzP/BRwche6M6ECAwEA
AQKCAf89IMNqsc8kQJBCRxVz2RRrBKGqZhCfwtgtCi6OQ74MzWPuV+kyS6Tgc+JX
zILiuvPKC5T6Zqqr6OqJAvmjttG+5L6QQOqAbr1O0zH2gbojAiRM1W4DZCX5/M/z
v6BHqZS0ax/Km17INFUsvVTimU2DvCwZ+nCmiLJZcEcrTkzuPUb/JfVCZ6yjCLTW
5mtvstj0YYSqJgBbNXhTzE0+qujH/PPb/Is6XbOFjkoLetrMGLjahNa6Rn6j6d2+
rdb2q6+Q5RDYbmQrdsC7GLm/Qv42CcyNMPJBJ6FNiq57CuMWgcJidGugq89tfJSL
UFTW3LO+03PzUxwcm2kcxqTc/wmEeLX9vj7y/4+Q0Ay9w0ie0FaYhHRyZ4t92/zh
2SvhqXiOeZbZU04tQcpjqo6Nt+D0LIrmpF545H3GXXSSuViADms9nbeBGwYCaCS4
v8dnIQTyJmm0bGojfOUa/IrXLHR/rpDf4L9zgD+pOoFzAURjBT4By3j51knpcTn6
gGqQdAObts8kiywRD0fbVHsnWi8+fkkiOhgnXTnSQNl698Va93MHSgS432icTwlf
to//acUzz0PnF+zb0aT0sN9uVMX5TcR7TPb1FRB07/VF8puKLPqrgKovs2ZIZDT4
u7Mnh2kfE9VwpZ3lrkM2gvzEUb/2SQdWEobKSdietW4KH5KBAoIBAQD1UjsRG4xf
vWhjjs/iiBZltrgSuv9Wr0y3N5EM1l6a85UG85aj1ihWjDNfq+eyUNLh+WD+/iMr
146olZLwj5Rde5AD8HNYYvlHf0j9LXUMQANBEVaBVEYNC36+5ZcKepItu330cAHR
LNbzEs9JKRPY9d7sMDO7dz1f/2EdBVrtmWq0pWD4G3Uc2Shv5bms6fatO9tfm8ur
L/WtgDOW0apjB5lXTpA+wAjhzYsXFUq4Kgec/5M6+HbW5H15DasHzDvxMWtrkJw7
5Imy5MuWGlnpbFE8N43bVMG7RGRDxMZ8f7eEjaqiaFQKRyHibgdSOD0dYGPHRpqn
f8XU7ovZuHUhAoIBAQDxdZp1gXHOBXdLRvxBIokY5NfDchrh44QkyUegn5YppbOY
NOnEM0C01uTV3O41P9UIqe/j4yCz8k8gocwUf59ymtT+Uay475CRYGSxme8lDeOz
Lv5JxIeNUNxoIhFA9+pWtjprVynW3+mxmEBgvdxIAl4rur3bA4EgDcyB1DX0FTo1
G8rp24WXSm0rsL567xmzs5WWNdlJO+Hj8Bnxxy1WVW6oE/jx8dfRit9WW7kQ8G2U
06O0qhbBu27mvpJ8jjM2ZRr/j1SbQrqYEyfx16bR2BoawVuEvl8L55FApT4UPPXm
7XHo295gRdbdhZMGbJ2rR1t2lEExwpa0qT+uE26BAoIBAQDMnvI1qszDbrELmas8
QFauMGII/YDNRRqwF+Ec3BG9HT9ItRUJQzASQI75VeHEkjXT1rZY+pFLmFidtWUC
0j/mWZIeNwl+x881G649vxTKSvpr45JL/YcQim4FvGrniqUzEBhXMrXRS51e0mmj
lGfBqBNw3iPIUgUXdWQDWNwnIrgmRWtEh2J/1YItE2h0GhJvHGY2sTSIbVB2j2B4
hBmi0EvOzvDx5iuCbHd/oXrZcfU3ttWPcn9tbthZiFUIBApbe+Ulq1Elg9J3LO/D
G+ezE24O1Ce2slOFZ95ZyF/mqIDiR2f0XyD6EarpuuzQX6haQHP5W6LT43eXzAFK
cNkBAoIBAGwyjacv/QYbruwdf/XT+ukbyo969w7Xu6QcSatxN4GsDcEbnNDdQpaG
YP5wRJG568U5GRTd9w6LeuedeOyKj7F0LhNUF/i66OYr8pMe7mmFQs5NNYdquG8b
l9hVw7OAJBL9D0qAQXBW38pD9j0jdq0R2o7v3BljBZ6OcGCQ7ihUxsN7k76dLsyv
fiIAzioaMEM1Ksenk5lcawmP0qBj5y3zlGVepcQM4e+0sgVpjpFHm2MAPzA6s33W
doiRRuTnd41dWu6/lGMKUMDKfLDDOK55jqEEmfTutXqJJq54HUxGUM5NAikdNRWg
1fpn240aaMCSdiq5nkkk8BE+chmX/YECggEBANP0Q2XvpwmwnexAM9IlvX6suFEE
KOTQGRvVY+8JCFkd0Jc7shuVDQXsoeRR937ibjkbmedG8aYijuOg0qBLqayVoh3X
bFvPFepidG/XfQbfU6NXgzqedTE1lS8SUiu1WCoJEpuSGkvZgbFKutpkDLfy06en
HNhCgy3NsFlro+wyuTHuTdFxZsUwJolyY8muatZGL/T6k8o3MlC5sfbq+nJ1Cvqy
OcOfvrMESAtjh3G3cctCttMplCgf1f9o3FdW9AtQc7uYObECrlJs9co+3Nbs0xNI
YEVS/sfqv4FjumkJJjvQxR8f3/ZqjgPsHuHRwZLubeHPm+khOWEd/HDdk6I=
-----END RSA PRIVATE KEY-----
	goauthentik.io/crypto/jwt-managed
2024-06-19 00:55:23.282131+00	2024-06-19 00:55:23.282143+00	ba84ad03-3078-45f7-92ec-2864f00a6029	authentik Self-signed Certificate	-----BEGIN CERTIFICATE-----
MIIFVDCCAzygAwIBAgIRAL7NpOxhY04YgHxeflTvsrYwDQYJKoZIhvcNAQELBQAw
HjEcMBoGA1UEAwwTYXV0aGVudGlrIDIwMjMuMTAuNDAeFw0yNDA2MTgwMDU1MjNa
Fw0yNTA2MTkwMDU1MjNaMFYxKjAoBgNVBAMMIWF1dGhlbnRpayBTZWxmLXNpZ25l
ZCBDZXJ0aWZpY2F0ZTESMBAGA1UECgwJYXV0aGVudGlrMRQwEgYDVQQLDAtTZWxm
LXNpZ25lZDCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALyGgxYIpTHS
MmHZitBat1ttj4R8OwyjsE6sSlsPp4mBjW54LpujcxEy70MU7PSGFCKbSubNZYML
DE5SkWdN5FSJQqsOQ6AvYHdvLxKv3AyTlgV/pX5sIqO9Jr58PUPcVFekCRCLa2ic
UCiKGNtMYRcWuPsctc4BDbtgv510S19Qw+7zReYmX2n4vjsXh5sSynsnS9epimDr
JnCkDbpG/fVGRNGBn9F4yo3DXrvUyrX1Nmsjj//GdX6OzmT3+23+pWca1Qx6kUtx
v3kHgeZLRKL4yI6sqWYcIcbho3uLHQhzFcgH6vb4xaLbAZ7il1//yEZL3Fetgw4l
wdksNuKnB8WjOC1PxUsrw9ZMhKWiNuKNi2WKhRXdoRrAaTNQuiyWhGsBopP8fEX2
zRBGprgo7QLq+lqhheZX0/UrD48kpBEDTjIunotNrR4R8cD1WxsyEIysoMifH9ts
3WaLJVDGOC0d7P64TQQ3TCX3pfKPZPPhUkl5yZjnB4Nywrta2k2PWMwuAAzcpRA6
ASxBT8lHmjNrdzgPiyIFKDkPIIRMnyhqw+KPd2XPsxkIFq3A3FIJVd09mzlbUtyn
viuQH3YAV9vrcMrPj0QYs2IWHXWwINpDz3AZAmdgbEvPKlmcmxag0hCx1/nu74sR
lOgN3QLdSValB0AJu6B6gsDpMbv1DvbPAgMBAAGjVTBTMFEGA1UdEQEB/wRHMEWC
Q0t4MGRsRk9HMTJ0QmRZMzMzWU5COWpmbTdmZ1hqNE40OXI1amw3eUQuc2VsZi1z
aWduZWQuZ29hdXRoZW50aWsuaW8wDQYJKoZIhvcNAQELBQADggIBAAT6Xd8R9nUr
VJFImsWR5LC8NxJTK43BRJE0ztnFTCforJsvPQQh0t+ZE7mZxXHIuP13J6zYYsrY
qUz2LCljSBC0FAeMn8dc1ELGIRIRghQNHJhSibCLeDYZyPWu6u1I9N0EZLTn+64S
uIV6oHoZxbGiTAVEo7mTCtM8P3UA7LIXnmMg8hgSEy6EOCkWIGwASvGGmVsGH602
LVnEaet9zbz/7bpGkDgjnxxFuSQLUuMqOlbPfVMeLKKLL5EroEV9kt//BE93hSEl
PGbFZJEbNDMbcOsP10A3XPrKlh1MjdKBg+Bv8DiHlyKZGkA3WkM0Fw9grU8503s5
AzwBa0Jr0JieUNNY7FT1LKexzUA0EgUyuMCsJaaZiPyp0hHkJFssLrUvajwRgDQS
qknFrh9aXDDpYbyISkAlW2qyZ0fiKW0rsYT6BQZxAa6V0N88F32c2b35pc9+MRu3
+rNEh46pCq8rycUnXG0TA3IJqMJIPm273NJXKwjXVQadmYBDBpLOX/11utzghjII
dKuZBO8H5wR9KU8nP8WIXgcqKmfl+QzIbdbYqNjQ33HRGE7WPyyR68brVy5RKzNU
cpsd065t1p/O/UhL6hCLaK0HcyS6MCH1rE3+zyuVkODgoX2IxduRdzF9nODowrAo
0SjH28BCIdTyGrEm4KoTECbu16bgspZ+
-----END CERTIFICATE-----
	-----BEGIN RSA PRIVATE KEY-----
MIIJKgIBAAKCAgEAvIaDFgilMdIyYdmK0Fq3W22PhHw7DKOwTqxKWw+niYGNbngu
m6NzETLvQxTs9IYUIptK5s1lgwsMTlKRZ03kVIlCqw5DoC9gd28vEq/cDJOWBX+l
fmwio70mvnw9Q9xUV6QJEItraJxQKIoY20xhFxa4+xy1zgENu2C/nXRLX1DD7vNF
5iZfafi+OxeHmxLKeydL16mKYOsmcKQNukb99UZE0YGf0XjKjcNeu9TKtfU2ayOP
/8Z1fo7OZPf7bf6lZxrVDHqRS3G/eQeB5ktEovjIjqypZhwhxuGje4sdCHMVyAfq
9vjFotsBnuKXX//IRkvcV62DDiXB2Sw24qcHxaM4LU/FSyvD1kyEpaI24o2LZYqF
Fd2hGsBpM1C6LJaEawGik/x8RfbNEEamuCjtAur6WqGF5lfT9SsPjySkEQNOMi6e
i02tHhHxwPVbGzIQjKygyJ8f22zdZoslUMY4LR3s/rhNBDdMJfel8o9k8+FSSXnJ
mOcHg3LCu1raTY9YzC4ADNylEDoBLEFPyUeaM2t3OA+LIgUoOQ8ghEyfKGrD4o93
Zc+zGQgWrcDcUglV3T2bOVtS3Ke+K5AfdgBX2+twys+PRBizYhYddbAg2kPPcBkC
Z2BsS88qWZybFqDSELHX+e7vixGU6A3dAt1JVqUHQAm7oHqCwOkxu/UO9s8CAwEA
AQKCAgAPbrnV8k858zyWL5PiPaRub45YCHNgM+YZPcrrn8eiXsb2snZEqofScjQn
CAd9qZwfjE0zwSYvwmL3f/rQu6eW4/jF8YNhRLLFrbkeWbCbUIy8I0unPBYTbhOs
QPwi5sTHIXGi6q0xzkBUxGxuFAqLZ7WTMmTcWdAhKDWHUuwrzHvwvsLyD1VJyRSJ
cc7ZlIHOvKDD8egwY6kTf3QNBtKzL7vI13uY6IwF0gBnQwjbbEwc6R3yKiTKf2L8
RCO1rveLQSVywaj/+NSO68M02H4XeS+xvjoy8AqaMgGLLRAej1n954GfrGDa7y9q
xwTtO6fOJiRoNcpZb7qdAU/2ep9zTwNCkEK2KYxnUwcL6W3O13qZwxLOHGf5E9Ug
aImjaG0VUbIVLC/A9/lxDYdtZ/woFZLOdSRJXMyIabHWNodoklphUiLJ78aF0eWZ
gJPQipOAP4aQ+Y0tHGASo0bqUb5G4X8MH1S1uPK2GscePmGXuH1Qigl0Rf0rZUa0
PNv1Gy+WyB4zlyt8Vx6VNKUPBjLqiqOwke/F1s5MoEcWZtp6Ji9XhI634MChG1YO
HuyDebEER9JtI36bBjgM2UVSUGsmEbMaX+NL2c0f38f8rRuV1GZo2VuKb2QNKi9P
9zDg0+hCQA3u0Inw44iQJs9HQsyRrOYjXnNrW8zx1PuuhY8swQKCAQEA7bdab37P
BjnS6+5P0etPepQAGaZenMUA9suo+ofhiW13iwA4G+Q/1Aeb/bRffd9jk96SRCeB
GzNnjDDAbUPbMTVCQlqiCs4ShVp2dX0lYiFa5L5alN01lzazlINWqx1yIXZhR1IN
beZQQZBrQ8RSvWbNyBs3o93w2IXizy7PeUu0ItCTbZoF7h5LEW3y2gKjHOijxkTH
h09xNHcYTpzZ4al2XZ2Hv5h577/vcnV/Shupdbv/kAJm+NnltWVFo1Z5bckOUdn1
snTapbHPxYVONfJNj8hUKzkPmTWovaQbGkySKQZJWLKbeI9puXY//WJSZRxXLWvH
YmP8MTWvHApU7QKCAQEAywaW2Zw5cWJsJ+/xntCjite6c9vVmg0VosNIooZRhMhE
Egi4pfOM1FJYsg6buyosgR2TTeQ7MVn8kI/d0OnpT40x5we0w1h6sa+2nv4z4oYA
skH+3pmserNYBiJIVS2PGJUdohwWbkrGozShX6OLgqiNSRBDqlFv+c2vYDe6rBU+
62pQyd3nIK+E4Q7I/OJGScFGXsn9pFvJEToqz8aNuKyWw6+9aRp01lYjsJ046Xad
fB5b8f9e7gnrZL10Hei4OqQHoQQ52N/tqod0qCvIrSfcE5d/oxAgRk9eLfI/ei1m
AuStrqJCjripploGzYxnvUreQhE7PZflOlsDs/IfKwKCAQEAnLeScYsCZTJd8Zjt
GpGtljxYTJC4M1ZVql7eCjzm3blDZGpCk3DI+7oAhyQRCGTruyKy/yekIBClpXDG
i8J+kVRxWFl0FveAklXvXsmgia8/wyoTgazMleJERhbIXotNIO5wd5qKq/d41aCm
dsjJW4CZDeGTrv60t6qcusY7ldXo7kLfzxQJ8NAb4WPBBSVT780Xm7Dgcj5XfaU+
ayVRJ0qXdGRUiGW3je3VqHn57xuJfsrwUzqiNFFC9XHMlUB/UXeJb0DokDwlobM2
LRwTUdFqfO4vP0ehFvqfQlccXxw4B7/TPxyRDsxNgS2KRjw54drrRlCV5DHSo4am
6S+OiQKCAQEAmqVqQle9aaCOwd0DLvW9nQS2AYpyKeXNlS0rJqEpdvsU3qfF/qKF
ozUWWorGFMsLG05r5ejzLaRdvb/YNkn2baIfYNt91U6QJsixUmpPGzz3StD6UpS7
zLrPUdzLPBZ36UGsUM8URu6uX6K3SSJKIjxBYmYBJLrjkGQcMi5BAtMsGiXhY+Kj
K0KG9OdOMVIqOAQAljNGAOvpPDYSZjHXwdO1A1nZ7TU5ygnTJbScpTi0vNZjMvJS
XP8xTosA58dcjU5kgUG2znvDjSGgunifY0X5XPMJRiwCaYwLMPRVZbsu+QU3Rs5R
5GTE1PG+PNO2MXnV0n1Nop0Q/mJVb7v+AQKCAQEAvHb/6g/9REpnAaiUviLOF2Ms
Vs13/DKjz114VMnEoUZMKPfa+sb6lBzRQNEpSBe5bdIBCHrnAIGfKUJuhk/ACSlq
/pk4ZyhceV0859gGnGn7MBthXHpvejDqzeJl/zshG0yLjdNzERN/fdTTDML0xDkV
WD5L4vUf56UJy5rLH+3pHs6/WtBKvkHRvMsZ9kYfgiz8lUmhDT+2K1GE3H614QAA
as2Sk2tmanDzJbK1zo/C5zzUiU1qxG/3mnMKaI0DxEVnqDkDmUDg3wcSYCpwsp0f
19HZ4CrqEIEzV6noecPEAcDa6XRpZmG0GQcGRV8OuUAa4tg3+6tMbHzG9QfvKA==
-----END RSA PRIVATE KEY-----
	\N
\.


--
-- Data for Name: authentik_enterprise_license; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_enterprise_license (license_uuid, key, name, expiry, internal_users, external_users) FROM stdin;
\.


--
-- Data for Name: authentik_enterprise_licenseusage; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_enterprise_licenseusage (expiring, expires, usage_uuid, user_count, external_user_count, within_limits, record_date) FROM stdin;
t	2024-09-17 02:47:00.056304+00	b1f4941e-4a8f-4b2a-8d68-157a5aeb9176	1	0	f	2024-06-19 02:47:00.057777+00
t	2024-09-17 16:22:36.517329+00	482fe151-ca8a-4107-a6d8-b390d92c1281	1	0	f	2024-06-19 16:22:36.51774+00
t	2024-09-18 00:47:00.091506+00	cfe26234-3464-416b-b9c9-c00107c9aca1	1	0	f	2024-06-20 00:47:00.093084+00
t	2024-09-18 09:03:52.180392+00	868518d0-bc4c-4d31-8505-f561b185c761	1	0	f	2024-06-20 09:03:52.180968+00
t	2024-09-18 17:42:05.810023+00	58679973-dab6-410a-817b-f8ca30ca5496	1	0	f	2024-06-20 17:42:05.810151+00
t	2024-09-19 02:47:00.058353+00	4ac283da-4ca1-400f-8991-d85827540cc1	1	0	f	2024-06-21 02:47:00.060025+00
t	2024-09-19 15:39:53.562643+00	7a8b6c38-6828-43c7-ba02-0ad581444c6e	1	0	f	2024-06-21 15:39:53.563045+00
t	2024-09-20 01:23:07.826703+00	1177c3cf-800a-4d1f-a072-751970e3c0f9	1	0	f	2024-06-22 01:23:07.826837+00
t	2024-09-20 10:47:00.047085+00	231dd801-bd7c-4483-bd98-053524fcabee	1	0	f	2024-06-22 10:47:00.048662+00
t	2024-09-20 18:49:11.75108+00	fc291990-d7c9-4a70-b4cb-a6b34685f8ed	1	0	f	2024-06-22 18:49:11.751474+00
t	2024-09-21 04:47:00.186937+00	c75b0906-d5b7-498a-ba91-90bf2723f3a0	1	0	f	2024-06-23 04:47:00.187229+00
t	2024-09-22 00:35:32.167858+00	c13783f4-fcf3-46a3-a876-8aa8a7700fae	1	0	f	2024-06-24 00:35:32.168174+00
t	2024-09-22 10:53:36.622634+00	2daed3b7-6078-48ba-a7a0-b8a9b10d9121	1	0	f	2024-06-24 10:53:36.62286+00
t	2024-09-22 20:47:00.061012+00	bf003002-d028-4a73-b206-92391aafad83	1	0	f	2024-06-24 20:47:00.061545+00
t	2024-09-23 04:47:00.090626+00	7b78679d-a2ed-4045-8608-f776b26a2111	1	0	f	2024-06-25 04:47:00.091681+00
t	2024-09-23 17:00:36.736719+00	cd0c2568-413a-4c7d-9704-d5c7bd54bff1	1	0	f	2024-06-25 17:00:36.737024+00
t	2024-09-24 17:12:48.357409+00	b571a4e6-60db-4e44-9183-15cd4563c9fc	1	0	f	2024-06-26 17:12:48.35759+00
t	2024-09-25 03:03:48.71472+00	05cd1081-975f-4403-8e05-3eddb16d9b85	1	0	f	2024-06-27 03:03:48.715121+00
t	2024-09-25 11:31:11.44553+00	e0344948-6f2b-43da-a76f-788159fb2243	1	0	f	2024-06-27 11:31:11.445933+00
t	2024-09-25 20:47:00.094619+00	c174b581-fd4c-4489-8721-0d1b7dece0a2	1	0	f	2024-06-27 20:47:00.095753+00
t	2024-09-26 04:47:00.116702+00	f1b691ec-c36c-4c50-b44d-9e05a53235d9	1	0	f	2024-06-28 04:47:00.116951+00
t	2024-09-26 15:30:40.783045+00	880213b9-6052-455b-a72d-79d5995bb8f4	1	0	f	2024-06-28 15:30:40.78316+00
t	2024-09-26 23:48:15.576724+00	7ed0cda7-2305-445c-807e-b8fee46e3bed	1	0	f	2024-06-28 23:48:15.57705+00
t	2024-09-28 20:35:30.243291+00	a407ac02-59eb-4605-a4aa-3dbe48ca9f6b	1	0	f	2024-06-30 20:35:30.244241+00
t	2024-09-29 05:00:21.206311+00	22a26aaa-cf19-47e5-9944-acbe90f4653c	1	0	f	2024-07-01 05:00:21.206664+00
t	2024-09-29 17:45:58.96396+00	879de773-8549-44b3-a75f-5e9409de71f1	1	0	f	2024-07-01 17:45:58.964448+00
t	2024-09-30 03:44:04.3113+00	d9a02677-0e14-4246-a898-b8b3288d48fe	1	0	f	2024-07-02 03:44:04.311638+00
t	2024-09-30 13:06:37.316347+00	5f8d827a-ed12-4791-977f-49d774c6c4f5	1	0	f	2024-07-02 13:06:37.316471+00
t	2024-09-30 21:45:06.028163+00	af519f2b-58b3-4bbf-ab1f-2ffedae91e09	1	0	f	2024-07-02 21:45:06.028459+00
t	2024-10-01 06:47:00.130451+00	7c7d5210-d17d-4a13-ae47-1f85d9270dd0	1	0	f	2024-07-03 06:47:00.130722+00
t	2024-10-01 15:28:28.345471+00	83d23e42-267f-4b01-aaae-477549044aad	1	0	f	2024-07-03 15:28:28.345605+00
t	2024-10-02 00:47:00.191594+00	0fc10f2d-9a42-4b80-b012-7f1bec794aa5	1	0	f	2024-07-04 00:47:00.191928+00
t	2024-10-02 09:03:35.391969+00	b40b9d57-ebda-48ba-8516-80c2632fae12	1	0	f	2024-07-04 09:03:35.392133+00
t	2024-10-02 18:50:30.986003+00	e42fed1f-bb5f-48ea-ab91-4496f219b018	1	0	f	2024-07-04 18:50:30.98638+00
t	2024-10-03 06:08:24.603692+00	44102be2-8338-446d-b379-acf5c9a1a8d2	1	0	f	2024-07-05 06:08:24.603968+00
t	2024-10-03 14:47:00.206861+00	7d780d76-5a68-4223-8bb9-9ddf053c0bb3	1	0	f	2024-07-05 14:47:00.207413+00
t	2024-10-03 23:01:50.879389+00	703a6d37-3d03-482f-ab8b-1efe35e7a177	1	0	f	2024-07-05 23:01:50.879943+00
t	2024-10-04 20:47:00.067051+00	381f68d6-5038-4797-989b-c1e08e673e81	1	0	f	2024-07-06 20:47:00.067828+00
t	2024-10-05 07:46:21.041856+00	c442e09e-e30a-4ec7-a0c6-e0f9420206e4	1	0	f	2024-07-07 07:46:21.042077+00
t	2024-10-05 16:50:24.748148+00	97fdf870-e7ab-48b1-9368-8606ba6d6c3e	1	0	f	2024-07-07 16:50:24.748678+00
t	2024-10-06 16:39:57.987411+00	221fb8df-e5af-4b60-97a6-069f8174acdc	1	0	f	2024-07-08 16:39:57.987532+00
t	2024-10-07 00:47:00.079195+00	5c91beb6-d739-4f61-bd2b-f5cf85e7cc54	1	0	f	2024-07-09 00:47:00.080713+00
t	2024-10-07 14:19:10.351976+00	ccc13859-4cd7-47e8-8f53-1a9b666d2d7f	1	0	f	2024-07-09 14:19:10.352307+00
t	2024-10-07 22:47:00.232916+00	78f4f07b-f9f4-4860-8213-7d08772207bd	1	0	f	2024-07-09 22:47:00.233417+00
t	2024-10-08 08:16:39.086178+00	efaaf9e1-c0d9-4e0c-9c6b-7334c2ae819e	1	0	f	2024-07-10 08:16:39.0864+00
t	2024-10-08 16:47:00.102056+00	ebf3d569-bc07-4ade-9824-e762b0ce1c2e	1	0	f	2024-07-10 16:47:00.102333+00
t	2024-10-10 20:47:00.067313+00	9101572e-1422-4300-8a22-e882568b2173	1	0	f	2024-07-12 20:47:00.068043+00
t	2024-10-11 04:47:00.121578+00	a980518c-f947-4a1b-8445-97be81c8f30a	1	0	f	2024-07-13 04:47:00.129129+00
t	2024-10-14 17:03:41.741854+00	e00e5262-4274-4026-882f-f7156eb1297f	1	0	f	2024-07-16 17:03:41.742164+00
t	2024-10-15 18:07:57.647933+00	457fdf7f-ccba-402a-86b0-3c181f467121	1	0	f	2024-07-17 18:07:57.648159+00
\.


--
-- Data for Name: authentik_events_event; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_events_event (event_uuid, action, app, context, client_ip, created, "user", expires, expiring, tenant) FROM stdin;
63644f01-44ea-41f8-bf5c-6d53f2c7ab4d	model_created	authentik.events.middleware	{"model": {"pk": 2, "app": "authentik_core", "name": "", "model_name": "user"}, "http_request": {"args": {}, "path": "/api/v3/outposts/instances/", "method": "GET"}}	127.0.0.1	2024-06-19 00:55:24.668945+00	{"pk": 1, "email": "", "username": "AnonymousUser"}	2025-06-19 00:55:24.661339+00	t	{"pk": "1fd3eb199d97485fb54c374bc9196dba", "app": "authentik_tenants", "name": "Tenant fallback", "model_name": "tenant"}
a3d6d198-21cb-4da1-b911-52894477f83d	model_updated	authentik.events.middleware	{"model": {"pk": 2, "app": "authentik_core", "name": "Outpost authentik Embedded Outpost Service-Account", "model_name": "user"}, "http_request": {"args": {}, "path": "/api/v3/outposts/instances/", "method": "GET"}}	127.0.0.1	2024-06-19 00:55:24.68235+00	{"pk": 1, "email": "", "username": "AnonymousUser"}	2025-06-19 00:55:24.681623+00	t	{"pk": "1fd3eb199d97485fb54c374bc9196dba", "app": "authentik_tenants", "name": "Tenant fallback", "model_name": "tenant"}
06732a1d-a894-44c5-b7d3-8b890f165e28	model_updated	authentik.events.middleware	{"model": {"pk": 2, "app": "authentik_core", "name": "Outpost authentik Embedded Outpost Service-Account", "model_name": "user"}, "http_request": {"args": {}, "path": "/api/v3/outposts/instances/", "method": "GET"}}	127.0.0.1	2024-06-19 00:55:24.687753+00	{"pk": 1, "email": "", "username": "AnonymousUser"}	2025-06-19 00:55:24.686815+00	t	{"pk": "1fd3eb199d97485fb54c374bc9196dba", "app": "authentik_tenants", "name": "Tenant fallback", "model_name": "tenant"}
eb7ea76d-2e42-4f4a-b5b6-9988b0c609c8	model_updated	authentik.events.middleware	{"model": {"pk": 2, "app": "authentik_core", "name": "Outpost authentik Embedded Outpost Service-Account", "model_name": "user"}, "http_request": {"args": {}, "path": "/api/v3/outposts/instances/", "method": "GET"}}	127.0.0.1	2024-06-19 00:55:24.700199+00	{"pk": 1, "email": "", "username": "AnonymousUser"}	2025-06-19 00:55:24.699478+00	t	{"pk": "1fd3eb199d97485fb54c374bc9196dba", "app": "authentik_tenants", "name": "Tenant fallback", "model_name": "tenant"}
0689efca-a6e2-4e0f-9a51-33bbaab5c51e	update_available	authentik.admin.tasks	{"message": "Changelog: https://docs.goauthentik.io/docs/releases/2024.4#fixed-in-202442", "new_version": "2024.4.2"}	\N	2024-06-19 01:33:03.539961+00	{}	2025-06-19 01:33:03.538713+00	t	{"pk": "b032a22f6da64f5caf127029a2830db9", "app": "authentik_tenants", "name": "Tenant fallback", "model_name": "tenant"}
ae006b3b-5951-4c44-8e16-c02305225d60	email_sent	authentik.stages.email.tasks	{"body": "\n<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtm=l\">\n  <head>\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n    <meta name=\"viewport\" content=\"width=device-width\">\n\n    <style type=\"text/css\">\n      body {\n        font-family: Arial, sans-serif;\n        font-size: 14px;\n        color: #212124;\n      }\n\n      h2 {\n        display: inline-block;\n        font-family: Arial, sans-serif;\n        font-size: 28px;\n        line-height: 125%;\n        font-weight: 700;\n        padding-top: 10px;\n        padding-bottom: 10px;\n        margin: 0;\n      }\n\n      .flexibleImage {\n        height: auto;\n      }\n\n      img.logo {\n        max-width: 100%;\n        max-height: 35px;\n      }\n\n      .properties-table {\n        width: 100%;\n        text-align: left;\n        font-size: 14px;\n        font-weight: 400;\n        font-family: Arial, sans-serif;\n        border-collapse: collapse;\n      }\n\n      .properties-table tr:first-child {\n        border-top: 1px solid rgba(196, 196, 196, 0.2);\n      }\n\n      .properties-table tr:first-child>td {\n        padding-top: 24px;\n      }\n\n      .properties-table tr:last-child {\n        border-bottom: 1px solid rgba(196, 196, 196, 0.2);\n      }\n\n      .properties-table tr:last-child>td {\n        padding-bottom: 24px;\n      }\n\n      .properties-table td {\n        line-height: 24px;\n        vertical-align: top;\n        padding: 4px 15px;\n      }\n\n      .td-right {\n        text-align: right;\n        white-space: nowrap;\n      }\n      .btn-primary {\n        text-decoration: none;\n        color: #FFF;\n        background-color: #348eda;\n        border: solid #348eda;\n        width: 100%;\n        line-height: 2em;\n        font-weight: bold;\n        text-align: center;\n        cursor: pointer;\n        display: inline-block;\n        text-transform: capitalize;\n      }\n      .btn-primary a {\n        color: #fff;\n      }\n    </style>\n  </head>\n\n  <body>\n    <div class=\"wrapper\">\n      <center>\n        <div style=\"-ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; table-layout: fixed; width: 100%; max-width: 448px; padding: 60px 20px; font-size: 14px;\">\n          <table border=\"0\" align=\"center\" width=\"100%\">\n            <tr>\n              <td style=\"padding: 20px;border: 1px solid #c1c1c1;\">\n                <table width=\"100%\" style=\"background-color: #FFFFFF; border-spacing: 0; margin-top: 15px;\">\n                  <tr height=\"80\">\n                    <td align=\"center\" style=\"padding: 20px 0;\">\n                      <img src=\"cid:logo.png\" border=\"0=\" alt=\"authentik logo\" class=\"flexibleImage logo\">\n                    </td>\n                  </tr>\n                  \n<tr>\n  <td align=\"center\">\n    <h1>\n      update_available\n    </h1>\n  </td>\n</tr>\n<tr>\n  <td align=\"center\">\n    <table border=\"0\">\n      <tr>\n        <td align=\"center\" style=\"max-width: 300px; padding: 20px 0; color: #212124;\">\n          Changelog: https://docs.goauthentik.io/docs/releases/2024.4#fixed-in-202442\n        </td>\n      </tr>\n      \n      <tr>\n        <td>\n          <table class=\"properties-table\" width=\"100%\">\n            <tbody>\n              \n              <tr>\n                <td class=\"td-right\">user_email</td>\n                <td class=\"td-left\">root@example.com</td>\n              </tr>\n              \n              <tr>\n                <td class=\"td-right\">user_username</td>\n                <td class=\"td-left\">akadmin</td>\n              </tr>\n              \n              <tr>\n                <td class=\"td-right\">message</td>\n                <td class=\"td-left\">Changelog: https://docs.goauthentik.io/docs/releases/2024.4#fixed-in-202442</td>\n              </tr>\n              \n              <tr>\n                <td class=\"td-right\">new_version</td>\n                <td class=\"td-left\">2024.4.2</td>\n              </tr>\n              \n            </tbody>\n          </table>\n        </td>\n      </tr>\n      \n    </table>\n  </td>\n</tr>\n\n                </table>\n              </td>\n            </tr>\n            <tr>\n              <td>\n                <table border=\"0\" style=\"margin-top: 10px;\" width=\"100%\">\n                  <tr>\n                    <td style=\"background: #FAFBFB;\">\n                      <table style=\"width: 100%;\">\n                        \n\n<tr>\n  <td style=\"padding: 20px; font-size: 12px; color: #212124;\" align=\"center\">\n    \n    This email was sent from the notification transport <code>default-email-transport</code>.\n    \n  </td>\n</tr>\n\n\n                      </table>\n                    </td>\n                  </tr>\n                </table>\n              </td>\n            </tr>\n            <tr>\n              <td align=\"center\">\n                Powered by <a href=\"https://goauthentik.io?utm_source=authentik&utm_medium=email\">authentik</a>.\n              </td>\n            </tr>\n          </table>\n        </div>\n      </center>\n    </div>\n  </body>\n</html>\n", "message": "Email to root@example.com sent", "subject": "authentik Notification: update_available", "to_email": ["root@example.com"], "from_email": "auth@fyko.net"}	\N	2024-06-19 01:33:04.324262+00	{}	2025-06-19 01:33:04.321207+00	t	{"pk": "b032a22f6da64f5caf127029a2830db9", "app": "authentik_tenants", "name": "Tenant fallback", "model_name": "tenant"}
26fe4ff5-df57-47f9-b5c1-a4a5d2b4c8f4	update_available	authentik.admin.tasks	{"message": "Changelog: https://docs.goauthentik.io/docs/releases/2024.6", "new_version": "2024.6.0"}	\N	2024-06-26 17:12:48.307967+00	{}	2025-06-26 17:12:48.305957+00	t	{"pk": "2d76f9e61b624ffcbe3e872586c32f91", "app": "authentik_tenants", "name": "Tenant fallback", "model_name": "tenant"}
e4002673-6de6-4b12-b8a9-16f90cf1ccf6	email_sent	authentik.stages.email.tasks	{"body": "\n<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtm=l\">\n  <head>\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n    <meta name=\"viewport\" content=\"width=device-width\">\n\n    <style type=\"text/css\">\n      body {\n        font-family: Arial, sans-serif;\n        font-size: 14px;\n        color: #212124;\n      }\n\n      h2 {\n        display: inline-block;\n        font-family: Arial, sans-serif;\n        font-size: 28px;\n        line-height: 125%;\n        font-weight: 700;\n        padding-top: 10px;\n        padding-bottom: 10px;\n        margin: 0;\n      }\n\n      .flexibleImage {\n        height: auto;\n      }\n\n      img.logo {\n        max-width: 100%;\n        max-height: 35px;\n      }\n\n      .properties-table {\n        width: 100%;\n        text-align: left;\n        font-size: 14px;\n        font-weight: 400;\n        font-family: Arial, sans-serif;\n        border-collapse: collapse;\n      }\n\n      .properties-table tr:first-child {\n        border-top: 1px solid rgba(196, 196, 196, 0.2);\n      }\n\n      .properties-table tr:first-child>td {\n        padding-top: 24px;\n      }\n\n      .properties-table tr:last-child {\n        border-bottom: 1px solid rgba(196, 196, 196, 0.2);\n      }\n\n      .properties-table tr:last-child>td {\n        padding-bottom: 24px;\n      }\n\n      .properties-table td {\n        line-height: 24px;\n        vertical-align: top;\n        padding: 4px 15px;\n      }\n\n      .td-right {\n        text-align: right;\n        white-space: nowrap;\n      }\n      .btn-primary {\n        text-decoration: none;\n        color: #FFF;\n        background-color: #348eda;\n        border: solid #348eda;\n        width: 100%;\n        line-height: 2em;\n        font-weight: bold;\n        text-align: center;\n        cursor: pointer;\n        display: inline-block;\n        text-transform: capitalize;\n      }\n      .btn-primary a {\n        color: #fff;\n      }\n    </style>\n  </head>\n\n  <body>\n    <div class=\"wrapper\">\n      <center>\n        <div style=\"-ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; table-layout: fixed; width: 100%; max-width: 448px; padding: 60px 20px; font-size: 14px;\">\n          <table border=\"0\" align=\"center\" width=\"100%\">\n            <tr>\n              <td style=\"padding: 20px;border: 1px solid #c1c1c1;\">\n                <table width=\"100%\" style=\"background-color: #FFFFFF; border-spacing: 0; margin-top: 15px;\">\n                  <tr height=\"80\">\n                    <td align=\"center\" style=\"padding: 20px 0;\">\n                      <img src=\"cid:logo.png\" border=\"0=\" alt=\"authentik logo\" class=\"flexibleImage logo\">\n                    </td>\n                  </tr>\n                  \n<tr>\n  <td align=\"center\">\n    <h1>\n      update_available\n    </h1>\n  </td>\n</tr>\n<tr>\n  <td align=\"center\">\n    <table border=\"0\">\n      <tr>\n        <td align=\"center\" style=\"max-width: 300px; padding: 20px 0; color: #212124;\">\n          Changelog: https://docs.goauthentik.io/docs/releases/2024.6\n        </td>\n      </tr>\n      \n      <tr>\n        <td>\n          <table class=\"properties-table\" width=\"100%\">\n            <tbody>\n              \n              <tr>\n                <td class=\"td-right\">user_email</td>\n                <td class=\"td-left\">root@example.com</td>\n              </tr>\n              \n              <tr>\n                <td class=\"td-right\">user_username</td>\n                <td class=\"td-left\">akadmin</td>\n              </tr>\n              \n              <tr>\n                <td class=\"td-right\">message</td>\n                <td class=\"td-left\">Changelog: https://docs.goauthentik.io/docs/releases/2024.6</td>\n              </tr>\n              \n              <tr>\n                <td class=\"td-right\">new_version</td>\n                <td class=\"td-left\">2024.6.0</td>\n              </tr>\n              \n            </tbody>\n          </table>\n        </td>\n      </tr>\n      \n    </table>\n  </td>\n</tr>\n\n                </table>\n              </td>\n            </tr>\n            <tr>\n              <td>\n                <table border=\"0\" style=\"margin-top: 10px;\" width=\"100%\">\n                  <tr>\n                    <td style=\"background: #FAFBFB;\">\n                      <table style=\"width: 100%;\">\n                        \n\n<tr>\n  <td style=\"padding: 20px; font-size: 12px; color: #212124;\" align=\"center\">\n    \n    This email was sent from the notification transport <code>default-email-transport</code>.\n    \n  </td>\n</tr>\n\n\n                      </table>\n                    </td>\n                  </tr>\n                </table>\n              </td>\n            </tr>\n            <tr>\n              <td align=\"center\">\n                Powered by <a href=\"https://goauthentik.io?utm_source=authentik&utm_medium=email\">authentik</a>.\n              </td>\n            </tr>\n          </table>\n        </div>\n      </center>\n    </div>\n  </body>\n</html>\n", "message": "Email to root@example.com sent", "subject": "authentik Notification: update_available", "to_email": ["root@example.com"], "from_email": "auth@fyko.net"}	\N	2024-06-26 17:12:49.375807+00	{}	2025-06-26 17:12:49.374599+00	t	{"pk": "2d76f9e61b624ffcbe3e872586c32f91", "app": "authentik_tenants", "name": "Tenant fallback", "model_name": "tenant"}
22cdb0ff-f2fa-4e41-b85b-ef6d67f0c6e4	password_set	authentik.events.signals	{}	255.255.255.255	2024-07-04 22:10:42.948562+00	{"pk": 6, "email": "admin@eidash.fyko.net", "username": "akadmin"}	2025-07-04 22:10:42.947032+00	t	{"pk": "8adf911e40a84f52976b2e46e88175ef", "app": "authentik_tenants", "name": "Tenant fallback", "model_name": "tenant"}
801a319b-a8d9-49c5-900e-1b847731c40f	model_updated	authentik.events.middleware	{"model": {"pk": 6, "app": "authentik_core", "name": "authentik Default Admin", "model_name": "user"}, "http_request": {"args": {}, "path": "/api/v3/flows/executor/initial-setup/", "method": "GET"}}	192.168.107.1	2024-07-04 22:10:43.131457+00	{"pk": 1, "email": "", "username": "AnonymousUser"}	2025-07-04 22:10:43.130129+00	t	{"pk": "c7435d4b5d1149548387b96c19bd973f", "app": "authentik_tenants", "name": "Default tenant", "model_name": "tenant"}
9dc6e6d2-105e-4586-b8fe-065bfa02717f	user_write	authentik.events.signals	{"email": "admin@eidash.fyko.net", "created": false, "password": "********************", "http_request": {"args": {}, "path": "/api/v3/flows/executor/initial-setup/", "method": "GET"}, "password_repeat": "********************", "oobe-header-text": "Welcome to authentik! Please set a password for the default admin user, akadmin."}	192.168.107.1	2024-07-04 22:10:43.182329+00	{"pk": 6, "email": "admin@eidash.fyko.net", "username": "akadmin"}	2025-07-04 22:10:43.181095+00	t	{"pk": "c7435d4b5d1149548387b96c19bd973f", "app": "authentik_tenants", "name": "Default tenant", "model_name": "tenant"}
85a97a06-ec49-4271-9d31-ce479748c94d	login	authentik.events.signals	{"http_request": {"args": {}, "path": "/api/v3/flows/executor/initial-setup/", "method": "GET"}}	192.168.107.1	2024-07-04 22:10:43.245769+00	{"pk": 6, "email": "admin@eidash.fyko.net", "username": "akadmin"}	2025-07-04 22:10:43.245389+00	t	{"pk": "c7435d4b5d1149548387b96c19bd973f", "app": "authentik_tenants", "name": "Default tenant", "model_name": "tenant"}
10dbd409-90f5-4f3f-a1c5-7e4def59c348	model_updated	authentik.events.middleware	{"model": {"pk": 6, "app": "authentik_core", "name": "authentik Default Admin", "model_name": "user"}, "http_request": {"args": {}, "path": "/api/v3/flows/executor/initial-setup/", "method": "GET"}}	192.168.107.1	2024-07-04 22:10:43.260868+00	{"pk": 1, "email": "", "username": "AnonymousUser"}	2025-07-04 22:10:43.260533+00	t	{"pk": "c7435d4b5d1149548387b96c19bd973f", "app": "authentik_tenants", "name": "Default tenant", "model_name": "tenant"}
c9cd8134-79ef-4cad-a8c8-8e97d9bf38ec	model_created	authentik.events.middleware	{"model": {"pk": 1, "app": "authentik_providers_oauth2", "name": "EIDash", "model_name": "oauth2provider"}, "http_request": {"args": {}, "path": "/api/v3/providers/oauth2/", "method": "POST"}}	192.168.107.1	2024-07-04 22:11:21.95955+00	{"pk": 6, "email": "admin@eidash.fyko.net", "username": "akadmin"}	2025-07-04 22:11:21.95804+00	t	{"pk": "c7435d4b5d1149548387b96c19bd973f", "app": "authentik_tenants", "name": "Default tenant", "model_name": "tenant"}
0c10fa5a-980f-4ea7-9b39-539f7ae1656b	model_created	authentik.events.middleware	{"model": {"pk": "08b0c17d8ded4ee7a1b43e54cb2651d5", "app": "authentik_core", "name": "EIDash", "model_name": "application"}, "http_request": {"args": {}, "path": "/api/v3/core/applications/", "method": "POST"}}	192.168.107.1	2024-07-04 22:11:32.217858+00	{"pk": 6, "email": "admin@eidash.fyko.net", "username": "akadmin"}	2025-07-04 22:11:32.216219+00	t	{"pk": "c7435d4b5d1149548387b96c19bd973f", "app": "authentik_tenants", "name": "Default tenant", "model_name": "tenant"}
10ad5980-df33-4f7d-8be4-7209f677e817	authorize_application	authentik.providers.oauth2.views.authorize	{"flow": "2de57b71641b48319d0fd1c488cb74b4", "scopes": "openid profile email", "http_request": {"args": {"nonce": "rxCdeWEOpVPVLQxPbQuecw", "scope": "openid profile email", "state": "dBd4AYR7_VtDQfdvT-h1eA", "client_id": "zFMbeD2RCQaol3zaVVhMtm8WHkeSYjFJjTNnFyo2", "redirect_uri": "http://localhost:33939/api/oidc/callback", "response_type": "code", "code_challenge": "d6OfKCDUxPvi67VvKxn_5WF1uLHBLNkUnX3wcbDJMYA", "code_challenge_method": "S256"}, "path": "/api/v3/flows/executor/default-provider-authorization-implicit-consent/", "method": "GET"}, "authorized_application": {"pk": "08b0c17d8ded4ee7a1b43e54cb2651d5", "app": "authentik_core", "name": "EIDash", "model_name": "application"}}	192.168.107.1	2024-07-04 22:11:50.45217+00	{"pk": 6, "email": "admin@eidash.fyko.net", "username": "akadmin"}	2025-07-04 22:11:50.425418+00	t	{"pk": "c7435d4b5d1149548387b96c19bd973f", "app": "authentik_tenants", "name": "Default tenant", "model_name": "tenant"}
dbd07468-2d6e-42dd-98d5-43730038d70d	update_available	authentik.admin.tasks	{"message": "Changelog: https://docs.goauthentik.io/docs/releases/2024.6#fixed-in-202461", "new_version": "2024.6.1"}	\N	2024-07-12 20:33:00.471881+00	{}	2025-07-12 20:33:00.471313+00	t	{"pk": "95903cdf0d434bc7b20cb3ec6f3c1d76", "app": "authentik_tenants", "name": "Tenant fallback", "model_name": "tenant"}
61998a3e-ee82-4dda-9ee1-4789389858d7	email_sent	authentik.stages.email.tasks	{"body": "\n<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtm=l\">\n  <head>\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n    <meta name=\"viewport\" content=\"width=device-width\">\n\n    <style type=\"text/css\">\n      body {\n        font-family: Arial, sans-serif;\n        font-size: 14px;\n        color: #212124;\n      }\n\n      h2 {\n        display: inline-block;\n        font-family: Arial, sans-serif;\n        font-size: 28px;\n        line-height: 125%;\n        font-weight: 700;\n        padding-top: 10px;\n        padding-bottom: 10px;\n        margin: 0;\n      }\n\n      .flexibleImage {\n        height: auto;\n      }\n\n      img.logo {\n        max-width: 100%;\n        max-height: 35px;\n      }\n\n      .properties-table {\n        width: 100%;\n        text-align: left;\n        font-size: 14px;\n        font-weight: 400;\n        font-family: Arial, sans-serif;\n        border-collapse: collapse;\n      }\n\n      .properties-table tr:first-child {\n        border-top: 1px solid rgba(196, 196, 196, 0.2);\n      }\n\n      .properties-table tr:first-child>td {\n        padding-top: 24px;\n      }\n\n      .properties-table tr:last-child {\n        border-bottom: 1px solid rgba(196, 196, 196, 0.2);\n      }\n\n      .properties-table tr:last-child>td {\n        padding-bottom: 24px;\n      }\n\n      .properties-table td {\n        line-height: 24px;\n        vertical-align: top;\n        padding: 4px 15px;\n      }\n\n      .td-right {\n        text-align: right;\n        white-space: nowrap;\n      }\n      .btn-primary {\n        text-decoration: none;\n        color: #FFF;\n        background-color: #348eda;\n        border: solid #348eda;\n        width: 100%;\n        line-height: 2em;\n        font-weight: bold;\n        text-align: center;\n        cursor: pointer;\n        display: inline-block;\n        text-transform: capitalize;\n      }\n      .btn-primary a {\n        color: #fff;\n      }\n    </style>\n  </head>\n\n  <body>\n    <div class=\"wrapper\">\n      <center>\n        <div style=\"-ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; table-layout: fixed; width: 100%; max-width: 448px; padding: 60px 20px; font-size: 14px;\">\n          <table border=\"0\" align=\"center\" width=\"100%\">\n            <tr>\n              <td style=\"padding: 20px;border: 1px solid #c1c1c1;\">\n                <table width=\"100%\" style=\"background-color: #FFFFFF; border-spacing: 0; margin-top: 15px;\">\n                  <tr height=\"80\">\n                    <td align=\"center\" style=\"padding: 20px 0;\">\n                      <img src=\"cid:logo.png\" border=\"0=\" alt=\"authentik logo\" class=\"flexibleImage logo\">\n                    </td>\n                  </tr>\n                  \n<tr>\n  <td align=\"center\">\n    <h1>\n      update_available\n    </h1>\n  </td>\n</tr>\n<tr>\n  <td align=\"center\">\n    <table border=\"0\">\n      <tr>\n        <td align=\"center\" style=\"max-width: 300px; padding: 20px 0; color: #212124;\">\n          Changelog: https://docs.goauthentik.io/docs/releases/2024.6#fixed-in-202461\n        </td>\n      </tr>\n      \n      <tr>\n        <td>\n          <table class=\"properties-table\" width=\"100%\">\n            <tbody>\n              \n              <tr>\n                <td class=\"td-right\">user_email</td>\n                <td class=\"td-left\">admin@eidash.fyko.net</td>\n              </tr>\n              \n              <tr>\n                <td class=\"td-right\">user_username</td>\n                <td class=\"td-left\">akadmin</td>\n              </tr>\n              \n              <tr>\n                <td class=\"td-right\">message</td>\n                <td class=\"td-left\">Changelog: https://docs.goauthentik.io/docs/releases/2024.6#fixed-in-202461</td>\n              </tr>\n              \n              <tr>\n                <td class=\"td-right\">new_version</td>\n                <td class=\"td-left\">2024.6.1</td>\n              </tr>\n              \n            </tbody>\n          </table>\n        </td>\n      </tr>\n      \n    </table>\n  </td>\n</tr>\n\n                </table>\n              </td>\n            </tr>\n            <tr>\n              <td>\n                <table border=\"0\" style=\"margin-top: 10px;\" width=\"100%\">\n                  <tr>\n                    <td style=\"background: #FAFBFB;\">\n                      <table style=\"width: 100%;\">\n                        \n\n<tr>\n  <td style=\"padding: 20px; font-size: 12px; color: #212124;\" align=\"center\">\n    \n    This email was sent from the notification transport <code>default-email-transport</code>.\n    \n  </td>\n</tr>\n\n\n                      </table>\n                    </td>\n                  </tr>\n                </table>\n              </td>\n            </tr>\n            <tr>\n              <td align=\"center\">\n                Powered by <a href=\"https://goauthentik.io?utm_source=authentik&utm_medium=email\">authentik</a>.\n              </td>\n            </tr>\n          </table>\n        </div>\n      </center>\n    </div>\n  </body>\n</html>\n", "message": "Email to admin@eidash.fyko.net sent", "subject": "authentik Notification: update_available", "to_email": ["admin@eidash.fyko.net"], "from_email": "auth@fyko.net"}	\N	2024-07-12 20:33:01.413226+00	{}	2025-07-12 20:33:01.41022+00	t	{"pk": "95903cdf0d434bc7b20cb3ec6f3c1d76", "app": "authentik_tenants", "name": "Tenant fallback", "model_name": "tenant"}
67d5e1f2-c17a-4722-a6b1-d4da53754a91	logout	authentik.events.signals	{"http_request": {"args": {}, "path": "/api/v3/flows/executor/default-invalidation-flow/", "method": "GET"}}	192.168.107.1	2024-07-17 23:53:48.648119+00	{"pk": 6, "email": "admin@eidash.fyko.net", "username": "akadmin"}	2025-07-17 23:53:48.647297+00	t	{"pk": "c7435d4b5d1149548387b96c19bd973f", "app": "authentik_tenants", "name": "Default tenant", "model_name": "tenant"}
0dc73c90-8103-43b3-88b9-263771660a66	login	authentik.events.signals	{"auth_method": "password", "http_request": {"args": {"next": "/if/user/#/library"}, "path": "/api/v3/flows/executor/default-authentication-flow/", "method": "GET"}, "auth_method_args": {}}	192.168.107.1	2024-07-17 23:55:05.562181+00	{"pk": 6, "email": "admin@eidash.fyko.net", "username": "akadmin"}	2025-07-17 23:55:05.561698+00	t	{"pk": "c7435d4b5d1149548387b96c19bd973f", "app": "authentik_tenants", "name": "Default tenant", "model_name": "tenant"}
968414e1-75cd-4399-8b00-93ec61b92677	model_updated	authentik.events.middleware	{"model": {"pk": 6, "app": "authentik_core", "name": "authentik Default Admin", "model_name": "user"}, "http_request": {"args": {"next": "/if/user/#/library"}, "path": "/api/v3/flows/executor/default-authentication-flow/", "method": "GET"}}	192.168.107.1	2024-07-17 23:55:05.588267+00	{"pk": 1, "email": "", "username": "AnonymousUser"}	2025-07-17 23:55:05.587832+00	t	{"pk": "c7435d4b5d1149548387b96c19bd973f", "app": "authentik_tenants", "name": "Default tenant", "model_name": "tenant"}
3f90c581-30b4-4793-9aa4-bfffca8c277a	model_updated	authentik.events.middleware	{"model": {"pk": "8a128d96bfd643bbba3d850ff246bd52", "app": "authentik_outposts", "name": "authentik Embedded Outpost", "model_name": "outpost"}, "http_request": {"args": {}, "path": "/api/v3/outposts/instances/8a128d96-bfd6-43bb-ba3d-850ff246bd52/", "method": "PUT"}}	192.168.107.1	2024-07-17 23:55:10.594013+00	{"pk": 6, "email": "admin@eidash.fyko.net", "username": "akadmin"}	2025-07-17 23:55:10.593664+00	t	{"pk": "c7435d4b5d1149548387b96c19bd973f", "app": "authentik_tenants", "name": "Default tenant", "model_name": "tenant"}
\.


--
-- Data for Name: authentik_events_notification; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_events_notification (uuid, severity, body, created, seen, event_id, user_id) FROM stdin;
a182f8ec-2324-467b-9eb4-89a199d8a2db	alert	Changelog: https://docs.goauthentik.io/docs/releases/2024.4#fixed-in-202442	2024-06-19 01:33:03.621331+00	f	0689efca-a6e2-4e0f-9a51-33bbaab5c51e	6
a875cd46-4b84-4cd2-bf7d-7ca2cc82cf51	alert	Changelog: https://docs.goauthentik.io/docs/releases/2024.6	2024-06-26 17:12:49.414514+00	f	26fe4ff5-df57-47f9-b5c1-a4a5d2b4c8f4	6
0936e88d-baa9-4009-bb6a-9afe23612846	alert	Changelog: https://docs.goauthentik.io/docs/releases/2024.6#fixed-in-202461	2024-07-12 20:33:00.561145+00	f	dbd07468-2d6e-42dd-98d5-43730038d70d	6
\.


--
-- Data for Name: authentik_events_notificationrule; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_events_notificationrule (policybindingmodel_ptr_id, name, severity, group_id) FROM stdin;
db7a6c40-9662-432e-8207-3472cd3939bd	default-notify-configuration-error	alert	a7d3897d-f620-4dbd-8156-2448886c8ae3
45dfe77b-bf6c-4903-b852-fae84ac14088	default-notify-update	alert	a7d3897d-f620-4dbd-8156-2448886c8ae3
849a0b25-960d-4861-a41d-77804415d315	default-notify-exception	alert	a7d3897d-f620-4dbd-8156-2448886c8ae3
\.


--
-- Data for Name: authentik_events_notificationwebhookmapping; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_events_notificationwebhookmapping (propertymapping_ptr_id) FROM stdin;
\.


--
-- Data for Name: authentik_events_notificationtransport; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_events_notificationtransport (uuid, name, mode, webhook_url, send_once, webhook_mapping_id) FROM stdin;
c08457ad-56f2-401a-a2b4-899a3e5a614e	default-email-transport	email		f	\N
2ce44011-b25c-4a97-883b-6f4be218729b	default-local-transport	local		f	\N
\.


--
-- Data for Name: authentik_events_notificationrule_transports; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_events_notificationrule_transports (id, notificationrule_id, notificationtransport_id) FROM stdin;
7	db7a6c40-9662-432e-8207-3472cd3939bd	2ce44011-b25c-4a97-883b-6f4be218729b
8	db7a6c40-9662-432e-8207-3472cd3939bd	c08457ad-56f2-401a-a2b4-899a3e5a614e
9	45dfe77b-bf6c-4903-b852-fae84ac14088	2ce44011-b25c-4a97-883b-6f4be218729b
10	45dfe77b-bf6c-4903-b852-fae84ac14088	c08457ad-56f2-401a-a2b4-899a3e5a614e
11	849a0b25-960d-4861-a41d-77804415d315	2ce44011-b25c-4a97-883b-6f4be218729b
12	849a0b25-960d-4861-a41d-77804415d315	c08457ad-56f2-401a-a2b4-899a3e5a614e
\.


--
-- Data for Name: authentik_flows_stage; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_flows_stage (stage_uuid, name) FROM stdin;
267ac1c5-6874-4f2d-acef-894dbd9aa4fd	default-authenticator-static-setup
e8bc4b9d-c79d-4e4c-8447-acd2bae86d88	default-authentication-password
2f745146-31fd-48f6-a5b5-efec8a880674	default-authentication-mfa-validation
c95c4e7f-ed5b-45f5-bbbc-a562753e5c9a	default-authentication-identification
667d6f2f-2e0f-4246-89d9-73453020df11	default-authenticator-totp-setup
1abf450e-f20e-47cb-af47-c12066982662	default-authenticator-webauthn-setup
7b3d6582-3a80-4178-a543-7c24ad47f426	default-invalidation-logout
f2303313-8760-43a1-aefb-aa2fbb175dae	default-provider-authorization-consent
3b58b610-38de-4325-bd20-3823f3a84fda	default-source-authentication-login
bd04beb4-8435-40ee-ab1b-26f7550c7437	default-source-enrollment-login
d4dbae88-c728-4214-ba90-567f7442e8eb	default-source-enrollment-prompt
27bbd6cf-03ad-41c5-a366-fc749a213551	default-source-enrollment-write
d72a2eb4-016c-40a6-96cb-ef41982f66f0	default-user-settings-write
ba6a5908-7738-4bd7-aedc-797305e16eeb	default-user-settings
98dc588e-96a5-4874-b8cd-911790fa1b42	default-password-change-prompt
00e3dc29-7e39-4ff8-9d18-8f4299136107	stage-default-oobe-password
5210d1e5-b48a-4c4a-b7ce-fb96c724ae4e	default-authentication-login
239ec205-1154-464b-a16e-ec0c4711e115	default-password-change-write
\.


--
-- Data for Name: authentik_flows_flowstagebinding; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_flows_flowstagebinding (policybindingmodel_ptr_id, fsb_uuid, re_evaluate_policies, "order", target_id, stage_id, evaluate_on_plan, invalid_response_action) FROM stdin;
c91d3ce0-2c9c-408b-8d61-1dcc9629d9d4	3369141e-dde5-4145-ac20-cb525c2e1dda	t	0	b944b781-bdc2-493b-a0a0-99a35e45379d	3b58b610-38de-4325-bd20-3823f3a84fda	f	retry
8dbac640-2f02-4f23-9941-9330d52fe836	0d720653-3291-4139-a0b8-2dc33095d2d1	t	0	079e919e-b82a-4081-a3a6-3e74f2ea281f	d4dbae88-c728-4214-ba90-567f7442e8eb	f	retry
eabce391-672a-4e96-85c9-fd514c7d2b89	989eec4f-c46d-4bee-bda0-05a893ba3803	t	1	079e919e-b82a-4081-a3a6-3e74f2ea281f	27bbd6cf-03ad-41c5-a366-fc749a213551	f	retry
dfadc4c6-039c-4db9-aeba-d747989cc1f3	11e8208b-9a48-4cb7-9fdb-6ffd14114814	t	2	079e919e-b82a-4081-a3a6-3e74f2ea281f	bd04beb4-8435-40ee-ab1b-26f7550c7437	f	retry
577397d3-f54e-4706-981b-a31f8f8a57b2	ef6c981c-8fbf-4724-bc7f-e72bfc0a143d	t	20	deb5d725-c4ec-4f10-9a86-176b5dd17b07	ba6a5908-7738-4bd7-aedc-797305e16eeb	f	retry
495ae345-e1e3-47b0-ad6f-f77ff5b2a5dc	fd34889f-5458-4d86-bdc9-047c7fc5d631	t	100	deb5d725-c4ec-4f10-9a86-176b5dd17b07	d72a2eb4-016c-40a6-96cb-ef41982f66f0	f	retry
09337a58-8e97-4a10-8c7f-51c95001871c	338c3fee-1590-4549-bf52-c2acf7374513	t	0	c932406f-003d-4aa4-85ed-527096352e11	98dc588e-96a5-4874-b8cd-911790fa1b42	f	retry
0c84e135-41dd-41ac-b6fc-b324886a28c7	4cbeb33b-5393-4b58-9d82-fe5fd97c5790	t	1	c932406f-003d-4aa4-85ed-527096352e11	239ec205-1154-464b-a16e-ec0c4711e115	f	retry
1122480b-af5c-4f6e-a269-4b2d45e5865f	cfb522e0-d0af-4003-aac2-27280c9bf0bc	f	10	990f2a1e-ba01-45a4-aeb2-589c780892bd	00e3dc29-7e39-4ff8-9d18-8f4299136107	t	retry
e530bf9f-c8a7-4178-8add-074018a5a25b	200c25c7-ea07-4201-8bd4-90d808ea0fab	t	20	990f2a1e-ba01-45a4-aeb2-589c780892bd	239ec205-1154-464b-a16e-ec0c4711e115	f	retry
05103a3f-5a71-4ace-9e29-43054ef516b4	473cfab8-8756-4bc6-907d-4a72681d0d80	f	100	990f2a1e-ba01-45a4-aeb2-589c780892bd	5210d1e5-b48a-4c4a-b7ce-fb96c724ae4e	t	retry
d44dd3c4-50f3-4f13-b8cb-206f151a0504	f05d5799-1fbc-4ad5-8a8b-1943eba1f17d	t	0	0b577208-0411-499f-ab67-b42856fbacdb	267ac1c5-6874-4f2d-acef-894dbd9aa4fd	f	retry
890b79e5-33e4-4c58-81d2-191658e0e12d	60c95b36-9158-4938-ba73-573131f5fc5f	t	10	dedfb836-3b41-45fe-89e5-615a1d091c18	c95c4e7f-ed5b-45f5-bbbc-a562753e5c9a	f	retry
b2af9d11-28bf-44a8-a493-94ccd2127640	af0d3508-bb7c-43a0-b6c1-3210a0057f42	t	20	dedfb836-3b41-45fe-89e5-615a1d091c18	e8bc4b9d-c79d-4e4c-8447-acd2bae86d88	f	retry
2d88955c-3763-42fd-8362-de43d9105605	1826d9c9-aab5-4c7b-badd-6fb18e4cba05	t	30	dedfb836-3b41-45fe-89e5-615a1d091c18	2f745146-31fd-48f6-a5b5-efec8a880674	f	retry
4a837ff1-5459-4beb-978d-d0feb20dc0eb	43021645-5ec8-488c-a012-00fed8c7cd90	t	100	dedfb836-3b41-45fe-89e5-615a1d091c18	5210d1e5-b48a-4c4a-b7ce-fb96c724ae4e	f	retry
4595a80e-796b-49d3-984d-8635eeb6310e	918962f6-4181-44f6-91b2-bb9d9414700a	t	0	23e607e1-7e59-4517-ba5c-3bdc22d752bc	667d6f2f-2e0f-4246-89d9-73453020df11	f	retry
2d30844a-3fe1-4501-8544-c4bd5b7fa5d4	135e3c94-b5de-4425-a43e-5cbe2884895a	t	0	d79cfa73-4bc9-4698-af98-74e69aaa70c8	1abf450e-f20e-47cb-af47-c12066982662	f	retry
4f7c6ed0-8c23-49be-8df7-5119d41d4d80	5bcb061a-c19f-41d8-850e-32a3eda7ae2b	t	0	6dd86ecb-3ba3-40a2-aae1-ae2bef07f689	7b3d6582-3a80-4178-a543-7c24ad47f426	f	retry
8c709b37-1910-4926-81bf-95afb9dd42f3	e6565216-8b86-4e48-8c03-f999702a065d	t	0	d31da7d3-176c-4b6d-b07c-61c79eb161a0	f2303313-8760-43a1-aefb-aa2fbb175dae	f	retry
\.


--
-- Data for Name: authentik_flows_flowtoken; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_flows_flowtoken (token_ptr_id, _plan, flow_id) FROM stdin;
\.


--
-- Data for Name: authentik_install_id; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_install_id (id) FROM stdin;
5893286f-d923-4302-8a6c-35248f9e3ddc
4d4932e5-490b-469b-9f92-4b318e2fbedb
\.


--
-- Data for Name: authentik_outposts_outpostserviceconnection; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_outposts_outpostserviceconnection (uuid, name, local) FROM stdin;
091de732-e919-48ec-94a5-f487f1564917	Local Docker connection	t
\.


--
-- Data for Name: authentik_outposts_dockerserviceconnection; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_outposts_dockerserviceconnection (outpostserviceconnection_ptr_id, url, tls_authentication_id, tls_verification_id) FROM stdin;
091de732-e919-48ec-94a5-f487f1564917	/var/run/docker.sock	\N	\N
\.


--
-- Data for Name: authentik_outposts_kubernetesserviceconnection; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_outposts_kubernetesserviceconnection (outpostserviceconnection_ptr_id, kubeconfig, verify_ssl) FROM stdin;
\.


--
-- Data for Name: authentik_outposts_outpost; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_outposts_outpost (uuid, name, _config, type, service_connection_id, managed) FROM stdin;
8a128d96-bfd6-43bb-ba3d-850ff246bd52	authentik Embedded Outpost	{"log_level": "info", "docker_labels": null, "authentik_host": "http://localhost:9000", "docker_network": null, "container_image": null, "docker_map_ports": true, "kubernetes_replicas": 1, "kubernetes_namespace": "default", "authentik_host_browser": "", "object_naming_template": "ak-outpost-%(name)s", "authentik_host_insecure": false, "kubernetes_json_patches": null, "kubernetes_service_type": "ClusterIP", "kubernetes_image_pull_secrets": [], "kubernetes_ingress_class_name": null, "kubernetes_disabled_components": ["deployment", "secret"], "kubernetes_ingress_annotations": {}, "kubernetes_ingress_secret_name": "authentik-outpost-tls"}	proxy	\N	goauthentik.io/outposts/embedded
\.


--
-- Data for Name: authentik_outposts_outpost_providers; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_outposts_outpost_providers (id, outpost_id, provider_id) FROM stdin;
\.


--
-- Data for Name: authentik_policies_policy; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_policies_policy (created, last_updated, policy_uuid, name, execution_logging) FROM stdin;
2024-06-19 00:55:29.866463+00	2024-06-19 00:55:34.753936+00	1fcd9f01-2c1c-46aa-80a9-a8aff22d82de	default-oobe-prefill-user	f
2024-06-19 00:55:29.868365+00	2024-06-19 00:55:34.755614+00	2d11e9b6-c1df-4ff8-a663-857576b2df27	default-oobe-password-usable	f
2024-06-19 00:55:29.871202+00	2024-06-19 00:55:34.75734+00	e3d4091e-73d5-47de-a146-613c5954af30	default-oobe-flow-set-authentication	f
2024-06-19 00:55:29.265765+00	2024-06-19 00:55:34.110739+00	c8dc06d6-d9a5-4835-809c-8f898d4685a7	default-match-configuration-error	f
2024-06-19 00:55:29.275448+00	2024-06-19 00:55:34.119692+00	df51af85-4091-4630-aa8c-a142a0f9f803	default-match-update	f
2024-06-19 00:55:29.284487+00	2024-06-19 00:55:34.128616+00	41a3f057-3b85-4108-9d80-1eb5a806e522	default-match-policy-exception	f
2024-06-19 00:55:29.286157+00	2024-06-19 00:55:34.130363+00	98c5571f-566d-4493-96ec-5591cb880e23	default-match-property-mapping-exception	f
2024-06-19 00:55:29.51267+00	2024-06-19 00:55:34.511203+00	2250034b-cbfc-40c5-b0e0-de6ad29ebd68	default-authentication-flow-password-stage	f
2024-06-19 00:55:29.716727+00	2024-06-19 00:55:34.604929+00	ac887f2e-e1f3-45f2-bb21-9d2ce26cdd6b	default-source-authentication-if-sso	f
2024-06-19 00:55:29.745455+00	2024-06-19 00:55:34.636954+00	892f327e-9ca3-4a1f-b1f7-2c11aa65e404	default-source-enrollment-if-username	f
2024-06-19 00:55:29.747993+00	2024-06-19 00:55:34.638466+00	8582789a-15f4-4152-aa65-59e22ba23560	default-source-enrollment-if-sso	f
2024-06-19 00:55:29.558264+00	2024-06-19 00:55:34.687469+00	fcbde065-5f6c-436e-8d54-41a73e71933b	default-user-settings-authorization	f
\.


--
-- Data for Name: authentik_policies_dummy_dummypolicy; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_policies_dummy_dummypolicy (policy_ptr_id, result, wait_min, wait_max) FROM stdin;
\.


--
-- Data for Name: authentik_policies_event_matcher_eventmatcherpolicy; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_policies_event_matcher_eventmatcherpolicy (policy_ptr_id, action, client_ip, app, model) FROM stdin;
c8dc06d6-d9a5-4835-809c-8f898d4685a7	configuration_error	\N	\N	\N
df51af85-4091-4630-aa8c-a142a0f9f803	update_available	\N	\N	\N
41a3f057-3b85-4108-9d80-1eb5a806e522	policy_exception	\N	\N	\N
98c5571f-566d-4493-96ec-5591cb880e23	property_mapping_exception	\N	\N	\N
\.


--
-- Data for Name: authentik_policies_expiry_passwordexpirypolicy; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_policies_expiry_passwordexpirypolicy (policy_ptr_id, deny_only, days) FROM stdin;
\.


--
-- Data for Name: authentik_policies_expression_expressionpolicy; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_policies_expression_expressionpolicy (policy_ptr_id, expression) FROM stdin;
1fcd9f01-2c1c-46aa-80a9-a8aff22d82de	# This policy sets the user for the currently running flow
# by injecting "pending_user"
akadmin = ak_user_by(username="akadmin")
context["flow_plan"].context["pending_user"] = akadmin
return True
2d11e9b6-c1df-4ff8-a663-857576b2df27	# This policy ensures that the setup flow can only be
# executed when the admin user doesn''t have a password set
akadmin = ak_user_by(username="akadmin")
return not akadmin.has_usable_password()
e3d4091e-73d5-47de-a146-613c5954af30	# This policy ensures that the setup flow can only be
# used one time
from authentik.flows.models import Flow, FlowAuthenticationRequirement
Flow.objects.filter(slug="initial-setup").update(
    authentication=FlowAuthenticationRequirement.REQUIRE_SUPERUSER,
)
return True
2250034b-cbfc-40c5-b0e0-de6ad29ebd68	flow_plan = request.context.get("flow_plan")
if not flow_plan:
    return True
# If the user does not have a backend attached to it, they haven't
# been authenticated yet and we need the password stage
return not hasattr(flow_plan.context.get("pending_user"), "backend")
ac887f2e-e1f3-45f2-bb21-9d2ce26cdd6b	# This policy ensures that this flow can only be used when the user
# is in a SSO Flow (meaning they come from an external IdP)
return ak_is_sso_flow
892f327e-9ca3-4a1f-b1f7-2c11aa65e404	# Check if we''ve not been given a username by the external IdP
# and trigger the enrollment flow
return 'username' not in context.get('prompt_data', {})
8582789a-15f4-4152-aa65-59e22ba23560	# This policy ensures that this flow can only be used when the user
# is in a SSO Flow (meaning they come from an external IdP)
return ak_is_sso_flow
fcbde065-5f6c-436e-8d54-41a73e71933b	from authentik.lib.config import CONFIG
from authentik.core.models import (
    USER_ATTRIBUTE_CHANGE_EMAIL,
    USER_ATTRIBUTE_CHANGE_NAME,
    USER_ATTRIBUTE_CHANGE_USERNAME
)
prompt_data = request.context.get("prompt_data")

if not request.user.group_attributes(request.http_request).get(
    USER_ATTRIBUTE_CHANGE_EMAIL, CONFIG.get_bool("default_user_change_email", True)
):
    if prompt_data.get("email") != request.user.email:
        ak_message("Not allowed to change email address.")
        return False

if not request.user.group_attributes(request.http_request).get(
    USER_ATTRIBUTE_CHANGE_NAME, CONFIG.get_bool("default_user_change_name", True)
):
    if prompt_data.get("name") != request.user.name:
        ak_message("Not allowed to change name.")
        return False

if not request.user.group_attributes(request.http_request).get(
    USER_ATTRIBUTE_CHANGE_USERNAME, CONFIG.get_bool("default_user_change_username", True)
):
    if prompt_data.get("username") != request.user.username:
        ak_message("Not allowed to change username.")
        return False

return True
\.


--
-- Data for Name: authentik_policies_password_passwordpolicy; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_policies_password_passwordpolicy (policy_ptr_id, amount_uppercase, amount_lowercase, amount_symbols, length_min, symbol_charset, error_message, password_field, amount_digits, check_have_i_been_pwned, check_static_rules, check_zxcvbn, hibp_allowed_count, zxcvbn_score_threshold) FROM stdin;
\.


--
-- Data for Name: authentik_policies_policybinding; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_policies_policybinding (policy_binding_uuid, enabled, "order", policy_id, target_id, negate, timeout, group_id, user_id, failure_result) FROM stdin;
6a5d8c9f-2365-44b0-88b3-07a5ca90a402	t	0	c8dc06d6-d9a5-4835-809c-8f898d4685a7	db7a6c40-9662-432e-8207-3472cd3939bd	f	30	\N	\N	f
ed80a181-1130-474a-936d-4b7dfffb67be	t	0	df51af85-4091-4630-aa8c-a142a0f9f803	45dfe77b-bf6c-4903-b852-fae84ac14088	f	30	\N	\N	f
f8fc2f42-99d8-4138-b1cb-d7c862792579	t	0	41a3f057-3b85-4108-9d80-1eb5a806e522	849a0b25-960d-4861-a41d-77804415d315	f	30	\N	\N	f
b3836dab-fe6f-45da-8ded-311a85235ca6	t	1	98c5571f-566d-4493-96ec-5591cb880e23	849a0b25-960d-4861-a41d-77804415d315	f	30	\N	\N	f
9ee10a1c-24c9-4332-bac0-27c1fc141811	t	10	2250034b-cbfc-40c5-b0e0-de6ad29ebd68	b2af9d11-28bf-44a8-a493-94ccd2127640	f	30	\N	\N	f
15ca7b92-192b-477b-88a4-39305d231fc3	t	0	ac887f2e-e1f3-45f2-bb21-9d2ce26cdd6b	229216fd-7424-4321-81c2-ccfa8a89261b	f	30	\N	\N	f
50ffcb66-3776-4c32-af41-851d8d6c43f1	t	0	8582789a-15f4-4152-aa65-59e22ba23560	1c7b242e-d689-42c4-acb0-71475b528560	f	30	\N	\N	f
5ab5794f-4ab1-44cd-89f0-a871148dade3	t	0	892f327e-9ca3-4a1f-b1f7-2c11aa65e404	8dbac640-2f02-4f23-9941-9330d52fe836	f	30	\N	\N	f
e2f32eb2-b797-4e61-aace-885d983e0bfa	t	0	2d11e9b6-c1df-4ff8-a663-857576b2df27	05ececf6-4943-4bb8-80c4-1e01ffd5ddf2	f	30	\N	\N	f
98bf6cf8-eaa7-46b6-b121-5505baa4fd91	t	0	1fcd9f01-2c1c-46aa-80a9-a8aff22d82de	e530bf9f-c8a7-4178-8add-074018a5a25b	f	30	\N	\N	f
2e0680fe-f0e9-401d-88fb-e51a2727fc6f	t	0	e3d4091e-73d5-47de-a146-613c5954af30	05103a3f-5a71-4ace-9e29-43054ef516b4	f	30	\N	\N	f
\.


--
-- Data for Name: authentik_policies_reputation_reputation; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_policies_reputation_reputation (reputation_uuid, identifier, ip, ip_geo_data, score, updated, expires, expiring) FROM stdin;
21f09de8-047c-48ee-8b58-8e2ddebe6baa	admin@eidash.app	192.168.107.1	{}	-1	2024-07-17 23:53:51.330117+00	2024-07-18 23:53:51.329036+00	t
b152b617-7f22-43e5-9d5d-ffb1ca15a96b	akadmin	192.168.107.1	{}	1	2024-07-17 23:55:05.89762+00	2024-07-18 23:55:05.897035+00	t
\.


--
-- Data for Name: authentik_policies_reputation_reputationpolicy; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_policies_reputation_reputationpolicy (policy_ptr_id, check_ip, check_username, threshold) FROM stdin;
\.


--
-- Data for Name: authentik_providers_ldap_ldapprovider; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_providers_ldap_ldapprovider (provider_ptr_id, base_dn, search_group_id, certificate_id, tls_server_name, gid_start_number, uid_start_number, search_mode, bind_mode, mfa_support) FROM stdin;
\.


--
-- Data for Name: authentik_providers_oauth2_oauth2provider; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_providers_oauth2_oauth2provider (provider_ptr_id, client_type, client_id, client_secret, redirect_uris, include_claims_in_id_token, refresh_token_validity, signing_key_id, sub_mode, issuer_mode, access_code_validity, access_token_validity) FROM stdin;
1	confidential	zFMbeD2RCQaol3zaVVhMtm8WHkeSYjFJjTNnFyo2	cUIpsthk4TfJXLwBWqeqCzC9kd7uhnpPKP1WLdhhSrirL7yGuGKUmWT4POtf20NpnHETJSHrozIptqTqzENUe6J2OL5q9UQXoCdJ4BC3dfdxstUXUH7I0Fbxqq0doY82	http://localhost:33939/api/oidc/callback	t	days=30	ba84ad03-3078-45f7-92ec-2864f00a6029	hashed_user_id	per_provider	minutes=1	minutes=5
\.


--
-- Data for Name: authentik_providers_oauth2_accesstoken; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_providers_oauth2_accesstoken (id, expires, expiring, revoked, _scope, token, _id_token, provider_id, user_id, auth_time) FROM stdin;
\.


--
-- Data for Name: authentik_providers_oauth2_authorizationcode; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_providers_oauth2_authorizationcode (id, expires, expiring, _scope, code, nonce, code_challenge, code_challenge_method, provider_id, user_id, revoked, auth_time) FROM stdin;
\.


--
-- Data for Name: authentik_providers_oauth2_devicetoken; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_providers_oauth2_devicetoken (id, expires, expiring, device_code, user_code, _scope, provider_id, user_id) FROM stdin;
\.


--
-- Data for Name: authentik_sources_oauth_oauthsource; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_sources_oauth_oauthsource (source_ptr_id, provider_type, request_token_url, authorization_url, access_token_url, profile_url, consumer_key, consumer_secret, additional_scopes, oidc_jwks, oidc_jwks_url, oidc_well_known_url) FROM stdin;
\.


--
-- Data for Name: authentik_providers_oauth2_oauth2provider_jwks_sources; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_providers_oauth2_oauth2provider_jwks_sources (id, oauth2provider_id, oauthsource_id) FROM stdin;
\.


--
-- Data for Name: authentik_providers_oauth2_refreshtoken; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_providers_oauth2_refreshtoken (id, expires, expiring, _scope, _id_token, provider_id, user_id, revoked, token, auth_time) FROM stdin;
1	2024-08-03 22:11:50.555713+00	t	openid profile email	{"iss": "http://localhost:9000/application/o/eidash/", "sub": "b30c34a81716de594611bb24248e425f6f11fcdba0d45d68a0276b8c55d7fc3d", "aud": "zFMbeD2RCQaol3zaVVhMtm8WHkeSYjFJjTNnFyo2", "exp": 1722723110, "iat": 1720131110, "auth_time": 1720131043, "acr": "goauthentik.io/providers/oauth2/default", "amr": null, "c_hash": null, "nonce": "rxCdeWEOpVPVLQxPbQuecw", "at_hash": "9uG0A6ToBv22vlR3Zl3QiQ", "claims": {"email": "admin@eidash.fyko.net", "email_verified": true, "name": "authentik Default Admin", "given_name": "authentik Default Admin", "preferred_username": "akadmin", "nickname": "akadmin", "groups": ["authentik Admins"]}}	1	6	f	Qd3IXs7M4rcRoguYoacJPLZhGMhhwxf3eNiCNh9QUN0ZrOuaAhrReLMQVycuwgkp4tiylORLBAQHo5OD9huN0JjiTznkKitZHgpmczcYBRa15xJjFxQF3sYXfbDRf6pp	2024-07-04 22:10:43.245769+00
\.


--
-- Data for Name: authentik_providers_oauth2_scopemapping; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_providers_oauth2_scopemapping (propertymapping_ptr_id, scope_name, description) FROM stdin;
3475301f-f02c-458d-863e-d5caeef7c24d	openid	
1bb93ede-10b5-4c94-ae5f-859ebcacac1d	email	Email address
824f08af-e8d0-40ce-bd70-e96cf6bbe0c3	profile	General Profile Information
a4a9c3a8-361f-4bbe-814d-6051ce3be643	ak_proxy	authentik Proxy - User information
\.


--
-- Data for Name: authentik_providers_proxy_proxyprovider; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_providers_proxy_proxyprovider (oauth2provider_ptr_id, internal_host, external_host, cookie_secret, certificate_id, skip_path_regex, internal_host_ssl_validation, basic_auth_enabled, basic_auth_password_attribute, basic_auth_user_attribute, cookie_domain, mode, intercept_header_auth) FROM stdin;
\.


--
-- Data for Name: authentik_providers_radius_radiusprovider; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_providers_radius_radiusprovider (provider_ptr_id, shared_secret, client_networks, mfa_support) FROM stdin;
\.


--
-- Data for Name: authentik_providers_saml_samlpropertymapping; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_providers_saml_samlpropertymapping (propertymapping_ptr_id, saml_name, friendly_name) FROM stdin;
d9471722-5913-4cff-bbd7-70d40e338f96	http://schemas.xmlsoap.org/ws/2005/05/identity/claims/upn	\N
c05521d0-c697-447f-aca4-a8e3a7f35845	http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name	\N
8c1689c2-1719-4795-b85a-46a7e7846e36	http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress	\N
4add4a3e-24b7-4751-80a7-66481d2ca506	http://schemas.goauthentik.io/2021/02/saml/username	\N
e4eac546-bb21-4e42-9b73-71ed1d2f73e0	http://schemas.goauthentik.io/2021/02/saml/uid	\N
2fdc5aa6-e5fc-4c93-a4ca-378ff38bcea0	http://schemas.xmlsoap.org/claims/Group	\N
b6fa0488-a8c3-43df-a6c4-b6ab014d4813	http://schemas.microsoft.com/ws/2008/06/identity/claims/windowsaccountname	\N
\.


--
-- Data for Name: authentik_providers_saml_samlprovider; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_providers_saml_samlprovider (provider_ptr_id, acs_url, audience, issuer, assertion_valid_not_before, assertion_valid_not_on_or_after, session_valid_not_on_or_after, digest_algorithm, signature_algorithm, signing_kp_id, sp_binding, verification_kp_id, name_id_mapping_id, default_relay_state) FROM stdin;
\.


--
-- Data for Name: authentik_providers_scim_scimprovider; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_providers_scim_scimprovider (provider_ptr_id, url, token, exclude_users_service_account, filter_group_id) FROM stdin;
\.


--
-- Data for Name: authentik_providers_scim_scimgroup; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_providers_scim_scimgroup (id, group_id, provider_id) FROM stdin;
\.


--
-- Data for Name: authentik_providers_scim_scimmapping; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_providers_scim_scimmapping (propertymapping_ptr_id) FROM stdin;
da3b3444-4b06-4a36-a936-e016bbf086ab
8f8fafad-c228-4a70-a227-fca3bb08d6a0
\.


--
-- Data for Name: authentik_providers_scim_scimprovider_property_mappings_group; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_providers_scim_scimprovider_property_mappings_group (id, scimprovider_id, propertymapping_id) FROM stdin;
\.


--
-- Data for Name: authentik_providers_scim_scimuser; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_providers_scim_scimuser (id, provider_id, user_id) FROM stdin;
\.


--
-- Data for Name: authentik_sources_ldap_ldappropertymapping; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_sources_ldap_ldappropertymapping (propertymapping_ptr_id, object_field) FROM stdin;
d7ae07d0-665d-4c17-aeb7-c9b519fa95ba	path
d562c945-1eb5-40f5-a2db-ace785f68c8c	name
9e3c4359-561c-4a92-9955-88d5328152be	email
900ec8b9-0757-4ca3-9d7a-3202bd51d423	username
44078a67-e319-4e10-8948-23ff68fd5187	attributes.upn
af418008-e712-46ff-bcca-d9d2a2b51eb0	attributes.givenName
04b6a3c7-46cb-4abe-a49b-658e5d70e305	attributes.sn
808ba92b-8874-48dd-a484-234897e1d96f	username
57f3bfdd-aab2-4979-bd50-b8d72bfda5e9	name
\.


--
-- Data for Name: authentik_sources_ldap_ldapsource; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_sources_ldap_ldapsource (source_ptr_id, server_uri, bind_cn, bind_password, start_tls, base_dn, additional_user_dn, additional_group_dn, user_object_filter, group_object_filter, object_uniqueness_field, sync_groups, sync_parent_group_id, sync_users, sync_users_password, group_membership_field, peer_certificate_id, client_certificate_id, sni) FROM stdin;
\.


--
-- Data for Name: authentik_sources_ldap_ldapsource_property_mappings_group; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_sources_ldap_ldapsource_property_mappings_group (id, ldapsource_id, propertymapping_id) FROM stdin;
\.


--
-- Data for Name: authentik_sources_oauth_useroauthsourceconnection; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_sources_oauth_useroauthsourceconnection (usersourceconnection_ptr_id, identifier, access_token) FROM stdin;
\.


--
-- Data for Name: authentik_sources_plex_plexsource; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_sources_plex_plexsource (source_ptr_id, client_id, allowed_servers, allow_friends, plex_token) FROM stdin;
\.


--
-- Data for Name: authentik_sources_plex_plexsourceconnection; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_sources_plex_plexsourceconnection (usersourceconnection_ptr_id, plex_token, identifier) FROM stdin;
\.


--
-- Data for Name: authentik_sources_saml_samlsource; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_sources_saml_samlsource (source_ptr_id, issuer, sso_url, slo_url, signing_kp_id, binding_type, temporary_user_delete_after, name_id_policy, allow_idp_initiated, digest_algorithm, signature_algorithm, pre_authentication_flow_id, verification_kp_id) FROM stdin;
\.


--
-- Data for Name: authentik_sources_saml_usersamlsourceconnection; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_sources_saml_usersamlsourceconnection (usersourceconnection_ptr_id, identifier) FROM stdin;
\.


--
-- Data for Name: authentik_stages_authenticator_duo_authenticatorduostage; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_stages_authenticator_duo_authenticatorduostage (stage_ptr_id, client_id, client_secret, api_hostname, configure_flow_id, admin_integration_key, admin_secret_key, friendly_name) FROM stdin;
\.


--
-- Data for Name: authentik_stages_authenticator_duo_duodevice; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_stages_authenticator_duo_duodevice (id, name, confirmed, duo_user_id, stage_id, user_id, last_t) FROM stdin;
\.


--
-- Data for Name: authentik_stages_authenticator_sms_authenticatorsmsstage; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_stages_authenticator_sms_authenticatorsmsstage (stage_ptr_id, provider, account_sid, auth, configure_flow_id, from_number, auth_password, auth_type, verify_only, mapping_id, friendly_name) FROM stdin;
\.


--
-- Data for Name: authentik_stages_authenticator_sms_smsdevice; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_stages_authenticator_sms_smsdevice (id, name, confirmed, token, valid_until, phone_number, stage_id, user_id, last_t) FROM stdin;
\.


--
-- Data for Name: authentik_stages_authenticator_static_authenticatorstaticstage; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_stages_authenticator_static_authenticatorstaticstage (stage_ptr_id, token_count, configure_flow_id, friendly_name, token_length) FROM stdin;
267ac1c5-6874-4f2d-acef-894dbd9aa4fd	6	0b577208-0411-499f-ab67-b42856fbacdb	\N	12
\.


--
-- Data for Name: authentik_stages_authenticator_static_staticdevice; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_stages_authenticator_static_staticdevice (id, name, confirmed, user_id, throttling_failure_count, throttling_failure_timestamp) FROM stdin;
\.


--
-- Data for Name: authentik_stages_authenticator_static_statictoken; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_stages_authenticator_static_statictoken (id, token, device_id) FROM stdin;
\.


--
-- Data for Name: authentik_stages_authenticator_totp_authenticatortotpstage; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_stages_authenticator_totp_authenticatortotpstage (stage_ptr_id, digits, configure_flow_id, friendly_name) FROM stdin;
667d6f2f-2e0f-4246-89d9-73453020df11	6	23e607e1-7e59-4517-ba5c-3bdc22d752bc	\N
\.


--
-- Data for Name: authentik_stages_authenticator_totp_totpdevice; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_stages_authenticator_totp_totpdevice (id, name, confirmed, key, step, t0, digits, tolerance, drift, last_t, user_id, throttling_failure_count, throttling_failure_timestamp) FROM stdin;
\.


--
-- Data for Name: authentik_stages_authenticator_validate_authenticatorvalida499c; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_stages_authenticator_validate_authenticatorvalida499c (stage_ptr_id, not_configured_action, device_classes, last_auth_threshold, webauthn_user_verification) FROM stdin;
2f745146-31fd-48f6-a5b5-efec8a880674	skip	{static,totp,webauthn,duo,sms}	seconds=0	preferred
\.


--
-- Data for Name: authentik_stages_authenticator_validate_authenticatorvalida3e25; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_stages_authenticator_validate_authenticatorvalida3e25 (id, authenticatorvalidatestage_id, stage_id) FROM stdin;
\.


--
-- Data for Name: authentik_stages_authenticator_webauthn_authenticatewebauth4bbe; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_stages_authenticator_webauthn_authenticatewebauth4bbe (stage_ptr_id, configure_flow_id, user_verification, authenticator_attachment, resident_key_requirement, friendly_name) FROM stdin;
1abf450e-f20e-47cb-af47-c12066982662	d79cfa73-4bc9-4698-af98-74e69aaa70c8	preferred	\N	preferred	\N
\.


--
-- Data for Name: authentik_stages_authenticator_webauthn_webauthndevice; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_stages_authenticator_webauthn_webauthndevice (id, name, credential_id, public_key, sign_count, rp_id, created_on, last_t, user_id, confirmed) FROM stdin;
\.


--
-- Data for Name: authentik_stages_captcha_captchastage; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_stages_captcha_captchastage (stage_ptr_id, public_key, private_key, api_url, js_url) FROM stdin;
\.


--
-- Data for Name: authentik_stages_consent_consentstage; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_stages_consent_consentstage (stage_ptr_id, consent_expire_in, mode) FROM stdin;
f2303313-8760-43a1-aefb-aa2fbb175dae	weeks=4	expiring
\.


--
-- Data for Name: authentik_stages_consent_userconsent; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_stages_consent_userconsent (id, expires, expiring, application_id, user_id, permissions) FROM stdin;
\.


--
-- Data for Name: authentik_stages_deny_denystage; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_stages_deny_denystage (stage_ptr_id, deny_message) FROM stdin;
\.


--
-- Data for Name: authentik_stages_dummy_dummystage; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_stages_dummy_dummystage (stage_ptr_id, throw_error) FROM stdin;
\.


--
-- Data for Name: authentik_stages_email_emailstage; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_stages_email_emailstage (stage_ptr_id, host, port, username, password, use_tls, use_ssl, timeout, from_address, token_expiry, subject, template, use_global_settings, activate_user_on_success) FROM stdin;
\.


--
-- Data for Name: authentik_stages_password_passwordstage; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_stages_password_passwordstage (stage_ptr_id, backends, configure_flow_id, failed_attempts_before_cancel) FROM stdin;
e8bc4b9d-c79d-4e4c-8447-acd2bae86d88	{authentik.core.auth.InbuiltBackend,authentik.sources.ldap.auth.LDAPBackend,authentik.core.auth.TokenBackend}	c932406f-003d-4aa4-85ed-527096352e11	5
\.


--
-- Data for Name: authentik_stages_identification_identificationstage; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_stages_identification_identificationstage (stage_ptr_id, user_fields, enrollment_flow_id, recovery_flow_id, case_insensitive_matching, show_matched_user, password_stage_id, show_source_labels, passwordless_flow_id) FROM stdin;
c95c4e7f-ed5b-45f5-bbbc-a562753e5c9a	{email,username}	\N	\N	t	t	\N	f	\N
\.


--
-- Data for Name: authentik_stages_identification_identificationstage_sources; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_stages_identification_identificationstage_sources (id, identificationstage_id, source_id) FROM stdin;
\.


--
-- Data for Name: authentik_stages_invitation_invitation; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_stages_invitation_invitation (invite_uuid, expires, fixed_data, created_by_id, single_use, expiring, name, flow_id) FROM stdin;
\.


--
-- Data for Name: authentik_stages_invitation_invitationstage; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_stages_invitation_invitationstage (stage_ptr_id, continue_flow_without_invitation) FROM stdin;
\.


--
-- Data for Name: authentik_stages_prompt_prompt; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_stages_prompt_prompt (prompt_uuid, field_key, label, type, required, placeholder, "order", sub_text, placeholder_expression, name, initial_value, initial_value_expression) FROM stdin;
51341f9e-79c7-4f76-8392-df4c8dea4235	oobe-header-text	oobe-header-text	static	t	Welcome to authentik! Please set a password for the default admin user, akadmin.	100		f	initial-setup-field-header		f
30aaeff0-812f-4fac-9071-095da46b2030	email	Email	email	t	Admin email	101		f	initial-setup-field-email		f
52108c99-683c-41e5-9ff8-8ab7e57b478a	password	Password	password	t	Password	300		f	initial-setup-field-password		f
3d2cef14-46ba-49bc-b6ff-163115c95e44	password_repeat	Password (repeat)	password	t	Password (repeat)	301		f	initial-setup-field-password-repeat		f
b53ca6a9-706c-4614-856d-8b7ca02d0bd9	password	Password	password	t	Password	300		f	default-password-change-field-password		f
430b54e4-ec0d-446b-b6e4-aeab72bce86a	password_repeat	Password (repeat)	password	t	Password (repeat)	301		f	default-password-change-field-password-repeat		f
1db531b5-c6ac-4b0b-9b8e-438d38d2b5ce	username	Username	text	t	Username	100		f	default-source-enrollment-field-username		f
3bcd0497-3f8a-457b-a351-2b1fbfbf5b93	username	Username	text	t	Username	200		f	default-user-settings-field-username	try:
    return user.username
except:
    return ''	t
218f3bcc-729f-46f0-a4a4-db3a5292c106	name	Name	text	t	Name	201		f	default-user-settings-field-name	try:
    return user.name
except:
    return ''	t
b6ea9e2c-2216-4d36-8586-1059ea2daa23	email	Email	email	t	Email	202		f	default-user-settings-field-email	try:
    return user.email
except:
    return ''	t
5ddc5cc3-bd33-45ca-a163-d6e86140b84e	attributes.settings.locale	Locale	ak-locale	t	Locale	203		f	default-user-settings-field-locale	try:
    return user.attributes.get("settings", {}).get("locale", "")
except:
    return ''	t
\.


--
-- Data for Name: authentik_stages_prompt_promptstage; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_stages_prompt_promptstage (stage_ptr_id) FROM stdin;
98dc588e-96a5-4874-b8cd-911790fa1b42
ba6a5908-7738-4bd7-aedc-797305e16eeb
d4dbae88-c728-4214-ba90-567f7442e8eb
00e3dc29-7e39-4ff8-9d18-8f4299136107
\.


--
-- Data for Name: authentik_stages_prompt_promptstage_fields; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_stages_prompt_promptstage_fields (id, promptstage_id, prompt_id) FROM stdin;
27	98dc588e-96a5-4874-b8cd-911790fa1b42	430b54e4-ec0d-446b-b6e4-aeab72bce86a
28	98dc588e-96a5-4874-b8cd-911790fa1b42	b53ca6a9-706c-4614-856d-8b7ca02d0bd9
33	ba6a5908-7738-4bd7-aedc-797305e16eeb	5ddc5cc3-bd33-45ca-a163-d6e86140b84e
34	ba6a5908-7738-4bd7-aedc-797305e16eeb	218f3bcc-729f-46f0-a4a4-db3a5292c106
35	ba6a5908-7738-4bd7-aedc-797305e16eeb	b6ea9e2c-2216-4d36-8586-1059ea2daa23
36	ba6a5908-7738-4bd7-aedc-797305e16eeb	3bcd0497-3f8a-457b-a351-2b1fbfbf5b93
38	d4dbae88-c728-4214-ba90-567f7442e8eb	1db531b5-c6ac-4b0b-9b8e-438d38d2b5ce
43	00e3dc29-7e39-4ff8-9d18-8f4299136107	30aaeff0-812f-4fac-9071-095da46b2030
44	00e3dc29-7e39-4ff8-9d18-8f4299136107	3d2cef14-46ba-49bc-b6ff-163115c95e44
45	00e3dc29-7e39-4ff8-9d18-8f4299136107	52108c99-683c-41e5-9ff8-8ab7e57b478a
46	00e3dc29-7e39-4ff8-9d18-8f4299136107	51341f9e-79c7-4f76-8392-df4c8dea4235
\.


--
-- Data for Name: authentik_stages_prompt_promptstage_validation_policies; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_stages_prompt_promptstage_validation_policies (id, promptstage_id, policy_id) FROM stdin;
4	ba6a5908-7738-4bd7-aedc-797305e16eeb	fcbde065-5f6c-436e-8d54-41a73e71933b
\.


--
-- Data for Name: authentik_stages_user_delete_userdeletestage; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_stages_user_delete_userdeletestage (stage_ptr_id) FROM stdin;
\.


--
-- Data for Name: authentik_stages_user_login_userloginstage; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_stages_user_login_userloginstage (stage_ptr_id, session_duration, terminate_other_sessions, remember_me_offset) FROM stdin;
3b58b610-38de-4325-bd20-3823f3a84fda	seconds=0	f	seconds=0
bd04beb4-8435-40ee-ab1b-26f7550c7437	seconds=0	f	seconds=0
5210d1e5-b48a-4c4a-b7ce-fb96c724ae4e	seconds=0	f	seconds=0
\.


--
-- Data for Name: authentik_stages_user_logout_userlogoutstage; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_stages_user_logout_userlogoutstage (stage_ptr_id) FROM stdin;
7b3d6582-3a80-4178-a543-7c24ad47f426
\.


--
-- Data for Name: authentik_stages_user_write_userwritestage; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_stages_user_write_userwritestage (stage_ptr_id, create_users_as_inactive, create_users_group_id, user_path_template, user_creation_mode, user_type) FROM stdin;
27bbd6cf-03ad-41c5-a366-fc749a213551	f	\N		always_create	external
d72a2eb4-016c-40a6-96cb-ef41982f66f0	f	\N		never_create	external
239ec205-1154-464b-a16e-ec0c4711e115	f	\N		never_create	external
\.


--
-- Data for Name: authentik_tenants_tenant; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.authentik_tenants_tenant (tenant_uuid, domain, "default", branding_title, branding_logo, flow_authentication_id, flow_invalidation_id, flow_recovery_id, flow_unenrollment_id, branding_favicon, event_retention, web_certificate_id, flow_user_settings_id, attributes, flow_device_code_id) FROM stdin;
c7435d4b-5d11-4954-8387-b96c19bd973f	authentik-default	t	authentik	/static/dist/assets/icons/icon_left_brand.svg	dedfb836-3b41-45fe-89e5-615a1d091c18	6dd86ecb-3ba3-40a2-aae1-ae2bef07f689	\N	\N	/static/dist/assets/icons/icon.png	days=365	\N	deb5d725-c4ec-4f10-9a86-176b5dd17b07	{}	\N
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2024-06-19 00:55:11.672457+00
2	contenttypes	0002_remove_content_type_name	2024-06-19 00:55:11.681232+00
3	auth	0001_initial	2024-06-19 00:55:11.715117+00
4	auth	0002_alter_permission_name_max_length	2024-06-19 00:55:11.720931+00
5	auth	0003_alter_user_email_max_length	2024-06-19 00:55:11.724525+00
6	auth	0004_alter_user_username_opts	2024-06-19 00:55:11.72809+00
7	auth	0005_alter_user_last_login_null	2024-06-19 00:55:11.731724+00
8	auth	0006_require_contenttypes_0002	2024-06-19 00:55:11.73367+00
9	auth	0007_alter_validators_add_error_messages	2024-06-19 00:55:11.736842+00
10	auth	0008_alter_user_username_max_length	2024-06-19 00:55:11.740175+00
11	auth	0009_alter_user_last_name_max_length	2024-06-19 00:55:11.743624+00
12	auth	0010_alter_group_name_max_length	2024-06-19 00:55:11.747896+00
13	auth	0011_update_proxy_permissions	2024-06-19 00:55:11.751256+00
14	auth	0012_alter_user_first_name_max_length	2024-06-19 00:55:11.754754+00
15	authentik_policies	0001_initial	2024-06-19 00:55:11.774525+00
16	authentik_policies	0002_auto_20200528_1647	2024-06-19 00:55:11.791408+00
17	authentik_flows	0001_initial	2024-06-19 00:55:11.833545+00
18	authentik_flows	0003_auto_20200523_1133	2024-06-19 00:55:11.835831+00
19	authentik_flows	0006_auto_20200629_0857	2024-06-19 00:55:11.837939+00
20	authentik_flows	0007_auto_20200703_2059	2024-06-19 00:55:11.839946+00
21	authentik_blueprints	0001_initial	2024-06-19 00:55:11.939784+00
22	authentik_blueprints	0002_blueprintinstance_content	2024-06-19 00:55:11.945115+00
23	authentik_blueprints	0003_alter_blueprintinstance_name	2024-06-19 00:55:11.955645+00
24	authentik_rbac	0001_initial	2024-06-19 00:55:11.972231+00
25	authentik_flows	0008_default_flows	2024-06-19 00:55:11.975402+00
26	authentik_flows	0009_source_flows	2024-06-19 00:55:11.978815+00
27	authentik_flows	0010_provider_flows	2024-06-19 00:55:11.981493+00
28	authentik_flows	0011_flow_title	2024-06-19 00:55:11.989212+00
29	authentik_flows	0012_auto_20200908_1542	2024-06-19 00:55:12.020104+00
30	authentik_flows	0013_auto_20200924_1605	2024-06-19 00:55:12.020756+00
31	authentik_flows	0014_auto_20200925_2332	2024-06-19 00:55:12.021287+00
32	authentik_flows	0015_flowstagebinding_evaluate_on_plan	2024-06-19 00:55:12.021842+00
33	authentik_flows	0016_auto_20201202_1307	2024-06-19 00:55:12.022406+00
34	authentik_flows	0017_auto_20210329_1334	2024-06-19 00:55:12.022922+00
35	authentik_flows	0018_oob_flows	2024-06-19 00:55:12.026968+00
36	authentik_flows	0019_alter_flow_background	2024-06-19 00:55:12.038964+00
37	authentik_flows	0020_flow_compatibility_mode	2024-06-19 00:55:12.040045+00
38	authentik_flows	0021_flowstagebinding_invalid_response_action	2024-06-19 00:55:12.040673+00
39	authentik_flows	0022_alter_flowstagebinding_invalid_response_action	2024-06-19 00:55:12.041477+00
40	authentik_flows	0023_alter_flow_background	2024-06-19 00:55:12.042253+00
41	authentik_flows	0024_alter_flow_compatibility_mode	2024-06-19 00:55:12.042865+00
42	authentik_crypto	0001_initial	2024-06-19 00:55:12.049668+00
43	authentik_core	0001_initial	2024-06-19 00:55:12.166786+00
44	authentik_providers_saml	0001_initial	2024-06-19 00:55:12.194445+00
45	authentik_providers_saml	0002_default_saml_property_mappings	2024-06-19 00:55:12.19693+00
46	authentik_providers_saml	0003_samlprovider_sp_binding	2024-06-19 00:55:12.199151+00
47	authentik_providers_saml	0004_auto_20200620_1950	2024-06-19 00:55:12.200832+00
48	authentik_providers_saml	0005_remove_samlprovider_processor_path	2024-06-19 00:55:12.203164+00
49	authentik_core	0002_auto_20200523_1133	2024-06-19 00:55:12.343143+00
50	authentik_core	0003_default_user	2024-06-19 00:55:12.345172+00
51	authentik_core	0004_auto_20200703_2213	2024-06-19 00:55:12.347059+00
52	authentik_core	0005_token_intent	2024-06-19 00:55:12.348949+00
53	authentik_core	0006_auto_20200709_1608	2024-06-19 00:55:12.350846+00
54	authentik_core	0007_auto_20200815_1841	2024-06-19 00:55:12.353145+00
55	authentik_core	0008_auto_20200824_1532	2024-06-19 00:55:12.355092+00
56	authentik_core	0009_group_is_superuser	2024-06-19 00:55:12.356825+00
57	authentik_core	0010_auto_20200917_1021	2024-06-19 00:55:12.359582+00
58	authentik_core	0011_provider_name_temp	2024-06-19 00:55:12.361658+00
59	authentik_providers_saml	0006_remove_samlprovider_name	2024-06-19 00:55:12.373124+00
60	authentik_crypto	0002_create_self_signed_kp	2024-06-19 00:55:12.375676+00
61	authentik_providers_oauth2	0001_initial	2024-06-19 00:55:12.445321+00
62	authentik_providers_oauth2	0002_oauth2provider_sub_mode	2024-06-19 00:55:12.519813+00
63	authentik_providers_oauth2	0003_auto_20200916_2129	2024-06-19 00:55:12.530334+00
64	authentik_providers_oauth2	0004_remove_oauth2provider_post_logout_redirect_uris	2024-06-19 00:55:12.538362+00
65	authentik_providers_oauth2	0005_auto_20200920_1240	2024-06-19 00:55:12.544438+00
66	authentik_providers_oauth2	0006_remove_oauth2provider_name	2024-06-19 00:55:12.560562+00
67	authentik_core	0012_auto_20201003_1737	2024-06-19 00:55:12.66388+00
68	authentik_core	0013_auto_20201003_2132	2024-06-19 00:55:12.664797+00
69	authentik_core	0014_auto_20201018_1158	2024-06-19 00:55:12.665599+00
70	authentik_core	0015_application_icon	2024-06-19 00:55:12.666378+00
71	authentik_core	0016_auto_20201202_2234	2024-06-19 00:55:12.66718+00
72	authentik_core	0017_managed	2024-06-19 00:55:12.687185+00
73	authentik_core	0018_auto_20210330_1345	2024-06-19 00:55:12.777607+00
74	authentik_core	0019_source_managed	2024-06-19 00:55:12.779809+00
75	authentik_core	0020_source_user_matching_mode	2024-06-19 00:55:12.782222+00
76	authentik_core	0021_alter_application_slug	2024-06-19 00:55:12.784298+00
77	authentik_core	0022_authenticatedsession	2024-06-19 00:55:12.786567+00
78	authentik_core	0023_alter_application_meta_launch_url	2024-06-19 00:55:12.788861+00
79	authentik_core	0024_alter_token_identifier	2024-06-19 00:55:12.791199+00
80	authentik_core	0025_alter_application_meta_icon	2024-06-19 00:55:12.793543+00
81	authentik_core	0026_alter_application_meta_icon	2024-06-19 00:55:12.796145+00
82	authentik_core	0027_bootstrap_token	2024-06-19 00:55:12.798773+00
83	authentik_core	0028_alter_token_intent	2024-06-19 00:55:12.801793+00
84	authentik_flows	0020_flowtoken	2024-06-19 00:55:12.821535+00
85	authentik_flows	0021_auto_20211227_2103	2024-06-19 00:55:12.824168+00
86	authentik_flows	0022_flow_layout	2024-06-19 00:55:12.831582+00
87	authentik_flows	0023_flow_denied_action	2024-06-19 00:55:12.839302+00
88	authentik_flows	0024_flow_authentication	2024-06-19 00:55:12.845579+00
89	authentik_flows	0025_alter_flowstagebinding_evaluate_on_plan_and_more	2024-06-19 00:55:12.863373+00
90	authentik_core	0019_application_group	2024-06-19 00:55:12.871863+00
91	authentik_core	0020_application_open_in_new_tab	2024-06-19 00:55:12.880246+00
92	authentik_core	0021_source_user_path_user_path	2024-06-19 00:55:12.895679+00
93	authentik_core	0022_alter_group_parent	2024-06-19 00:55:12.909806+00
94	authentik_core	0023_source_authentik_c_slug_ccb2e5_idx_and_more	2024-06-19 00:55:12.929126+00
95	authentik_core	0024_source_icon	2024-06-19 00:55:12.937304+00
96	authentik_core	0025_alter_provider_authorization_flow	2024-06-19 00:55:12.952496+00
97	authentik_providers_scim	0001_initial	2024-06-19 00:55:13.116622+00
98	authentik_providers_scim	0002_scimuser	2024-06-19 00:55:13.119141+00
99	authentik_providers_scim	0003_scimgroup	2024-06-19 00:55:13.121281+00
100	authentik_providers_scim	0004_scimprovider_property_mappings_group	2024-06-19 00:55:13.124235+00
101	authentik_providers_scim	0005_scimprovider_exclude_users_service_account_and_more	2024-06-19 00:55:13.126106+00
102	authentik_providers_scim	0006_rename_parent_group_scimprovider_filter_group	2024-06-19 00:55:13.128121+00
103	authentik_providers_ldap	0001_initial	2024-06-19 00:55:13.148776+00
104	authentik_providers_ldap	0002_ldapprovider_search_group	2024-06-19 00:55:13.151859+00
105	authentik_providers_ldap	0003_auto_20210713_1138	2024-06-19 00:55:13.15495+00
106	authentik_providers_ldap	0004_auto_20210713_2115	2024-06-19 00:55:13.156696+00
107	authentik_providers_ldap	0005_ldapprovider_search_mode	2024-06-19 00:55:13.158567+00
108	authentik_providers_ldap	0002_ldapprovider_bind_mode	2024-06-19 00:55:13.166927+00
109	authentik_core	0026_alter_propertymapping_name_alter_provider_name	2024-06-19 00:55:13.20986+00
110	authentik_core	0027_alter_user_uuid	2024-06-19 00:55:13.220202+00
111	authentik_core	0028_provider_authentication_flow	2024-06-19 00:55:13.235761+00
112	authentik_core	0029_provider_backchannel_applications_and_more	2024-06-19 00:55:13.289133+00
113	authentik_core	0030_user_type	2024-06-19 00:55:13.306782+00
114	authentik_core	0031_alter_user_type	2024-06-19 00:55:13.325253+00
115	authentik_core	0032_group_roles	2024-06-19 00:55:13.361305+00
116	authentik_crypto	0003_certificatekeypair_managed	2024-06-19 00:55:13.370429+00
117	authentik_crypto	0004_alter_certificatekeypair_name	2024-06-19 00:55:13.388985+00
118	authentik_enterprise	0001_initial	2024-06-19 00:55:13.404246+00
119	authentik_enterprise	0002_rename_users_license_internal_users_and_more	2024-06-19 00:55:13.413236+00
120	authentik_policies	0003_auto_20200908_1542	2024-06-19 00:55:13.428339+00
121	authentik_policies	0004_policy_execution_logging	2024-06-19 00:55:13.433325+00
122	authentik_policies_event_matcher	0001_initial	2024-06-19 00:55:13.451627+00
123	authentik_policies_event_matcher	0002_auto_20201230_2046	2024-06-19 00:55:13.45425+00
124	authentik_policies_event_matcher	0003_auto_20210110_1907	2024-06-19 00:55:13.456576+00
125	authentik_policies_event_matcher	0004_auto_20210112_2158	2024-06-19 00:55:13.4587+00
126	authentik_policies_event_matcher	0005_auto_20210202_1821	2024-06-19 00:55:13.460694+00
127	authentik_policies_event_matcher	0006_auto_20210203_1134	2024-06-19 00:55:13.462471+00
128	authentik_policies_event_matcher	0007_auto_20210209_1657	2024-06-19 00:55:13.464308+00
129	authentik_policies_event_matcher	0008_auto_20210213_1640	2024-06-19 00:55:13.466012+00
130	authentik_policies_event_matcher	0009_auto_20210215_2159	2024-06-19 00:55:13.467512+00
131	authentik_policies_event_matcher	0010_auto_20210222_1821	2024-06-19 00:55:13.468983+00
132	authentik_policies_event_matcher	0011_auto_20210302_0856	2024-06-19 00:55:13.470452+00
133	authentik_policies_event_matcher	0012_auto_20210323_1339	2024-06-19 00:55:13.471886+00
134	authentik_policies_event_matcher	0013_alter_eventmatcherpolicy_app	2024-06-19 00:55:13.473276+00
135	authentik_policies_event_matcher	0014_alter_eventmatcherpolicy_app	2024-06-19 00:55:13.474719+00
136	authentik_policies_event_matcher	0015_alter_eventmatcherpolicy_app	2024-06-19 00:55:13.476103+00
137	authentik_policies_event_matcher	0016_alter_eventmatcherpolicy_action	2024-06-19 00:55:13.477643+00
138	authentik_policies_event_matcher	0017_alter_eventmatcherpolicy_action	2024-06-19 00:55:13.479121+00
139	authentik_policies_event_matcher	0018_alter_eventmatcherpolicy_action	2024-06-19 00:55:13.480529+00
140	authentik_events	0001_initial	2024-06-19 00:55:13.770369+00
141	authentik_events	0002_auto_20200918_2116	2024-06-19 00:55:13.773093+00
142	authentik_events	0003_auto_20200917_1155	2024-06-19 00:55:13.775591+00
143	authentik_events	0004_auto_20200921_1829	2024-06-19 00:55:13.777856+00
144	authentik_events	0005_auto_20201005_2139	2024-06-19 00:55:13.78007+00
145	authentik_events	0006_auto_20201017_2024	2024-06-19 00:55:13.782268+00
146	authentik_events	0007_auto_20201215_0939	2024-06-19 00:55:13.78445+00
147	authentik_events	0008_auto_20201220_1651	2024-06-19 00:55:13.786789+00
148	authentik_events	0009_auto_20201227_1210	2024-06-19 00:55:13.788946+00
149	authentik_events	0010_notification_notificationtransport_notificationrule	2024-06-19 00:55:13.791108+00
150	authentik_events	0011_notification_rules_default_v1	2024-06-19 00:55:13.793199+00
151	authentik_events	0012_auto_20210202_1821	2024-06-19 00:55:13.795195+00
152	authentik_events	0013_auto_20210209_1657	2024-06-19 00:55:13.797249+00
153	authentik_events	0014_expiry	2024-06-19 00:55:13.799259+00
154	authentik_events	0015_alter_event_action	2024-06-19 00:55:13.801195+00
155	authentik_events	0016_add_tenant	2024-06-19 00:55:13.803225+00
156	authentik_events	0017_alter_event_action	2024-06-19 00:55:13.805305+00
157	authentik_events	0018_auto_20210911_2217	2024-06-19 00:55:13.808374+00
158	authentik_events	0019_alter_notificationtransport_webhook_url	2024-06-19 00:55:13.810531+00
159	authentik_events	0002_alter_notificationtransport_mode	2024-06-19 00:55:13.826658+00
160	authentik_flows	0026_alter_flow_options	2024-06-19 00:55:13.832879+00
161	authentik_flows	0027_auto_20231028_1424	2024-06-19 00:55:13.846725+00
162	authentik_outposts	0001_initial	2024-06-19 00:55:14.022444+00
163	authentik_outposts	0002_auto_20200826_1306	2024-06-19 00:55:14.025109+00
164	authentik_outposts	0003_auto_20200827_2108	2024-06-19 00:55:14.027682+00
165	authentik_outposts	0004_auto_20200830_1056	2024-06-19 00:55:14.030155+00
166	authentik_outposts	0005_auto_20200909_1733	2024-06-19 00:55:14.032615+00
167	authentik_outposts	0006_auto_20201003_2239	2024-06-19 00:55:14.034953+00
168	authentik_outposts	0007_remove_outpost_channels	2024-06-19 00:55:14.037376+00
169	authentik_outposts	0008_auto_20201014_1547	2024-06-19 00:55:14.039773+00
170	authentik_outposts	0009_fix_missing_token_identifier	2024-06-19 00:55:14.04222+00
171	authentik_outposts	0010_service_connection	2024-06-19 00:55:14.045039+00
172	authentik_outposts	0011_docker_tls_auth	2024-06-19 00:55:14.047585+00
173	authentik_outposts	0012_service_connection_non_unique	2024-06-19 00:55:14.049646+00
174	authentik_outposts	0013_auto_20201203_2009	2024-06-19 00:55:14.051656+00
175	authentik_outposts	0014_auto_20201213_1407	2024-06-19 00:55:14.053744+00
176	authentik_outposts	0015_auto_20201224_1206	2024-06-19 00:55:14.055868+00
177	authentik_outposts	0016_alter_outpost_type	2024-06-19 00:55:14.057965+00
178	authentik_outposts	0017_outpost_managed	2024-06-19 00:55:14.060038+00
179	authentik_outposts	0018_kubernetesserviceconnection_verify_ssl	2024-06-19 00:55:14.064624+00
180	authentik_outposts	0019_alter_outpost_name_and_more	2024-06-19 00:55:14.1779+00
181	authentik_outposts	0020_alter_outpost_type	2024-06-19 00:55:14.191991+00
182	authentik_policies	0005_binding_group	2024-06-19 00:55:14.252958+00
183	authentik_policies	0006_auto_20210329_1334	2024-06-19 00:55:14.258033+00
184	authentik_policies	0007_policybindingmodel_policy_engine_mode	2024-06-19 00:55:14.268263+00
185	authentik_policies	0008_policybinding_authentik_p_policy__534e15_idx_and_more	2024-06-19 00:55:14.308849+00
186	authentik_policies	0009_alter_policy_name	2024-06-19 00:55:14.323008+00
187	authentik_policies	0010_alter_policy_name	2024-06-19 00:55:14.355331+00
188	authentik_policies	0011_policybinding_failure_result_and_more	2024-06-19 00:55:14.380575+00
189	authentik_policies_dummy	0001_initial	2024-06-19 00:55:14.401129+00
190	authentik_policies_dummy	0002_dummypolicy_authentik_p_policy__648f9b_idx	2024-06-19 00:55:14.408552+00
191	authentik_policies_event_matcher	0019_alter_eventmatcherpolicy_app	2024-06-19 00:55:14.413469+00
192	authentik_policies_event_matcher	0020_eventmatcherpolicy_authentik_p_policy__e605cf_idx	2024-06-19 00:55:14.419925+00
193	authentik_policies_event_matcher	0021_alter_eventmatcherpolicy_app	2024-06-19 00:55:14.424698+00
194	authentik_policies_event_matcher	0022_eventmatcherpolicy_model	2024-06-19 00:55:14.429598+00
195	authentik_policies_event_matcher	0023_alter_eventmatcherpolicy_action_and_more	2024-06-19 00:55:14.455315+00
196	authentik_policies_expiry	0001_initial	2024-06-19 00:55:14.553034+00
197	authentik_policies_expiry	0002_passwordexpirypolicy_authentik_p_policy__cf73a7_idx	2024-06-19 00:55:14.561103+00
198	authentik_policies_expression	0001_initial	2024-06-19 00:55:14.584921+00
199	authentik_policies_expression	0002_auto_20200926_1156	2024-06-19 00:55:14.600972+00
200	authentik_policies_expression	0003_auto_20201203_1223	2024-06-19 00:55:14.618442+00
201	authentik_policies_expression	0004_expressionpolicy_authentik_p_policy__fb6feb_idx	2024-06-19 00:55:14.62614+00
202	authentik_policies_password	0001_initial	2024-06-19 00:55:14.648007+00
203	authentik_policies_password	0002_passwordpolicy_password_field	2024-06-19 00:55:14.653559+00
204	authentik_policies_password	0003_passwordpolicy_amount_digits	2024-06-19 00:55:14.670953+00
205	authentik_policies_password	0004_passwordpolicy_authentik_p_policy__855e80_idx	2024-06-19 00:55:14.679242+00
206	authentik_policies_password	0005_passwordpolicy_check_have_i_been_pwned_and_more	2024-06-19 00:55:14.698109+00
207	authentik_policies_reputation	0001_initial	2024-06-19 00:55:14.751851+00
208	authentik_policies_reputation	0002_auto_20210529_2046	2024-06-19 00:55:14.790945+00
209	authentik_policies_reputation	0003_reputation_delete_ipreputation_delete_userreputation	2024-06-19 00:55:14.804795+00
210	authentik_policies_reputation	0004_reputationpolicy_authentik_p_policy__8f0d70_idx	2024-06-19 00:55:14.812098+00
211	authentik_policies_reputation	0005_reputation_expires_reputation_expiring	2024-06-19 00:55:14.818382+00
212	authentik_providers_ldap	0003_ldapprovider_mfa_support_and_more	2024-06-19 00:55:14.840076+00
213	authentik_sources_oauth	0001_initial	2024-06-19 00:55:14.885504+00
214	authentik_sources_oauth	0002_auto_20200520_1108	2024-06-19 00:55:14.906807+00
215	authentik_sources_oauth	0003_auto_20210416_0726	2024-06-19 00:55:14.922627+00
216	authentik_sources_oauth	0004_auto_20210417_1900	2024-06-19 00:55:14.957103+00
217	authentik_sources_oauth	0005_update_provider_type_names	2024-06-19 00:55:14.975421+00
218	authentik_sources_oauth	0006_oauthsource_additional_scopes	2024-06-19 00:55:15.058395+00
219	authentik_sources_oauth	0007_oauthsource_oidc_jwks_oauthsource_oidc_jwks_url_and_more	2024-06-19 00:55:15.074344+00
220	authentik_providers_oauth2	0007_auto_20201016_1107	2024-06-19 00:55:15.168804+00
221	authentik_providers_oauth2	0008_oauth2provider_issuer_mode	2024-06-19 00:55:15.170014+00
222	authentik_providers_oauth2	0009_remove_oauth2provider_response_type	2024-06-19 00:55:15.171031+00
223	authentik_providers_oauth2	0010_auto_20201227_1804	2024-06-19 00:55:15.172063+00
224	authentik_providers_oauth2	0011_managed	2024-06-19 00:55:15.173066+00
225	authentik_providers_oauth2	0012_oauth2provider_access_code_validity	2024-06-19 00:55:15.174094+00
226	authentik_providers_oauth2	0013_alter_authorizationcode_nonce	2024-06-19 00:55:15.175105+00
227	authentik_providers_oauth2	0014_alter_oauth2provider_rsa_key	2024-06-19 00:55:15.176098+00
228	authentik_providers_oauth2	0015_auto_20210703_1313	2024-06-19 00:55:15.177172+00
229	authentik_providers_oauth2	0016_alter_authorizationcode_nonce	2024-06-19 00:55:15.178331+00
230	authentik_providers_oauth2	0017_alter_oauth2provider_token_validity	2024-06-19 00:55:15.179345+00
231	authentik_providers_oauth2	0008_rename_rsa_key_oauth2provider_signing_key_and_more	2024-06-19 00:55:15.19453+00
232	authentik_providers_oauth2	0009_oauth2provider_verification_keys_and_more	2024-06-19 00:55:15.237596+00
233	authentik_providers_oauth2	0010_alter_oauth2provider_verification_keys	2024-06-19 00:55:15.253867+00
234	authentik_providers_oauth2	0011_oauth2provider_jwks_sources_and_more	2024-06-19 00:55:15.297211+00
235	authentik_providers_oauth2	0012_remove_oauth2provider_verification_keys	2024-06-19 00:55:15.321261+00
236	authentik_providers_oauth2	0013_devicetoken	2024-06-19 00:55:15.426134+00
237	authentik_providers_oauth2	0014_alter_refreshtoken_options_and_more	2024-06-19 00:55:15.514814+00
238	authentik_providers_oauth2	0015_accesstoken_auth_time_authorizationcode_auth_time_and_more	2024-06-19 00:55:15.548759+00
239	authentik_providers_oauth2	0016_alter_refreshtoken_token	2024-06-19 00:55:15.568705+00
240	authentik_providers_proxy	0001_initial	2024-06-19 00:55:15.63268+00
241	authentik_providers_proxy	0002_proxyprovider_cookie_secret	2024-06-19 00:55:15.635716+00
242	authentik_providers_proxy	0003_proxyprovider_certificate	2024-06-19 00:55:15.639234+00
243	authentik_providers_proxy	0004_auto_20200913_1947	2024-06-19 00:55:15.641764+00
244	authentik_providers_proxy	0005_auto_20200914_1536	2024-06-19 00:55:15.64464+00
245	authentik_providers_proxy	0006_proxyprovider_skip_path_regex	2024-06-19 00:55:15.64735+00
246	authentik_providers_proxy	0007_auto_20200923_1017	2024-06-19 00:55:15.649987+00
247	authentik_providers_proxy	0008_auto_20200930_0810	2024-06-19 00:55:15.652617+00
248	authentik_providers_proxy	0009_auto_20201007_1721	2024-06-19 00:55:15.655174+00
249	authentik_providers_proxy	0010_auto_20201214_0942	2024-06-19 00:55:15.657742+00
250	authentik_providers_proxy	0011_proxyprovider_forward_auth_mode	2024-06-19 00:55:15.660251+00
251	authentik_providers_proxy	0012_proxyprovider_cookie_domain	2024-06-19 00:55:15.66276+00
252	authentik_providers_proxy	0013_mode	2024-06-19 00:55:15.665182+00
253	authentik_providers_proxy	0014_proxy_v2	2024-06-19 00:55:15.667623+00
254	authentik_providers_proxy	0015_proxyprovider_receive_header_auth	2024-06-19 00:55:15.675929+00
255	authentik_providers_radius	0001_initial	2024-06-19 00:55:15.700546+00
256	authentik_providers_radius	0002_radiusprovider_mfa_support	2024-06-19 00:55:15.709608+00
257	authentik_providers_saml	0007_samlprovider_verification_kp	2024-06-19 00:55:15.83144+00
258	authentik_providers_saml	0008_auto_20201112_1036	2024-06-19 00:55:15.884061+00
259	authentik_providers_saml	0009_auto_20201112_2016	2024-06-19 00:55:15.897046+00
260	authentik_providers_saml	0010_auto_20201230_2112	2024-06-19 00:55:15.904824+00
261	authentik_providers_saml	0011_samlprovider_name_id_mapping	2024-06-19 00:55:15.929741+00
262	authentik_providers_saml	0012_managed	2024-06-19 00:55:15.948587+00
263	authentik_providers_saml	0013_samlprovider_default_relay_state	2024-06-19 00:55:15.958665+00
264	authentik_rbac	0002_systempermission	2024-06-19 00:55:15.963249+00
265	authentik_sources_ldap	0001_initial	2024-06-19 00:55:16.18962+00
266	authentik_sources_ldap	0002_ldapsource_sync_users	2024-06-19 00:55:16.192584+00
267	authentik_sources_ldap	0003_default_ldap_property_mappings	2024-06-19 00:55:16.19523+00
268	authentik_sources_ldap	0004_auto_20200524_1146	2024-06-19 00:55:16.197858+00
269	authentik_sources_ldap	0005_auto_20200913_1947	2024-06-19 00:55:16.200357+00
270	authentik_sources_ldap	0006_auto_20200915_1919	2024-06-19 00:55:16.20283+00
271	authentik_sources_ldap	0007_ldapsource_sync_users_password	2024-06-19 00:55:16.205399+00
272	authentik_sources_ldap	0008_managed	2024-06-19 00:55:16.208643+00
273	authentik_sources_ldap	0009_auto_20210204_1834	2024-06-19 00:55:16.211599+00
274	authentik_sources_ldap	0010_auto_20210205_1027	2024-06-19 00:55:16.214661+00
275	authentik_sources_ldap	0011_ldapsource_property_mappings_group	2024-06-19 00:55:16.217035+00
276	authentik_sources_ldap	0012_auto_20210812_1703	2024-06-19 00:55:16.21946+00
277	authentik_sources_ldap	0002_auto_20211203_0900	2024-06-19 00:55:16.251902+00
278	authentik_sources_ldap	0003_ldapsource_client_certificate_ldapsource_sni_and_more	2024-06-19 00:55:16.30192+00
279	authentik_sources_plex	0001_initial	2024-06-19 00:55:16.34893+00
280	authentik_sources_plex	0002_auto_20210505_1717	2024-06-19 00:55:16.366611+00
281	authentik_sources_plex	0003_alter_plexsource_plex_token	2024-06-19 00:55:16.376107+00
282	authentik_sources_saml	0001_initial	2024-06-19 00:55:16.430526+00
283	authentik_sources_saml	0002_auto_20200523_2329	2024-06-19 00:55:16.43325+00
284	authentik_sources_saml	0003_auto_20200624_1957	2024-06-19 00:55:16.436426+00
285	authentik_sources_saml	0004_auto_20200708_1207	2024-06-19 00:55:16.440692+00
286	authentik_sources_saml	0005_samlsource_name_id_policy	2024-06-19 00:55:16.443854+00
287	authentik_sources_saml	0006_samlsource_allow_idp_initiated	2024-06-19 00:55:16.447208+00
288	authentik_sources_saml	0007_auto_20201112_1055	2024-06-19 00:55:16.450334+00
289	authentik_sources_saml	0008_auto_20201112_2016	2024-06-19 00:55:16.453486+00
290	authentik_sources_saml	0009_auto_20210301_0949	2024-06-19 00:55:16.456693+00
291	authentik_sources_saml	0010_samlsource_pre_authentication_flow	2024-06-19 00:55:16.481566+00
292	authentik_sources_saml	0011_auto_20210324_0736	2024-06-19 00:55:16.504741+00
293	authentik_sources_saml	0012_usersamlsourceconnection	2024-06-19 00:55:16.606919+00
294	authentik_sources_saml	0013_samlsource_verification_kp_and_more	2024-06-19 00:55:16.664757+00
295	authentik_stages_authenticator_duo	0001_initial	2024-06-19 00:55:16.720038+00
296	authentik_stages_authenticator_duo	0002_default_setup_flow	2024-06-19 00:55:16.723357+00
297	authentik_stages_authenticator_duo	0003_duodevice_last_t	2024-06-19 00:55:16.734016+00
298	authentik_stages_authenticator_duo	0004_authenticatorduostage_admin_integration_key_and_more	2024-06-19 00:55:16.746072+00
299	authentik_stages_authenticator_duo	0005_authenticatorduostage_friendly_name	2024-06-19 00:55:16.754801+00
300	authentik_stages_authenticator_sms	0001_initial	2024-06-19 00:55:16.813985+00
301	authentik_stages_authenticator_sms	0002_authenticatorsmsstage_from_number	2024-06-19 00:55:16.817362+00
302	authentik_stages_authenticator_sms	0003_auto_20211014_0813	2024-06-19 00:55:16.820683+00
303	authentik_stages_authenticator_sms	0004_auto_20211014_0936	2024-06-19 00:55:16.823937+00
304	authentik_stages_authenticator_sms	0002_alter_authenticatorsmsstage_from_number	2024-06-19 00:55:16.831908+00
305	authentik_stages_authenticator_sms	0003_smsdevice_last_used_on	2024-06-19 00:55:16.842363+00
306	authentik_stages_authenticator_sms	0004_authenticatorsmsstage_verify_only_and_more	2024-06-19 00:55:16.862252+00
307	authentik_stages_authenticator_sms	0005_authenticatorsmsstage_mapping	2024-06-19 00:55:16.888581+00
308	authentik_stages_authenticator_sms	0006_authenticatorsmsstage_friendly_name	2024-06-19 00:55:16.898201+00
309	authentik_stages_authenticator_static	0001_initial	2024-06-19 00:55:17.00311+00
310	authentik_stages_authenticator_static	0002_otpstaticstage_configure_flow	2024-06-19 00:55:17.027898+00
311	authentik_stages_authenticator_static	0003_default_setup_flow	2024-06-19 00:55:17.030849+00
312	authentik_stages_authenticator_static	0004_auto_20210216_0838	2024-06-19 00:55:17.060989+00
313	authentik_stages_authenticator_static	0005_default_setup_flow	2024-06-19 00:55:17.0643+00
314	authentik_stages_authenticator_static	0006_authenticatorstaticstage_friendly_name	2024-06-19 00:55:17.074226+00
315	authentik_stages_authenticator_static	0007_authenticatorstaticstage_token_length_and_more	2024-06-19 00:55:17.087096+00
316	authentik_stages_authenticator_static	0008_initial	2024-06-19 00:55:17.146096+00
317	authentik_stages_authenticator_static	0009_throttling	2024-06-19 00:55:17.178023+00
318	authentik_stages_authenticator_totp	0001_initial	2024-06-19 00:55:17.203519+00
319	authentik_stages_authenticator_totp	0002_auto_20200701_1900	2024-06-19 00:55:17.209441+00
320	authentik_stages_authenticator_totp	0003_otptimestage_configure_flow	2024-06-19 00:55:17.235486+00
321	authentik_stages_authenticator_totp	0004_default_setup_flow	2024-06-19 00:55:17.239137+00
322	authentik_stages_authenticator_totp	0005_auto_20210216_0838	2024-06-19 00:55:17.271035+00
323	authentik_stages_authenticator_totp	0006_default_setup_flow	2024-06-19 00:55:17.275508+00
324	authentik_stages_authenticator_totp	0007_authenticatortotpstage_friendly_name	2024-06-19 00:55:17.285806+00
325	authentik_stages_authenticator_totp	0008_initial	2024-06-19 00:55:17.317621+00
326	authentik_stages_authenticator_totp	0009_auto_20190420_0723	2024-06-19 00:55:17.335934+00
327	authentik_stages_authenticator_totp	0010_alter_totpdevice_key	2024-06-19 00:55:17.434553+00
328	authentik_stages_authenticator_validate	0001_initial	2024-06-19 00:55:17.462765+00
329	authentik_stages_authenticator_validate	0002_auto_20210216_0838	2024-06-19 00:55:17.490838+00
330	authentik_stages_authenticator_validate	0003_authenticatorvalidatestage_device_classes	2024-06-19 00:55:17.49832+00
331	authentik_stages_authenticator_validate	0004_auto_20210301_0949	2024-06-19 00:55:17.504213+00
332	authentik_stages_authenticator_validate	0005_authenticatorvalidatestage_configuration_stage	2024-06-19 00:55:17.531564+00
333	authentik_stages_authenticator_validate	0006_auto_20210301_1757	2024-06-19 00:55:17.537779+00
334	authentik_stages_authenticator_validate	0007_auto_20210403_0927	2024-06-19 00:55:17.543314+00
335	authentik_stages_authenticator_validate	0008_alter_authenticatorvalidatestage_device_classes	2024-06-19 00:55:17.548955+00
336	authentik_stages_authenticator_validate	0009_default_stage	2024-06-19 00:55:17.551994+00
337	authentik_stages_authenticator_validate	0010_remove_authenticatorvalidatestage_configuration_stage_and_more	2024-06-19 00:55:17.629373+00
338	authentik_stages_authenticator_validate	0011_authenticatorvalidatestage_last_auth_threshold	2024-06-19 00:55:17.636369+00
339	authentik_stages_authenticator_validate	0012_authenticatorvalidatestage_webauthn_user_verification	2024-06-19 00:55:17.643245+00
340	authentik_stages_authenticator_webauthn	0001_initial	2024-06-19 00:55:17.705069+00
341	authentik_stages_authenticator_webauthn	0002_default_setup_flow	2024-06-19 00:55:17.708713+00
342	authentik_stages_authenticator_webauthn	0003_webauthndevice_confirmed	2024-06-19 00:55:17.718986+00
343	authentik_stages_authenticator_webauthn	0004_auto_20210304_1850	2024-06-19 00:55:17.728855+00
344	authentik_stages_authenticator_webauthn	0005_authenticatewebauthnstage_user_verification	2024-06-19 00:55:17.740536+00
345	authentik_stages_authenticator_webauthn	0006_authenticatewebauthnstage_authenticator_attachment_and_more	2024-06-19 00:55:17.832892+00
346	authentik_stages_authenticator_webauthn	0007_rename_last_used_on_webauthndevice_last_t	2024-06-19 00:55:17.844362+00
347	authentik_stages_authenticator_webauthn	0008_alter_webauthndevice_credential_id	2024-06-19 00:55:17.856593+00
348	authentik_stages_authenticator_webauthn	0009_authenticatewebauthnstage_friendly_name	2024-06-19 00:55:17.865606+00
349	authentik_stages_captcha	0001_initial	2024-06-19 00:55:17.896338+00
350	authentik_stages_captcha	0002_captchastage_api_url_captchastage_js_url_and_more	2024-06-19 00:55:17.914355+00
351	authentik_stages_consent	0001_initial	2024-06-19 00:55:17.944517+00
352	authentik_stages_consent	0002_auto_20200720_0941	2024-06-19 00:55:17.989222+00
353	authentik_stages_consent	0003_auto_20200924_1403	2024-06-19 00:55:18.012595+00
354	authentik_stages_consent	0004_alter_userconsent_unique_together_and_more	2024-06-19 00:55:18.054411+00
355	authentik_stages_consent	0005_alter_consentstage_mode	2024-06-19 00:55:18.061507+00
356	authentik_stages_deny	0001_initial	2024-06-19 00:55:18.091797+00
357	authentik_stages_deny	0002_denystage_deny_message	2024-06-19 00:55:18.102547+00
358	authentik_stages_dummy	0001_initial	2024-06-19 00:55:18.133083+00
359	authentik_stages_dummy	0002_dummystage_throw_error	2024-06-19 00:55:18.141385+00
360	authentik_stages_email	0001_initial	2024-06-19 00:55:18.248672+00
361	authentik_stages_email	0002_emailstage_use_global_settings	2024-06-19 00:55:18.276376+00
362	authentik_stages_email	0003_auto_20210404_1054	2024-06-19 00:55:18.284598+00
363	authentik_stages_email	0004_emailstage_activate_user_on_success	2024-06-19 00:55:18.292654+00
364	authentik_stages_password	0001_initial	2024-06-19 00:55:18.325742+00
365	authentik_stages_password	0002_passwordstage_change_flow	2024-06-19 00:55:18.355277+00
366	authentik_stages_password	0003_passwordstage_failed_attempts_before_cancel	2024-06-19 00:55:18.365787+00
367	authentik_stages_password	0004_auto_20200925_1057	2024-06-19 00:55:18.399135+00
368	authentik_stages_password	0005_auto_20210402_2221	2024-06-19 00:55:18.410119+00
369	authentik_stages_identification	0001_initial	2024-06-19 00:55:18.441286+00
370	authentik_stages_identification	0002_auto_20200530_2204	2024-06-19 00:55:18.711042+00
371	authentik_stages_identification	0003_auto_20200615_1641	2024-06-19 00:55:18.714107+00
372	authentik_stages_identification	0004_identificationstage_case_insensitive_matching	2024-06-19 00:55:18.717066+00
373	authentik_stages_identification	0005_auto_20201003_1734	2024-06-19 00:55:18.71989+00
374	authentik_stages_identification	0006_identificationstage_show_matched_user	2024-06-19 00:55:18.722717+00
375	authentik_stages_identification	0007_remove_identificationstage_template	2024-06-19 00:55:18.72554+00
376	authentik_stages_identification	0008_alter_identificationstage_user_fields	2024-06-19 00:55:18.728416+00
377	authentik_stages_identification	0009_identificationstage_sources	2024-06-19 00:55:18.7313+00
378	authentik_stages_identification	0010_identificationstage_password_stage	2024-06-19 00:55:18.734036+00
379	authentik_stages_identification	0011_alter_identificationstage_user_fields	2024-06-19 00:55:18.737565+00
380	authentik_stages_identification	0012_identificationstage_show_source_labels	2024-06-19 00:55:18.741178+00
381	authentik_stages_identification	0013_identificationstage_passwordless_flow	2024-06-19 00:55:18.745099+00
382	authentik_stages_invitation	0001_initial	2024-06-19 00:55:18.83471+00
383	authentik_stages_invitation	0002_auto_20201225_2143	2024-06-19 00:55:18.838135+00
384	authentik_stages_invitation	0003_auto_20201227_1210	2024-06-19 00:55:18.84108+00
385	authentik_stages_invitation	0004_invitation_single_use	2024-06-19 00:55:18.844457+00
386	authentik_stages_invitation	0005_auto_20210901_1211	2024-06-19 00:55:18.847727+00
387	authentik_stages_invitation	0006_invitation_name	2024-06-19 00:55:18.850869+00
388	authentik_stages_invitation	0007_invitation_flow	2024-06-19 00:55:18.957504+00
389	authentik_stages_password	0006_passwordchange_rename	2024-06-19 00:55:18.961406+00
390	authentik_stages_password	0007_app_password	2024-06-19 00:55:18.994506+00
391	authentik_stages_password	0008_replace_inbuilt	2024-06-19 00:55:19.019248+00
392	authentik_stages_prompt	0001_initial	2024-06-19 00:55:19.080767+00
393	authentik_stages_prompt	0002_auto_20200920_1859	2024-06-19 00:55:19.105727+00
394	authentik_stages_prompt	0003_auto_20210222_1821	2024-06-19 00:55:19.131465+00
395	authentik_stages_prompt	0004_prompt_sub_text	2024-06-19 00:55:19.13766+00
396	authentik_stages_prompt	0005_alter_prompt_field_key	2024-06-19 00:55:19.165869+00
397	authentik_stages_prompt	0006_alter_prompt_type	2024-06-19 00:55:19.192798+00
398	authentik_stages_prompt	0007_prompt_placeholder_expression	2024-06-19 00:55:19.223568+00
399	authentik_stages_prompt	0008_alter_prompt_type	2024-06-19 00:55:19.324532+00
400	authentik_stages_prompt	0009_prompt_name	2024-06-19 00:55:19.380298+00
401	authentik_stages_prompt	0010_alter_prompt_placeholder_alter_prompt_type	2024-06-19 00:55:19.427638+00
402	authentik_stages_prompt	0011_prompt_initial_value_prompt_initial_value_expression_and_more	2024-06-19 00:55:19.481853+00
403	authentik_stages_user_delete	0001_initial	2024-06-19 00:55:19.519323+00
404	authentik_stages_user_login	0001_initial	2024-06-19 00:55:19.554007+00
405	authentik_stages_user_login	0002_userloginstage_session_duration	2024-06-19 00:55:19.565352+00
406	authentik_stages_user_login	0003_session_duration_delta	2024-06-19 00:55:19.681575+00
407	authentik_stages_user_login	0004_userloginstage_terminate_other_sessions	2024-06-19 00:55:19.692073+00
408	authentik_stages_user_login	0005_userloginstage_remember_me_offset	2024-06-19 00:55:19.701774+00
409	authentik_stages_user_logout	0001_initial	2024-06-19 00:55:19.735369+00
410	authentik_stages_user_write	0001_initial	2024-06-19 00:55:19.770679+00
411	authentik_stages_user_write	0002_auto_20200918_1653	2024-06-19 00:55:19.797753+00
412	authentik_stages_user_write	0003_userwritestage_create_users_as_inactive	2024-06-19 00:55:19.809762+00
413	authentik_stages_user_write	0004_userwritestage_create_users_group	2024-06-19 00:55:19.84463+00
414	authentik_stages_user_write	0005_userwritestage_user_path_template	2024-06-19 00:55:19.861153+00
415	authentik_stages_user_write	0006_userwritestage_can_create_users	2024-06-19 00:55:19.875155+00
416	authentik_stages_user_write	0007_remove_userwritestage_can_create_users_and_more	2024-06-19 00:55:19.923529+00
417	authentik_stages_user_write	0008_userwritestage_user_type	2024-06-19 00:55:20.014087+00
418	authentik_tenants	0001_initial	2024-06-19 00:55:20.107178+00
419	authentik_tenants	0002_default	2024-06-19 00:55:20.11035+00
420	authentik_tenants	0003_tenant_branding_favicon	2024-06-19 00:55:20.113414+00
421	authentik_tenants	0004_tenant_event_retention	2024-06-19 00:55:20.116368+00
422	authentik_tenants	0005_tenant_web_certificate	2024-06-19 00:55:20.119686+00
423	authentik_tenants	0002_tenant_flow_user_settings	2024-06-19 00:55:20.149992+00
424	authentik_tenants	0003_tenant_attributes	2024-06-19 00:55:20.162886+00
425	authentik_tenants	0004_tenant_flow_device_code	2024-06-19 00:55:20.195307+00
426	guardian	0001_initial	2024-06-19 00:55:20.284095+00
427	guardian	0002_generic_permissions_index	2024-06-19 00:55:20.302091+00
428	sessions	0001_initial	2024-06-19 00:55:20.31782+00
429	authentik_events	0001_squashed_0019_alter_notificationtransport_webhook_url	2024-06-19 00:55:20.325319+00
430	authentik_flows	0012_auto_20200908_1542_squashed_0017_auto_20210329_1334	2024-06-19 00:55:20.328439+00
431	authentik_flows	0001_squashed_0007_auto_20200703_2059	2024-06-19 00:55:20.331237+00
432	authentik_flows	0019_alter_flow_background_squashed_0024_alter_flow_compatibility_mode	2024-06-19 00:55:20.335314+00
433	authentik_outposts	0001_squashed_0017_outpost_managed	2024-06-19 00:55:20.338563+00
434	authentik_policies_event_matcher	0001_squashed_0018_alter_eventmatcherpolicy_action	2024-06-19 00:55:20.341906+00
435	authentik_providers_ldap	0001_squashed_0005_ldapprovider_search_mode	2024-06-19 00:55:20.344856+00
436	authentik_providers_oauth2	0007_auto_20201016_1107_squashed_0017_alter_oauth2provider_token_validity	2024-06-19 00:55:20.347569+00
437	authentik_providers_proxy	0001_squashed_0014_proxy_v2	2024-06-19 00:55:20.35041+00
438	authentik_providers_saml	0001_squashed_0005_remove_samlprovider_processor_path	2024-06-19 00:55:20.353033+00
439	authentik_providers_scim	0001_squashed_0006_rename_parent_group_scimprovider_filter_group	2024-06-19 00:55:20.355577+00
440	authentik_sources_ldap	0001_squashed_0012_auto_20210812_1703	2024-06-19 00:55:20.358346+00
441	authentik_sources_saml	0001_squashed_0009_auto_20210301_0949	2024-06-19 00:55:20.361606+00
442	authentik_stages_authenticator_sms	0001_squashed_0004_auto_20211014_0936	2024-06-19 00:55:20.364333+00
443	authentik_stages_identification	0002_auto_20200530_2204_squashed_0013_identificationstage_passwordless_flow	2024-06-19 00:55:20.369042+00
444	authentik_stages_invitation	0001_squashed_0006_invitation_name	2024-06-19 00:55:20.372602+00
445	authentik_tenants	0001_squashed_0005_tenant_web_certificate	2024-06-19 00:55:20.37587+00
446	authentik_core	0018_auto_20210330_1345_squashed_0028_alter_token_intent	2024-06-19 00:55:20.379258+00
447	authentik_core	0002_auto_20200523_1133_squashed_0011_provider_name_temp	2024-06-19 00:55:20.382704+00
448	authentik_core	0012_auto_20201003_1737_squashed_0016_auto_20201202_2234	2024-06-19 00:55:20.386561+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: guardian_groupobjectpermission; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.guardian_groupobjectpermission (id, object_pk, content_type_id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: guardian_userobjectpermission; Type: TABLE DATA; Schema: public; Owner: authentik
--

COPY public.guardian_userobjectpermission (id, object_pk, content_type_id, permission_id, user_id) FROM stdin;
60	8a128d96-bfd6-43bb-ba3d-850ff246bd52	15	64	2
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: authentik
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: authentik
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: authentik
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 397, true);


--
-- Name: authentik_core_group_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: authentik
--

SELECT pg_catalog.setval('public.authentik_core_group_roles_id_seq', 1, false);


--
-- Name: authentik_core_provider_id_seq; Type: SEQUENCE SET; Schema: public; Owner: authentik
--

SELECT pg_catalog.setval('public.authentik_core_provider_id_seq', 1, true);


--
-- Name: authentik_core_provider_property_mappings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: authentik
--

SELECT pg_catalog.setval('public.authentik_core_provider_property_mappings_id_seq', 3, true);


--
-- Name: authentik_core_source_property_mappings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: authentik
--

SELECT pg_catalog.setval('public.authentik_core_source_property_mappings_id_seq', 1, false);


--
-- Name: authentik_core_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: authentik
--

SELECT pg_catalog.setval('public.authentik_core_user_groups_id_seq', 1, false);


--
-- Name: authentik_core_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: authentik
--

SELECT pg_catalog.setval('public.authentik_core_user_id_seq', 6, true);


--
-- Name: authentik_core_user_pb_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: authentik
--

SELECT pg_catalog.setval('public.authentik_core_user_pb_groups_id_seq', 4, true);


--
-- Name: authentik_core_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: authentik
--

SELECT pg_catalog.setval('public.authentik_core_user_user_permissions_id_seq', 60, true);


--
-- Name: authentik_core_usersourceconnection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: authentik
--

SELECT pg_catalog.setval('public.authentik_core_usersourceconnection_id_seq', 1, false);


--
-- Name: authentik_events_notificationrule_transports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: authentik
--

SELECT pg_catalog.setval('public.authentik_events_notificationrule_transports_id_seq', 12, true);


--
-- Name: authentik_outposts_outpost_providers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: authentik
--

SELECT pg_catalog.setval('public.authentik_outposts_outpost_providers_id_seq', 1, false);


--
-- Name: authentik_providers_oauth2_accesstoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: authentik
--

SELECT pg_catalog.setval('public.authentik_providers_oauth2_accesstoken_id_seq', 1, true);


--
-- Name: authentik_providers_oauth2_authorizationcode_id_seq; Type: SEQUENCE SET; Schema: public; Owner: authentik
--

SELECT pg_catalog.setval('public.authentik_providers_oauth2_authorizationcode_id_seq', 1, true);


--
-- Name: authentik_providers_oauth2_devicetoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: authentik
--

SELECT pg_catalog.setval('public.authentik_providers_oauth2_devicetoken_id_seq', 1, false);


--
-- Name: authentik_providers_oauth2_oauth2provider_jwks_sources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: authentik
--

SELECT pg_catalog.setval('public.authentik_providers_oauth2_oauth2provider_jwks_sources_id_seq', 1, false);


--
-- Name: authentik_providers_oauth2_refreshtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: authentik
--

SELECT pg_catalog.setval('public.authentik_providers_oauth2_refreshtoken_id_seq', 1, true);


--
-- Name: authentik_providers_scim_scimprovider_property_mappings__id_seq; Type: SEQUENCE SET; Schema: public; Owner: authentik
--

SELECT pg_catalog.setval('public.authentik_providers_scim_scimprovider_property_mappings__id_seq', 1, false);


--
-- Name: authentik_sources_ldap_ldapsource_property_mappings_grou_id_seq; Type: SEQUENCE SET; Schema: public; Owner: authentik
--

SELECT pg_catalog.setval('public.authentik_sources_ldap_ldapsource_property_mappings_grou_id_seq', 1, false);


--
-- Name: authentik_stages_authenticator_duo_duodevice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: authentik
--

SELECT pg_catalog.setval('public.authentik_stages_authenticator_duo_duodevice_id_seq', 1, false);


--
-- Name: authentik_stages_authenticator_sms_smsdevice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: authentik
--

SELECT pg_catalog.setval('public.authentik_stages_authenticator_sms_smsdevice_id_seq', 1, false);


--
-- Name: authentik_stages_authenticator_static_staticdevice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: authentik
--

SELECT pg_catalog.setval('public.authentik_stages_authenticator_static_staticdevice_id_seq', 1, false);


--
-- Name: authentik_stages_authenticator_static_statictoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: authentik
--

SELECT pg_catalog.setval('public.authentik_stages_authenticator_static_statictoken_id_seq', 1, false);


--
-- Name: authentik_stages_authenticator_totp_totpdevice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: authentik
--

SELECT pg_catalog.setval('public.authentik_stages_authenticator_totp_totpdevice_id_seq', 1, false);


--
-- Name: authentik_stages_authenticator_validate_authenticatorval_id_seq; Type: SEQUENCE SET; Schema: public; Owner: authentik
--

SELECT pg_catalog.setval('public.authentik_stages_authenticator_validate_authenticatorval_id_seq', 1, false);


--
-- Name: authentik_stages_authenticator_webauthn_webauthndevice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: authentik
--

SELECT pg_catalog.setval('public.authentik_stages_authenticator_webauthn_webauthndevice_id_seq', 1, false);


--
-- Name: authentik_stages_consent_userconsent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: authentik
--

SELECT pg_catalog.setval('public.authentik_stages_consent_userconsent_id_seq', 1, false);


--
-- Name: authentik_stages_identification_identificationstage_sour_id_seq; Type: SEQUENCE SET; Schema: public; Owner: authentik
--

SELECT pg_catalog.setval('public.authentik_stages_identification_identificationstage_sour_id_seq', 1, false);


--
-- Name: authentik_stages_prompt_promptstage_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: authentik
--

SELECT pg_catalog.setval('public.authentik_stages_prompt_promptstage_fields_id_seq', 46, true);


--
-- Name: authentik_stages_prompt_promptstage_validation_policies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: authentik
--

SELECT pg_catalog.setval('public.authentik_stages_prompt_promptstage_validation_policies_id_seq', 4, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: authentik
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 96, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: authentik
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 448, true);


--
-- Name: guardian_groupobjectpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: authentik
--

SELECT pg_catalog.setval('public.guardian_groupobjectpermission_id_seq', 1, false);


--
-- Name: guardian_userobjectpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: authentik
--

SELECT pg_catalog.setval('public.guardian_userobjectpermission_id_seq', 60, true);


--
-- PostgreSQL database dump complete
--
