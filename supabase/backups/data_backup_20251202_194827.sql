SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- \restrict Wj1Pl7CSiSc3uV4eZuWIDhKNysMsU2rEDPOtyEPc1C2qubG7nVR3KMz3auyHkgI

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."audit_log_entries" ("instance_id", "id", "payload", "created_at", "ip_address") VALUES
	('00000000-0000-0000-0000-000000000000', 'd2ff4561-1948-4c2d-a2d0-dd6e3a259179', '{"action":"user_confirmation_requested","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-09-22 12:17:07.178495+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fdb17f35-d0df-45e9-923c-fcc46c076ba0', '{"action":"user_signedup","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}', '2025-09-22 12:17:18.377361+00', ''),
	('00000000-0000-0000-0000-000000000000', '47af0469-ee0f-4b1d-8d76-0fd98e2a3213', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-09-22 12:18:55.963218+00', ''),
	('00000000-0000-0000-0000-000000000000', 'db692e6e-3b65-404b-a293-f15ca159f262', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-09-22 12:23:30.859653+00', ''),
	('00000000-0000-0000-0000-000000000000', '761bb67b-fdd8-4288-93a7-dbcb4df43f84', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-22 16:01:33.441993+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fea3d9a3-f521-4063-a994-bc386e35a375', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-22 16:01:33.45344+00', ''),
	('00000000-0000-0000-0000-000000000000', '27ff6560-7695-4f05-99ba-b1076ad04ae8', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-23 06:33:07.564035+00', ''),
	('00000000-0000-0000-0000-000000000000', '40de1418-8af3-46a0-abe2-c49175f60e3a', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-23 06:33:07.589116+00', ''),
	('00000000-0000-0000-0000-000000000000', '4b478f90-7a10-4bab-8f8a-f8e0b954d08d', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-23 22:28:21.289506+00', ''),
	('00000000-0000-0000-0000-000000000000', '5dfe8a57-4a60-47e2-8af0-a736477daa90', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-23 22:28:21.316034+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f3d38916-ce71-42f7-8477-3262144c84d1', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-09-24 12:51:19.141693+00', ''),
	('00000000-0000-0000-0000-000000000000', '9a961e58-e17b-49f4-81cf-b942cde41367', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-24 15:59:14.386748+00', ''),
	('00000000-0000-0000-0000-000000000000', '06dff9d5-a56b-4319-a672-e13ef9f68849', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-24 15:59:14.410779+00', ''),
	('00000000-0000-0000-0000-000000000000', '1d145b33-f84b-459b-ba99-e11163acb0e4', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-09-24 16:28:51.252814+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c528f6e4-94b2-4e4d-beff-b404b7fd5847', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-24 16:58:28.597108+00', ''),
	('00000000-0000-0000-0000-000000000000', '7475c831-68e7-40ce-a2ee-2390b7a2e745', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-24 16:58:28.60896+00', ''),
	('00000000-0000-0000-0000-000000000000', '9fd8523c-55a9-410f-a67a-4b731e6ce4d6', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-24 17:31:02.630151+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c3e120dd-1d2e-4f8a-b854-f35133b2bcb1', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-24 17:31:02.644687+00', ''),
	('00000000-0000-0000-0000-000000000000', 'de6d04a8-186b-4931-9076-9066b6f5ae5c', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-24 18:17:24.498982+00', ''),
	('00000000-0000-0000-0000-000000000000', '29fe1215-bec3-4cd4-8e9d-0e02afe1248e', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-24 18:17:24.518401+00', ''),
	('00000000-0000-0000-0000-000000000000', '1b3b431e-3197-4ad0-8b6c-96c74996fe5b', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-24 18:43:27.53073+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fc7817bb-4178-4914-b0d0-75bf7d36a910', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-24 18:43:27.539124+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a52813a0-429f-49ed-aa77-b94b1782bf52', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-09-25 13:59:02.158703+00', ''),
	('00000000-0000-0000-0000-000000000000', 'dcc4fb1e-3709-409d-8115-0e989894a876', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-25 14:37:26.975089+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f3b99ccd-0741-473e-a69c-49aebe7845a8', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-25 14:37:26.98863+00', ''),
	('00000000-0000-0000-0000-000000000000', '80a06fda-3a97-4dd4-8082-023b571208de', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-25 14:39:59.059465+00', ''),
	('00000000-0000-0000-0000-000000000000', '0388af63-38d5-4a26-a3ad-b9d8112790a7', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-25 14:39:59.061057+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ae078b43-c637-43da-af6e-29401ad2ae98', '{"action":"user_confirmation_requested","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-09-25 14:49:42.739447+00', ''),
	('00000000-0000-0000-0000-000000000000', '6b3a26e7-55e4-4fe4-b1d9-7038b35e9222', '{"action":"user_confirmation_requested","actor_id":"7c263c3e-11b2-468e-a74d-98910c429842","actor_username":"aledip06@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-09-25 14:52:43.102316+00', ''),
	('00000000-0000-0000-0000-000000000000', '49a17e23-81c8-41f0-b798-230656418b3a', '{"action":"user_signedup","actor_id":"7c263c3e-11b2-468e-a74d-98910c429842","actor_username":"aledip06@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}', '2025-09-25 14:53:06.957973+00', ''),
	('00000000-0000-0000-0000-000000000000', '175d783a-5642-44a2-921c-27e9ea1aee9e', '{"action":"user_signedup","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}', '2025-09-25 14:53:13.014903+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cae493ef-88bc-41ba-93c0-f9c951e076ce', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-25 15:43:45.220815+00', ''),
	('00000000-0000-0000-0000-000000000000', 'be5294fe-e04c-4f03-97bd-a6ab3fb44e4a', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-25 15:43:45.238916+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e0cb7d8f-a0da-462b-bb62-827e9a6f02e2', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-25 16:19:31.619823+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd7cd64b3-86d7-4622-98d1-e5b6a98d5a3a', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-25 16:19:31.634532+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e0864b85-3133-46c8-989f-e8416cae3dee', '{"action":"token_refreshed","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-25 16:51:52.417832+00', ''),
	('00000000-0000-0000-0000-000000000000', '8494b73a-ad12-48fb-950c-bfafd60b32aa', '{"action":"token_revoked","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-25 16:51:52.430863+00', ''),
	('00000000-0000-0000-0000-000000000000', '1addb29c-ba31-479e-81ad-cfb4218a5401', '{"action":"login","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-09-25 16:52:50.258498+00', ''),
	('00000000-0000-0000-0000-000000000000', '49e85382-a99e-4274-bdb7-fdd962233837', '{"action":"login","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-09-25 17:00:28.573346+00', ''),
	('00000000-0000-0000-0000-000000000000', '59e61f61-6b0f-4b46-947c-cce62cf3f0c1', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-25 17:18:55.068476+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e73d3b66-8440-4606-8438-fddd5c24853a', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-25 17:18:55.078338+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e8885c4d-d697-4edc-81b1-35d828637f0c', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-25 18:47:17.085561+00', ''),
	('00000000-0000-0000-0000-000000000000', '01910c60-3e9e-4345-8e6d-62436e28c03f', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-25 18:47:17.110527+00', ''),
	('00000000-0000-0000-0000-000000000000', '2766c696-18c4-4894-af30-53daf67f0cfe', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-25 19:07:37.791239+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f1b98771-6055-4a03-ab52-e175f8cf2dad', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-25 19:07:37.800877+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f4db5c89-1b0e-4933-92f7-7b73f75a59a3', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-25 19:53:07.68985+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f115090e-bcc9-4128-aebc-b1b099c98be4', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-25 19:53:07.710619+00', ''),
	('00000000-0000-0000-0000-000000000000', '89704580-13fd-4c08-9aa1-a62ddbc0ffd4', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-25 20:08:54.747015+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c43326a0-019d-4b79-9844-07128b777e5b', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-25 20:08:54.750137+00', ''),
	('00000000-0000-0000-0000-000000000000', '2b0eb15e-0c06-4907-8739-77775bd36557', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-25 20:27:39.191649+00', ''),
	('00000000-0000-0000-0000-000000000000', '683f34d1-5183-4492-8041-9c6aed5f8d06', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-25 20:27:39.201813+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e361d276-621b-49cb-8cc2-54ade6290f8c', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-09-25 20:45:53.035325+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd14e82a5-1dc4-45b7-b16a-a3bbb76c7a1c', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-25 21:26:45.067212+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fca3f3ef-a34b-4781-a500-2b8a37af9855', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-25 21:26:45.087549+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e2c78643-92b1-4781-9a2e-d6ff0ab321df', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-25 21:26:48.023723+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f9befaea-b868-4ccb-b9dd-bcecdd1d7a8b', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-25 21:26:48.025269+00', ''),
	('00000000-0000-0000-0000-000000000000', '6549a5f7-9dd0-438f-afb5-a46b878888d8', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-25 21:34:16.333603+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b56980b0-6491-49ea-a7b7-ae4d26f4f659', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-25 21:34:16.340067+00', ''),
	('00000000-0000-0000-0000-000000000000', '4206d0b4-7fd0-4264-a5a5-60877c41bfb7', '{"action":"token_refreshed","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-25 21:41:38.835118+00', ''),
	('00000000-0000-0000-0000-000000000000', '52731956-defd-455e-af0d-ac124d11c529', '{"action":"token_revoked","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-25 21:41:38.83685+00', ''),
	('00000000-0000-0000-0000-000000000000', '44c462b6-3d4f-4b43-b4c2-953715c14099', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-26 01:50:33.813644+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fe61ed25-99c1-465f-85a3-a6df6da41e64', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-26 01:50:33.8356+00', ''),
	('00000000-0000-0000-0000-000000000000', '09882ffd-4e77-4ab6-a12d-cddf467bcf84', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-26 01:58:29.199941+00', ''),
	('00000000-0000-0000-0000-000000000000', '6958b0db-0a64-48b0-80e9-ef594e958863', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-26 01:58:29.208133+00', ''),
	('00000000-0000-0000-0000-000000000000', 'eaeaaf3a-f0c6-48c9-84dc-ac86b88a57ba', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-26 10:21:49.048269+00', ''),
	('00000000-0000-0000-0000-000000000000', '7e7eccc9-de41-4913-819b-e0dbec59399a', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-26 10:21:49.076924+00', ''),
	('00000000-0000-0000-0000-000000000000', '7e22a116-4c67-42c4-81df-2e207d464837', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-26 10:23:09.882782+00', ''),
	('00000000-0000-0000-0000-000000000000', '9618ad98-5399-49f4-be75-57d522ff8516', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-26 10:23:09.885976+00', ''),
	('00000000-0000-0000-0000-000000000000', '0a6db122-ed0d-487e-977f-64b73bf4c9f4', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-09-26 10:24:59.919806+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a36b20e4-c8ac-41ff-ba4a-201f570d6ae2', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-26 10:55:09.011474+00', ''),
	('00000000-0000-0000-0000-000000000000', '8211434c-eb11-4f4e-8610-9544b6876044', '{"action":"token_refreshed","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-26 12:03:24.007416+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a7f37dc7-cc41-4172-b4a4-716604ec1ae9', '{"action":"token_revoked","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-26 12:03:24.020496+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f50f188c-2a54-489a-91a3-29bcd30d9087', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-26 13:34:53.097093+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e4466aa2-fee4-49c3-8e3e-2907795fea7f', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-26 13:34:53.115955+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c5495c67-fc17-450f-959c-62cbd4304229', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-26 13:34:55.460039+00', ''),
	('00000000-0000-0000-0000-000000000000', '9ab385a8-d1e5-4854-b04c-fd857efd7fca', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-26 13:34:55.464612+00', ''),
	('00000000-0000-0000-0000-000000000000', '3c3e07a0-e65d-4163-983c-7ce82eca687f', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-26 20:07:00.105031+00', ''),
	('00000000-0000-0000-0000-000000000000', '8b9d0725-b18f-4c03-b693-7c239ed890ae', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-26 20:07:00.131914+00', ''),
	('00000000-0000-0000-0000-000000000000', '8d400f05-fc83-4360-9b8b-6ff6c3472691', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-27 00:37:53.172624+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bd67c207-0d86-44a0-ae25-0b7f6c4f7730', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-27 00:37:53.187362+00', ''),
	('00000000-0000-0000-0000-000000000000', '3897d444-87aa-49d9-9804-84ae9864f97a', '{"action":"token_refreshed","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-28 09:14:46.958645+00', ''),
	('00000000-0000-0000-0000-000000000000', '35eda998-75cd-4856-8809-7380e46f5596', '{"action":"token_revoked","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-28 09:14:46.978149+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fabbe8e0-ae2c-4efa-be33-cb368498f7c6', '{"action":"user_recovery_requested","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"user"}', '2025-09-29 14:33:19.433321+00', ''),
	('00000000-0000-0000-0000-000000000000', '3c7072f0-72a4-4939-8387-ef1be6c0b439', '{"action":"login","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"account"}', '2025-09-29 14:33:30.685362+00', ''),
	('00000000-0000-0000-0000-000000000000', '74bf6774-c0a3-4deb-a82c-a35315f7db27', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-29 17:05:09.476441+00', ''),
	('00000000-0000-0000-0000-000000000000', 'be6c92af-641b-48bb-a1c9-796206cfad0c', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-29 17:05:09.501503+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f9b14f5e-56a0-4d88-99a8-2d15dfb64f1d', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-29 17:16:28.426855+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd95956f5-3182-40fe-b45b-e855e9d96796', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-29 17:16:28.43372+00', ''),
	('00000000-0000-0000-0000-000000000000', '3b719d8b-cbbd-4514-a9cf-3098f4322f1e', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-29 18:07:03.007585+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a5bb3dbd-a0fb-4508-b6f5-4b912338d75f', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-29 18:07:03.021014+00', ''),
	('00000000-0000-0000-0000-000000000000', '1e372009-d902-40d8-8bfe-9e716bbbf754', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-29 19:14:44.417643+00', ''),
	('00000000-0000-0000-0000-000000000000', '9694261e-271a-4448-b8cd-0c63317f8e53', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-29 19:14:44.428682+00', ''),
	('00000000-0000-0000-0000-000000000000', 'acac5a7a-238f-4f80-8a6e-27d4a5f184dc', '{"action":"token_refreshed","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-30 08:46:33.11589+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd8a3ef0b-456b-4e80-8eda-080a47dbcb76', '{"action":"token_revoked","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-30 08:46:33.145048+00', ''),
	('00000000-0000-0000-0000-000000000000', 'df7b3ec8-97c3-42c2-b24d-1a0da5e68271', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-18 17:32:17.087217+00', ''),
	('00000000-0000-0000-0000-000000000000', '9b01fcf1-28fe-4d58-a6dc-d15206101602', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-30 16:05:51.715389+00', ''),
	('00000000-0000-0000-0000-000000000000', '26e741c5-443b-4a2e-a4a9-f7fb66a7eb53', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-30 16:05:51.733357+00', ''),
	('00000000-0000-0000-0000-000000000000', '724c5cdc-e851-4c13-8289-5b1198a4cce6', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-30 16:09:37.334122+00', ''),
	('00000000-0000-0000-0000-000000000000', '312de301-cf53-44b1-8d23-2a2a056b70d9', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-30 16:09:37.336484+00', ''),
	('00000000-0000-0000-0000-000000000000', '6904dabf-94a4-4688-a4b5-fa78e30c9a12', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-09-30 16:09:37.438237+00', ''),
	('00000000-0000-0000-0000-000000000000', '4ebef594-af0a-4611-88ba-942c16b29d63', '{"action":"token_refreshed","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-03 15:08:10.118231+00', ''),
	('00000000-0000-0000-0000-000000000000', '8d9e28d2-20cf-4a6f-a2ce-28843d55cc96', '{"action":"token_revoked","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-03 15:08:10.147337+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c3d2ae30-4787-4150-871e-cc803206d601', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-18 17:32:17.110206+00', ''),
	('00000000-0000-0000-0000-000000000000', '9989d10b-998b-4d9c-81bf-53a3e637d7f3', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-18 17:32:37.938657+00', ''),
	('00000000-0000-0000-0000-000000000000', '83ffeaa5-af45-447a-92f7-245df54544a6', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-18 17:32:37.942682+00', ''),
	('00000000-0000-0000-0000-000000000000', '1a07bc0d-b935-4631-8135-bc15abee88ba', '{"action":"user_confirmation_requested","actor_id":"f2a9ef8e-c642-49e9-b34d-110d56848d2a","actor_username":"testuser2025@outlook.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-10-03 15:11:30.857891+00', ''),
	('00000000-0000-0000-0000-000000000000', '20719c67-515b-44b8-b651-cdd3ec9b64f9', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-18 21:52:26.93065+00', ''),
	('00000000-0000-0000-0000-000000000000', '5d2dd87e-dce3-4dfb-9583-c24f59adbc72', '{"action":"user_confirmation_requested","actor_id":"01bdd8a4-23f8-4592-b34c-f385b4f91bef","actor_username":"testanalysis@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-10-03 15:19:57.242458+00', ''),
	('00000000-0000-0000-0000-000000000000', '82419aaf-c8e0-4240-a433-d160133eb2d3', '{"action":"user_confirmation_requested","actor_id":"a084ddce-110d-4aea-924d-044af4750c8e","actor_username":"newdemo@restaurant.it","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-10-03 15:20:38.537539+00', ''),
	('00000000-0000-0000-0000-000000000000', '2e559bdb-881f-49a6-9d06-d043abce74de', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-09 17:10:55.609027+00', ''),
	('00000000-0000-0000-0000-000000000000', '6cf76875-47b7-4d6f-bcf3-fcd2df49d462', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-09 17:12:03.733899+00', ''),
	('00000000-0000-0000-0000-000000000000', '1b2f2d00-4ef6-47d5-aebb-e362cc51ddea', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-09 17:12:48.680883+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e1a0599d-4ee8-4a6e-9783-3523521cb540', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-09 17:30:45.74292+00', ''),
	('00000000-0000-0000-0000-000000000000', '75ad6f1a-d260-4401-80d9-1a5212a65e78', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-09 17:30:45.7586+00', ''),
	('00000000-0000-0000-0000-000000000000', '86bba97a-00b1-4fdd-b07f-3f9617e4cef1', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-09 17:31:29.776547+00', ''),
	('00000000-0000-0000-0000-000000000000', '19e2fa6b-0618-4f9a-a72b-15102fb02075', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-09 18:32:41.523139+00', ''),
	('00000000-0000-0000-0000-000000000000', '7308fb53-c9d1-4e2e-9e7f-6f409f6a60b5', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-09 18:32:41.537423+00', ''),
	('00000000-0000-0000-0000-000000000000', '4fa828ef-78e2-4bb1-a15a-559212c2f866', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-09 19:05:09.905038+00', ''),
	('00000000-0000-0000-0000-000000000000', '158b9c87-6e71-4a35-a4ae-2040f260f67d', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-09 19:05:09.929663+00', ''),
	('00000000-0000-0000-0000-000000000000', '5712c139-4fbc-4cda-b4c8-87f2c36247e4', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-09 19:18:34.026705+00', ''),
	('00000000-0000-0000-0000-000000000000', '02be92d3-cf6e-4ae0-8283-4be2afc59064', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-09 19:18:34.035304+00', ''),
	('00000000-0000-0000-0000-000000000000', '6a637607-29bd-43d3-8e80-cf868f6ba1e8', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-09 19:20:59.337465+00', ''),
	('00000000-0000-0000-0000-000000000000', '79a25e48-92a9-49a9-9bd4-5e39347ad7ca', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-09 19:40:39.940343+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ec6df84d-3a21-4b14-8c00-3d4a006ad015', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-09 19:40:39.955492+00', ''),
	('00000000-0000-0000-0000-000000000000', '1a78ec94-ce38-4e31-9731-74b2457c0849', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-09 20:21:11.796737+00', ''),
	('00000000-0000-0000-0000-000000000000', '68be3c68-e4cc-4a19-b2f1-bc550675241b', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-09 20:21:11.805627+00', ''),
	('00000000-0000-0000-0000-000000000000', '549f7596-5c44-4a46-9317-a1327dc668d2', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-09 21:04:18.781383+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bea8a39d-ed0d-4889-bb61-54758fce4abd', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-09 21:04:18.808458+00', ''),
	('00000000-0000-0000-0000-000000000000', '2ff38192-4dd4-4b2b-a041-45f09b4eccf1', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-10 08:38:49.273357+00', ''),
	('00000000-0000-0000-0000-000000000000', '7cfdb81d-e4fe-4c4f-a099-3f7d2c339b54', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-18 23:43:39.535937+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c5954b21-52e3-48eb-94d6-ae73ed496de3', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-10 08:38:49.302901+00', ''),
	('00000000-0000-0000-0000-000000000000', '7058c765-ca4e-4b40-aebd-abdfc7a913f0', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-10 08:40:09.618832+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b550a40c-e5c7-4fe3-b41e-6900f35931b8', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-10 08:40:09.620809+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cd241f94-c1d9-4000-aad5-58bc2456f05f', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-10 08:43:34.628672+00', ''),
	('00000000-0000-0000-0000-000000000000', '711dc85a-256f-49eb-9f6c-beb02488fcb6', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-10 08:43:34.630726+00', ''),
	('00000000-0000-0000-0000-000000000000', '29eda2a4-7c5d-46c8-a676-3a0c00934e39', '{"action":"token_refreshed","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-10 09:38:33.242677+00', ''),
	('00000000-0000-0000-0000-000000000000', '7a64914b-83a9-45fa-8010-89cea8c4373b', '{"action":"token_revoked","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-10 09:38:33.253266+00', ''),
	('00000000-0000-0000-0000-000000000000', '75e10ff7-bb4b-4161-adbd-80224219fdec', '{"action":"login","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-10 09:39:48.740963+00', ''),
	('00000000-0000-0000-0000-000000000000', '73ae01ef-1f47-4fed-a381-e94dca9082d9', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-10 09:41:09.429806+00', ''),
	('00000000-0000-0000-0000-000000000000', '33901cac-b34d-4dc6-acc0-3d3fc71e09f6', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-10 09:41:09.43332+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e04f97e0-caa1-45a4-9ac1-8581a55643fb', '{"action":"login","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-10 09:41:19.075648+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a128b6aa-7bce-4088-82c0-9bc98ce2efa2', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-10 09:41:21.239816+00', ''),
	('00000000-0000-0000-0000-000000000000', '2e5013b0-cfe5-4a02-95cb-84e30750562d', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-10 09:41:21.244139+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b799fee4-2ff1-421a-b9d9-50c4d16ac8b6', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-10 09:45:55.433933+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f95d09dd-a4e9-4e0a-97e3-b528b10f2f69', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-10 09:45:55.44066+00', ''),
	('00000000-0000-0000-0000-000000000000', '6b574b5b-1814-4abc-aa30-4ff0247715c8', '{"action":"token_refreshed","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-10 10:06:26.269487+00', ''),
	('00000000-0000-0000-0000-000000000000', '0aa93e7e-6677-4159-91ce-52ab13fb8a6c', '{"action":"token_revoked","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-10 10:06:26.281403+00', ''),
	('00000000-0000-0000-0000-000000000000', '2fa0e24b-1380-4171-9361-628bb2d16b6d', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-10 10:44:27.924578+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ade1a45f-e864-48d1-aef5-f99350e6c644', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-10 10:44:27.940767+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ece0f4ee-83d1-487b-bc0d-93204c0e5bb0', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-10 10:44:49.966081+00', ''),
	('00000000-0000-0000-0000-000000000000', '6d08bfbc-8ac8-40b3-9299-7eb9db995857', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-10 10:44:49.967123+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd711b82f-e25a-487c-8581-0f12820368d6', '{"action":"token_refreshed","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-10 10:46:25.260943+00', ''),
	('00000000-0000-0000-0000-000000000000', '72990d4d-ece1-4b07-853a-6918e5fedb2a', '{"action":"token_revoked","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-10 10:46:25.262429+00', ''),
	('00000000-0000-0000-0000-000000000000', '6d2b452a-9e71-4503-a6f9-934e4224226b', '{"action":"token_refreshed","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-10 10:46:54.200837+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b4cfe433-7a56-480b-b1eb-d77a4eb255d1', '{"action":"token_revoked","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-10 10:46:54.201906+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cff4f2fd-8c85-4923-8942-4518bbfc25e9', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-10 17:09:55.68873+00', ''),
	('00000000-0000-0000-0000-000000000000', '0e8a09d2-57b6-4d7f-97eb-f57c2cbe76a0', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-10 17:09:55.707406+00', ''),
	('00000000-0000-0000-0000-000000000000', '28ee9b45-3769-40f8-a3ca-8f55216459fc', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-10 17:20:40.266934+00', ''),
	('00000000-0000-0000-0000-000000000000', '6861efca-e250-43c2-b5eb-cdcf6e7e8046', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-10 17:20:40.274244+00', ''),
	('00000000-0000-0000-0000-000000000000', '2297541d-feef-4c2d-90b4-b10d08276974', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"testuser2025@outlook.com","user_id":"f2a9ef8e-c642-49e9-b34d-110d56848d2a","user_phone":""}}', '2025-10-10 17:22:54.57837+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c16d3f4f-a02c-4dc9-baa3-ed07220b5893', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"newdemo@restaurant.it","user_id":"a084ddce-110d-4aea-924d-044af4750c8e","user_phone":""}}', '2025-10-10 17:23:04.899628+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ab90a34f-9716-4844-bf86-1970acadce92', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"testanalysis@gmail.com","user_id":"01bdd8a4-23f8-4592-b34c-f385b4f91bef","user_phone":""}}', '2025-10-10 17:23:11.105287+00', ''),
	('00000000-0000-0000-0000-000000000000', '8e4ac56d-0b9c-4a43-8a26-a5e8946432a3', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-10 18:41:20.039626+00', ''),
	('00000000-0000-0000-0000-000000000000', '9a1af30d-6e9b-4c9a-b081-9de99c74ee59', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-10 18:41:20.06474+00', ''),
	('00000000-0000-0000-0000-000000000000', '29617185-7e71-4cc6-be5b-464fa67effdf', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-10 18:42:10.015367+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ba268565-c160-4657-8ce6-6727d20018e6', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-10 18:42:10.016751+00', ''),
	('00000000-0000-0000-0000-000000000000', '47a52cad-5e5d-4c8a-880a-8cdc559d584b', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-10 18:49:09.984974+00', ''),
	('00000000-0000-0000-0000-000000000000', '8fd41486-2724-4d33-aa70-5d6b713b75ed', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-10 18:49:09.986589+00', ''),
	('00000000-0000-0000-0000-000000000000', 'de626ba1-ac4d-4a4f-b22e-bcff759bf13a', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-10 19:58:48.681742+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ced18455-1365-4833-9b64-8c47e633f7e9', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-10 19:58:48.70441+00', ''),
	('00000000-0000-0000-0000-000000000000', '801fe7d8-27d9-40d6-aad0-7f264332909f', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-11 12:29:24.925266+00', ''),
	('00000000-0000-0000-0000-000000000000', '7cdbe326-c245-4783-bec2-93f4a2c8eaff', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-11 12:29:24.959572+00', ''),
	('00000000-0000-0000-0000-000000000000', '840cd049-a59c-4029-9c70-db17d2aeec6e', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-11 13:28:09.807074+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ea319387-ce65-42b8-b1dd-121d7e8efe15', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-11 13:28:09.83191+00', ''),
	('00000000-0000-0000-0000-000000000000', '0c5fff5a-85d8-4853-a73c-b108416d3e93', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-11 13:29:25.009402+00', ''),
	('00000000-0000-0000-0000-000000000000', '69fd8d9f-6341-4f9a-afca-c7761ae376c0', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-11 13:29:25.01284+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd6585aa4-9b1a-4eef-97b5-5c8734cdcb36', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-11 14:30:57.337896+00', ''),
	('00000000-0000-0000-0000-000000000000', '786fc4fc-3960-47d6-bb87-cbaec39685f3', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-11 14:30:57.359781+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b7b19265-3e3d-4d74-bb01-99e769fd2c77', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-12 15:08:56.127977+00', ''),
	('00000000-0000-0000-0000-000000000000', '6a3e35dd-5335-4490-bf88-eaf2d321ff2a', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-12 15:08:56.157945+00', ''),
	('00000000-0000-0000-0000-000000000000', '46ddb95b-e65b-4bd4-b970-3ac33794db26', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-12 15:09:56.596635+00', ''),
	('00000000-0000-0000-0000-000000000000', '03cf4c64-8301-4089-84f6-85d3ea874bb9', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-12 15:09:56.598054+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f6af14b5-308e-4764-be5f-3e2a368bffd6', '{"action":"token_refreshed","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-12 15:34:17.480326+00', ''),
	('00000000-0000-0000-0000-000000000000', '337553f9-7789-4a91-bcc4-3b5104da2073', '{"action":"token_revoked","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-12 15:34:17.489729+00', ''),
	('00000000-0000-0000-0000-000000000000', '417ec3df-aa29-48a8-b87c-56d55aa31c44', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-12 15:59:28.160296+00', ''),
	('00000000-0000-0000-0000-000000000000', '94be0986-1bc0-4dc8-ac5d-989b9fab8d12', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-12 16:07:04.784469+00', ''),
	('00000000-0000-0000-0000-000000000000', '31de4197-e38a-49ed-a4a2-dd1f9cde70bb', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-12 16:07:04.793849+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd308fc88-9a24-4508-b6f4-67f7f5919843', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-12 16:08:31.421648+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f87debf2-9edd-42fa-8908-4ed511c12c65', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-12 16:08:31.425495+00', ''),
	('00000000-0000-0000-0000-000000000000', 'edbedc7f-85d9-4b10-9660-467dcc72f04c', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-12 16:22:50.042852+00', ''),
	('00000000-0000-0000-0000-000000000000', 'efe38a61-8447-442f-be14-134373664014', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-12 16:22:50.061461+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd7c02bbd-13f8-4ce1-a269-1f3602c70de4', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-12 17:05:17.82142+00', ''),
	('00000000-0000-0000-0000-000000000000', '4a1a0d43-cb08-4181-81c7-cb9ffebe7b79', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-12 17:05:17.835109+00', ''),
	('00000000-0000-0000-0000-000000000000', '77fb6f30-2946-4595-a3ad-bea7040282f1', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-12 17:22:37.455684+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bac8ebde-7ed1-45c2-9bbe-026f1df672a3', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-12 17:22:37.461596+00', ''),
	('00000000-0000-0000-0000-000000000000', '0bc2e27a-30a7-4ca6-a3b7-570377b10c3f', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-12 18:05:06.90934+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd7af4646-1728-4c9a-87db-a77ea24a11d3', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-12 18:05:06.934715+00', ''),
	('00000000-0000-0000-0000-000000000000', '9753297f-c550-40bf-a3e3-08dbf86d3846', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-12 18:21:21.532835+00', ''),
	('00000000-0000-0000-0000-000000000000', '914c8744-b358-4e68-84b1-a0ee98509ed2', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-12 18:21:21.539588+00', ''),
	('00000000-0000-0000-0000-000000000000', '4eb7a0f8-2643-48e7-962a-2cf4657ab32b', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-12 18:52:03.900582+00', ''),
	('00000000-0000-0000-0000-000000000000', '9c394602-a88f-4f90-8aff-67a5a67555c1', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-12 18:52:03.910526+00', ''),
	('00000000-0000-0000-0000-000000000000', '3d7fb3dc-269b-4c20-acf3-b3bbc9e8db6b', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-12 18:54:52.848176+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e7f498f6-2f49-4601-b0a5-36a1419fae1e', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-12 18:54:52.85325+00', ''),
	('00000000-0000-0000-0000-000000000000', '147614ce-661f-4e9e-a1b0-efd1ae6885f2', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-12 19:08:59.428996+00', ''),
	('00000000-0000-0000-0000-000000000000', '7c88630a-bf0d-466f-8c63-81aee02d06a6', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-12 19:08:59.435458+00', ''),
	('00000000-0000-0000-0000-000000000000', '90cfb07d-15d6-453e-937c-25ac293e8792', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-12 19:27:58.993433+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e507f227-9b41-48f7-b7c7-2c2a573d9475', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-12 19:27:58.999323+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e161a800-1f90-49d2-8613-e018ad37ff82', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-12 19:56:05.16471+00', ''),
	('00000000-0000-0000-0000-000000000000', '9edea675-4c01-4280-9223-8a03d4a9d63c', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-12 19:56:05.186789+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e700e688-c9c3-4bc2-9202-e7ed7a0a7cbc', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-12 20:33:15.606415+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c9a59f47-b3dd-48d7-a0ed-e4dcedf89e6e', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-12 20:33:15.623782+00', ''),
	('00000000-0000-0000-0000-000000000000', '68e89b80-c198-41a3-b5aa-eda7f0efe86c', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-12 20:55:13.349872+00', ''),
	('00000000-0000-0000-0000-000000000000', '1b72a82c-804c-43c4-8f83-72c3cac4be06', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-12 20:55:13.366752+00', ''),
	('00000000-0000-0000-0000-000000000000', '7ae096d4-56f2-4597-9578-358f2524bb56', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-12 20:55:47.727551+00', ''),
	('00000000-0000-0000-0000-000000000000', '9dc92dc8-bfc8-4be5-b41f-05da55d01a3c', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-12 20:55:47.728546+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd8ba6fc7-8346-4cb5-a4ba-1c6bcd8da71c', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-12 21:18:56.979494+00', ''),
	('00000000-0000-0000-0000-000000000000', 'acae0410-4c32-486d-879a-f325b1f05b34', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-12 21:18:56.986789+00', ''),
	('00000000-0000-0000-0000-000000000000', '4b5e44c9-f55b-4491-9604-e133b57cd2f7', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-12 22:11:09.102919+00', ''),
	('00000000-0000-0000-0000-000000000000', '3da37bfc-e01e-4def-8edb-68f5a274052f', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-12 22:11:09.109512+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a083376f-24f8-4b5c-800f-efce8110dc0e', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-12 23:43:36.237037+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b6552d6a-d7b2-4147-9b61-913c7c7cd745', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-12 23:43:36.259541+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e32c2b59-23af-4d32-8de0-a8bd2d972899', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-12 23:45:57.257998+00', ''),
	('00000000-0000-0000-0000-000000000000', '6e034360-5b65-46c7-9a83-737e2160da13', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-12 23:45:57.259331+00', ''),
	('00000000-0000-0000-0000-000000000000', '82629790-375f-40cd-8634-f86d14c924b5', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-13 00:12:03.851424+00', ''),
	('00000000-0000-0000-0000-000000000000', '3b2e2e19-9b03-47a9-9d2a-dc7db4e5ed8b', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-13 00:12:03.861943+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e043421f-c4a0-4712-88fe-823150d28732', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-13 00:41:37.317863+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ad5a03de-d6c0-46f6-b0d1-32fb9bc5d122', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-13 00:41:37.332199+00', ''),
	('00000000-0000-0000-0000-000000000000', '48c3f3fb-ce29-4fe2-bc7e-f05c6e7153f9', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-13 00:45:33.974855+00', ''),
	('00000000-0000-0000-0000-000000000000', '2bd4c6dc-1551-406c-afd2-eb011a395246', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-13 00:45:33.981625+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ed73f56f-c98e-4d0b-9d82-010c14629e28', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-13 08:17:34.939791+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f56208f9-8da4-4fb4-8d57-aa3af380236f', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-13 08:17:34.967988+00', ''),
	('00000000-0000-0000-0000-000000000000', '0a272b83-76c3-4014-8dad-b956aefc8ed8', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-13 08:17:51.776473+00', ''),
	('00000000-0000-0000-0000-000000000000', '46fa1355-36af-482a-aaf5-2769920a0f11', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-13 08:17:51.777712+00', ''),
	('00000000-0000-0000-0000-000000000000', '0a208849-29a0-49c1-88ef-da61c34af1b8', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-13 08:21:32.619147+00', ''),
	('00000000-0000-0000-0000-000000000000', '8d0e6397-5895-4efd-9cd9-4a63d8295af8', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-13 08:21:32.624553+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fbf6b54c-4492-4a67-8838-6c3236cd2ef5', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-13 09:00:33.059733+00', ''),
	('00000000-0000-0000-0000-000000000000', '42f28a2a-8004-4291-be1b-2bc15b6d91e4', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-13 09:05:09.283188+00', ''),
	('00000000-0000-0000-0000-000000000000', '4184bcfc-a0c5-45a3-9769-a33a5ac967f4', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-13 09:06:46.538315+00', ''),
	('00000000-0000-0000-0000-000000000000', '3176c97c-9e35-4717-bfda-f2900438c6d4', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-13 09:06:46.541278+00', ''),
	('00000000-0000-0000-0000-000000000000', '78543b1c-ff7b-4425-b83d-41fd2fd9d749', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-13 09:07:42.553405+00', ''),
	('00000000-0000-0000-0000-000000000000', '5a93c28d-6ba8-4f41-91f6-eb9a4b0f31be', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-13 09:13:17.610015+00', ''),
	('00000000-0000-0000-0000-000000000000', '0ad2a80e-f341-461e-8bc0-3949363b5e19', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-13 09:19:54.318833+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a7b4beb3-b453-4165-8b06-f3b6e0fe9536', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-13 09:23:55.064443+00', ''),
	('00000000-0000-0000-0000-000000000000', '39823ee5-d278-42ad-b043-6888b3f6e4ab', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-13 09:36:49.414326+00', ''),
	('00000000-0000-0000-0000-000000000000', '427a871a-ba6e-46be-afa4-03d78b091b10', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-13 09:36:49.421507+00', ''),
	('00000000-0000-0000-0000-000000000000', '1c3ecb89-c266-43c7-95f2-803ad78e7fe7', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-13 16:04:37.389439+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e1606c13-9b95-424c-9b1c-441788749332', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-13 16:04:37.418969+00', ''),
	('00000000-0000-0000-0000-000000000000', '63f5aee6-d166-4aa5-a5a8-83f57d177289', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-13 16:04:58.240538+00', ''),
	('00000000-0000-0000-0000-000000000000', '9d466d35-45aa-4ebf-9b3a-574ddaa4b435', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-13 16:04:58.242074+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ce738cff-3827-46ae-adc5-0a145a6bc1c0', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-13 16:23:27.253614+00', ''),
	('00000000-0000-0000-0000-000000000000', '63a4d222-d73c-490b-8092-7b48401020a2', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-13 16:23:27.277944+00', ''),
	('00000000-0000-0000-0000-000000000000', 'eccb796f-56c0-43a5-9974-b9c04541a618', '{"action":"token_refreshed","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-13 16:36:03.740429+00', ''),
	('00000000-0000-0000-0000-000000000000', 'eeec6001-4805-4965-ba16-0d45a02809f0', '{"action":"token_revoked","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-13 16:36:03.750748+00', ''),
	('00000000-0000-0000-0000-000000000000', '509bd15d-e4fd-4ce3-8e95-b4c56e78ac95', '{"action":"token_refreshed","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-13 16:59:51.393472+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a7635d85-acc5-42fe-8840-8b72860d6c07', '{"action":"token_revoked","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-13 16:59:51.401361+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f60def81-dcf2-4024-afd5-b69968b7a088', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-13 17:02:43.171081+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b36b3e65-1173-491d-8ad0-d4402a77fc7a', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-13 17:02:43.173879+00', ''),
	('00000000-0000-0000-0000-000000000000', '75764aab-3d99-45d8-8c0c-36338230c5e2', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-13 17:28:21.809753+00', ''),
	('00000000-0000-0000-0000-000000000000', '9f9e3b85-19d2-48d3-8c05-37e2b23e30ca', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-13 17:28:21.815197+00', ''),
	('00000000-0000-0000-0000-000000000000', '161991a8-8bc9-442e-97c6-2c91d6c07668', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-13 18:01:28.042981+00', ''),
	('00000000-0000-0000-0000-000000000000', '3f57dd48-5c1c-490c-a544-fa2f57d2e1b5', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-13 18:01:28.057667+00', ''),
	('00000000-0000-0000-0000-000000000000', '20839b29-2c56-4646-8dde-642efe10ec0d', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-13 18:27:13.097668+00', ''),
	('00000000-0000-0000-0000-000000000000', '3a12c1d8-6ce3-47af-a0ad-c6fe3547b300', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-13 18:27:13.11982+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c83bf306-4dd6-4e40-bcd5-205ab084a5d8', '{"action":"user_confirmation_requested","actor_id":"b0dfdcee-ff52-4efd-9ed5-6452f98945fe","actor_username":"pinatolaura@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-10-13 18:28:06.826757+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ed256902-0a13-4ce5-891c-ed51da494469', '{"action":"user_signedup","actor_id":"b0dfdcee-ff52-4efd-9ed5-6452f98945fe","actor_username":"pinatolaura@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}', '2025-10-13 18:28:52.378932+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ed23b817-8947-495b-ab22-d171bb048103', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-13 18:29:11.496982+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ff89cabd-4799-450f-bdd1-c8abd22e41a3', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-13 18:29:11.497689+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b43af2ec-5ef9-4813-a3c3-83c92cf1eabb', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-13 18:30:27.279282+00', ''),
	('00000000-0000-0000-0000-000000000000', '2ac530f5-a2db-469f-a84e-ef946921f3c3', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-13 18:31:01.429779+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a3d094ed-be95-4d13-b4eb-c69831fb2f87', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-13 18:31:01.430863+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e36abf1d-b1bf-430c-be1f-19af7d630582', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-13 21:33:38.241177+00', ''),
	('00000000-0000-0000-0000-000000000000', '3dea5670-2c15-45e5-95dd-f065aa5e51e3', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-13 21:33:38.255951+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a47aabf7-a09e-4e83-ba79-a92e2f01d83e', '{"action":"token_refreshed","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-14 08:48:53.260281+00', ''),
	('00000000-0000-0000-0000-000000000000', '1d7406f0-efb7-4719-960d-e3a59f2652bc', '{"action":"token_revoked","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-14 08:48:53.283659+00', ''),
	('00000000-0000-0000-0000-000000000000', '0278107b-2530-400f-9086-6f15e177cb95', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-14 08:56:10.271214+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f949c6d7-b40c-427d-b547-fdff60908c59', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-14 08:56:10.275751+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b9336358-c216-4989-b212-e15a03404b2b', '{"action":"token_refreshed","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-14 09:48:09.254547+00', ''),
	('00000000-0000-0000-0000-000000000000', '06d441c7-c737-41a9-a357-69bfb2235900', '{"action":"token_revoked","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-14 09:48:09.2754+00', ''),
	('00000000-0000-0000-0000-000000000000', '48f09b92-b174-4de0-8d62-4f451382a28a', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-14 10:44:24.819154+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b8ce0029-b8db-49ba-b997-c4b6ca2f7692', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-14 10:44:24.833086+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ff0a8812-6e39-46d2-b38d-434e578f7a4e', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-14 10:51:26.381835+00', ''),
	('00000000-0000-0000-0000-000000000000', '408cf8cd-a539-40ca-a0fa-09211928c553', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-14 10:51:26.38398+00', ''),
	('00000000-0000-0000-0000-000000000000', '8bd4bc9f-0d2a-4750-8854-2d722a3b2f10', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 10:59:58.255397+00', ''),
	('00000000-0000-0000-0000-000000000000', '8e289169-3e8b-43d5-a816-57bccad083c4', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 11:03:07.308479+00', ''),
	('00000000-0000-0000-0000-000000000000', '04c32de8-11ff-4593-a09f-d525f94f7d83', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 11:04:16.656497+00', ''),
	('00000000-0000-0000-0000-000000000000', '0e0908cb-8c34-4365-9355-5f5917795644', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 11:06:12.285508+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c8c53d5a-d3dd-4844-9f80-ce6070b80cb6', '{"action":"token_refreshed","actor_id":"b0dfdcee-ff52-4efd-9ed5-6452f98945fe","actor_username":"pinatolaura@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-10-14 11:32:47.828345+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b1682512-4a1c-4bfd-a10f-09239fcddff3', '{"action":"token_revoked","actor_id":"b0dfdcee-ff52-4efd-9ed5-6452f98945fe","actor_username":"pinatolaura@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-10-14 11:32:47.832518+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cda68624-1a4a-41a1-bd0e-7e14e7c9cfeb', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 12:29:11.964+00', ''),
	('00000000-0000-0000-0000-000000000000', '1fff2390-34f7-4661-ba94-b71c035b33d8', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 12:29:50.987305+00', ''),
	('00000000-0000-0000-0000-000000000000', '2ec4c25e-76eb-4de5-9ccb-c553525fc469', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 12:30:07.257092+00', ''),
	('00000000-0000-0000-0000-000000000000', '70461663-7ef1-487f-a0b1-a3f92ad5d43a', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 12:30:45.219912+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b8e2059f-895c-4a35-82aa-41a8ba75213c', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 12:31:27.927263+00', ''),
	('00000000-0000-0000-0000-000000000000', '9494547a-0eef-4c3a-a574-f69cec4ff389', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 12:31:35.471624+00', ''),
	('00000000-0000-0000-0000-000000000000', '9dfcd94f-240c-4b00-bfe6-a912bf48fb4e', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 12:39:04.084697+00', ''),
	('00000000-0000-0000-0000-000000000000', '1c5a0fd2-24b7-467f-abaa-e63e9d97a8e6', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 12:39:14.313599+00', ''),
	('00000000-0000-0000-0000-000000000000', '0b0ca2f0-ebb9-4cae-b91f-3467fcbff88c', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-14 12:41:23.155117+00', ''),
	('00000000-0000-0000-0000-000000000000', '76a6d3a4-9cfb-4f74-9464-d2ee324711dd', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-14 12:41:23.156522+00', ''),
	('00000000-0000-0000-0000-000000000000', '600b61e8-700d-4a4e-bb49-4577ecb3bb0b', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 12:51:53.055319+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd1cec21c-5124-49c0-a3f8-2c3d5ea8506e', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 12:56:35.075377+00', ''),
	('00000000-0000-0000-0000-000000000000', 'add1cce0-53fb-431f-b43f-7214761017e3', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 13:00:52.681704+00', ''),
	('00000000-0000-0000-0000-000000000000', '7d00bd4c-2b0c-40d9-b1f2-151cc762d5eb', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 13:04:25.461011+00', ''),
	('00000000-0000-0000-0000-000000000000', '975fb3e3-84c8-4d47-873e-b546b344c38e', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 13:09:42.523706+00', ''),
	('00000000-0000-0000-0000-000000000000', '5e9863f8-5473-4a8b-a681-1dd7d357eb05', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 13:28:48.391904+00', ''),
	('00000000-0000-0000-0000-000000000000', '2820f314-7fd4-45dd-8e42-5fa4bd299f8d', '{"action":"token_refreshed","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-14 13:31:48.53154+00', ''),
	('00000000-0000-0000-0000-000000000000', '0d31c094-5bca-4944-9f4d-0adf1e27a389', '{"action":"token_revoked","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-14 13:31:48.537107+00', ''),
	('00000000-0000-0000-0000-000000000000', '3da8a53f-863e-4978-830c-e44f2761cac5', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 13:33:54.54648+00', ''),
	('00000000-0000-0000-0000-000000000000', '03977d78-a968-4c12-ba53-fdf356c565ed', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 13:36:56.632784+00', ''),
	('00000000-0000-0000-0000-000000000000', '4ac01bf6-2f16-4c5f-84e8-8c081e755eaa', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 13:40:38.165317+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c9da6d37-cab6-443c-9c14-d07269bcbeda', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 13:59:31.699607+00', ''),
	('00000000-0000-0000-0000-000000000000', '98270dc0-8ee8-41e1-8e9b-9bcfae9ee0f6', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-14 14:20:23.629514+00', ''),
	('00000000-0000-0000-0000-000000000000', '73fe654c-1997-49fd-b194-07c5f15b23b7', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-14 14:20:23.640904+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ad107c3f-3be1-4f51-83c9-5a45894ce564', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-14 14:20:44.586298+00', ''),
	('00000000-0000-0000-0000-000000000000', '30fc5653-5312-4e4a-8fc8-e3e1d4d5029c', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-14 14:20:44.588216+00', ''),
	('00000000-0000-0000-0000-000000000000', '4cc8009c-ff80-42dd-904e-2cd3071b1067', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 14:44:36.406447+00', ''),
	('00000000-0000-0000-0000-000000000000', 'de8c647a-4e9f-4cc8-89ac-0474b5394d11', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-14 14:55:29.295146+00', ''),
	('00000000-0000-0000-0000-000000000000', '09edbff8-f010-42d9-898e-ce37d5ac7505', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-14 14:55:29.317673+00', ''),
	('00000000-0000-0000-0000-000000000000', '1728bdb1-e852-4239-841d-f7ce00886c9a', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 15:53:30.335647+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bd9aafea-441d-4ac4-b9bb-22b7c3daf9fa', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-14 15:54:17.582697+00', ''),
	('00000000-0000-0000-0000-000000000000', '91637960-fba4-40df-a0b9-c9fb93830cd3', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-14 15:54:17.584295+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f25beb06-2423-40b4-b6d4-44434435f1ab', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 16:17:54.836262+00', ''),
	('00000000-0000-0000-0000-000000000000', '4e6bdb10-2fe3-4de2-98c9-2b56af890891', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-14 16:26:00.740083+00', ''),
	('00000000-0000-0000-0000-000000000000', '58e6bad1-2b14-464a-97ad-3b1b22e50a4b', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-14 16:26:00.754336+00', ''),
	('00000000-0000-0000-0000-000000000000', '3cc6d4ef-3d9e-4339-8db8-649e4e1abdef', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-14 16:26:07.087549+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd9a39cce-467d-4e1f-a71f-e17ad88f743c', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-14 16:26:07.094102+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f67cc098-4af5-4f1a-922f-e9edd56c0047', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 16:27:42.422061+00', ''),
	('00000000-0000-0000-0000-000000000000', '37305968-fe85-4076-9854-09e11534a655', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 16:36:04.361367+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b543551f-27a4-46d5-a7db-8182b2ebe1fe', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 16:54:53.4074+00', ''),
	('00000000-0000-0000-0000-000000000000', 'da5be0c8-2e57-4d22-8bbd-6836782d5131', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 17:13:06.035079+00', ''),
	('00000000-0000-0000-0000-000000000000', '2e8ae91b-e7c5-40dd-97c4-4b346a4c2c85', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 17:17:37.376468+00', ''),
	('00000000-0000-0000-0000-000000000000', '0de0479a-ca76-474e-b0c2-edf4d4ef4895', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 17:31:20.469857+00', ''),
	('00000000-0000-0000-0000-000000000000', '1f70248f-f02e-4294-9455-b78b78896e0b', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 17:33:21.316926+00', ''),
	('00000000-0000-0000-0000-000000000000', '2f4de7a8-bbe2-4fa3-bfe9-964bc2b1bb54', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 17:34:41.462952+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f8333101-505b-4729-84c7-a9897a6ce958', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 17:39:55.309293+00', ''),
	('00000000-0000-0000-0000-000000000000', '4138eb5f-41e3-411c-8841-b7c038254f95', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 17:44:54.085276+00', ''),
	('00000000-0000-0000-0000-000000000000', '11f6c574-0b6c-4f59-a6d6-b250c0ba6200', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 17:49:23.06333+00', ''),
	('00000000-0000-0000-0000-000000000000', '842b4c20-ea65-4f84-aec5-3bb388e1693b', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 18:20:20.756725+00', ''),
	('00000000-0000-0000-0000-000000000000', '07c76a7b-1583-4f5f-a2f6-a743bc8300a3', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 18:22:37.538608+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e99ad7d0-be69-4d65-a352-5a17363fdf6f', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 18:27:40.571206+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ad7a31b2-9789-4890-95ae-3e1df1d65f52', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 18:33:54.16947+00', ''),
	('00000000-0000-0000-0000-000000000000', '932eed8a-87bd-4c72-8f61-581b122e3780', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 18:39:46.891093+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd310e255-570c-4ef5-8459-acebbda6c328', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 18:51:18.287473+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd25f5639-ea70-400b-8baa-0f84b6271035', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-14 19:44:58.144035+00', ''),
	('00000000-0000-0000-0000-000000000000', '09d44c72-237e-4cea-ab93-a2acb3db96ca', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-14 19:44:58.16703+00', ''),
	('00000000-0000-0000-0000-000000000000', 'affc725b-dcb4-425f-ab2e-470fa4f91a40', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 19:46:14.546026+00', ''),
	('00000000-0000-0000-0000-000000000000', '73f5c54f-1bfc-4265-b8ef-673fe70bfffa', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 19:46:23.086529+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fad4171d-b615-4749-955f-a9f762a36811', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-14 19:49:39.044181+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd7d0ed12-00da-496b-80b2-685bb4550d16', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-14 19:49:39.047228+00', ''),
	('00000000-0000-0000-0000-000000000000', '3c2a2a22-e406-4745-a8c1-a8b286308d60', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 19:50:16.362737+00', ''),
	('00000000-0000-0000-0000-000000000000', '9ab413e4-e802-4f58-9ab7-ab564188f95f', '{"action":"token_refreshed","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-14 19:50:59.830172+00', ''),
	('00000000-0000-0000-0000-000000000000', '9135ef5a-11ac-4465-8090-3cdbf586dda9', '{"action":"token_revoked","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-14 19:50:59.831851+00', ''),
	('00000000-0000-0000-0000-000000000000', '65d81500-fdca-4370-b318-e164fad0a74d', '{"action":"login","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 19:53:22.556607+00', ''),
	('00000000-0000-0000-0000-000000000000', '53baee37-fdf8-4d53-94f6-1460906b0ba5', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-14 20:48:28.452217+00', ''),
	('00000000-0000-0000-0000-000000000000', '99b2784e-f8d2-49e1-8312-2d8b2587eff9', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-14 20:48:28.46542+00', ''),
	('00000000-0000-0000-0000-000000000000', '20aa89d0-715a-4ba2-925c-0e7690779ede', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-14 20:49:15.534523+00', ''),
	('00000000-0000-0000-0000-000000000000', '46a5e7ce-cc31-4a8e-bceb-7fad42b8d752', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-14 20:49:15.540035+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a278f969-1ca0-427c-a417-caa61bf23708', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 21:23:03.4811+00', ''),
	('00000000-0000-0000-0000-000000000000', '09d9a93b-7835-4251-b908-a32da14da99c', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 21:31:48.799277+00', ''),
	('00000000-0000-0000-0000-000000000000', '2e59f6ec-77ae-4490-a3dc-bc933907f07b', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-14 21:36:44.53138+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f4f00243-8299-4e47-8963-519e73135dff', '{"action":"token_refreshed","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-14 22:05:34.588927+00', ''),
	('00000000-0000-0000-0000-000000000000', '46861161-d675-4661-bf90-c22e724d305b', '{"action":"token_revoked","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-14 22:05:34.60288+00', ''),
	('00000000-0000-0000-0000-000000000000', '396c5591-202e-4995-93df-9ea4c33f07f6', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-15 00:37:15.237926+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f654115c-0bb5-490e-bb27-51171fe33770', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-15 00:37:15.262492+00', ''),
	('00000000-0000-0000-0000-000000000000', '05e6a21e-36a3-4401-a6f8-1898b23eeb23', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-15 01:30:07.752276+00', ''),
	('00000000-0000-0000-0000-000000000000', '862d8009-815f-4c3b-b98a-7fe8771debf3', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-15 01:47:33.795357+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b91aecf0-9489-4d67-bcf1-fe10214f23f4', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-15 09:57:13.414089+00', ''),
	('00000000-0000-0000-0000-000000000000', '13f96911-66e4-43dc-8239-31de77bf13d9', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-15 09:57:13.440267+00', ''),
	('00000000-0000-0000-0000-000000000000', '1ab2b7db-4b27-45e8-b471-aa292916d69d', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-15 10:08:57.300071+00', ''),
	('00000000-0000-0000-0000-000000000000', 'db034ea0-104d-4297-97b0-feee95202370', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-15 10:14:02.018626+00', ''),
	('00000000-0000-0000-0000-000000000000', '5434acc9-21aa-4270-aa25-e776fe087d0a', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-15 10:19:45.042237+00', ''),
	('00000000-0000-0000-0000-000000000000', '66c82262-e341-48ad-a6a8-151c4607b5f0', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-15 10:50:29.162306+00', ''),
	('00000000-0000-0000-0000-000000000000', '34ac95c0-0ee0-4b1c-8cd3-802a33d9a948', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-15 10:50:29.177546+00', ''),
	('00000000-0000-0000-0000-000000000000', '6b4ba5dd-2a7b-4871-993a-07de986759e9', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-15 10:52:01.949455+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b36ead57-554c-4f1c-99fa-68b697ccb4db', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-15 11:53:03.627182+00', ''),
	('00000000-0000-0000-0000-000000000000', '7f558910-8809-4e6a-a1f6-39f8ea99273d', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-15 11:53:03.643547+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cddf5d9a-6b77-4bbc-9bb3-4ecf2c4c5faa', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-15 11:53:12.41878+00', ''),
	('00000000-0000-0000-0000-000000000000', '8329d2ef-b492-45f0-9bec-1af3c2d47dd3', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-15 11:53:12.419721+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b86c0294-060e-48ae-9ef9-700e5a31d9ff', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-15 14:20:10.627052+00', ''),
	('00000000-0000-0000-0000-000000000000', '00129766-92dc-4d9c-8b09-d72af9a8f323', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-15 14:20:10.641366+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ea7b92da-4240-4d62-a867-b3c463315550', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-15 14:21:12.736373+00', ''),
	('00000000-0000-0000-0000-000000000000', '6d537e80-ee41-4e72-b6d2-78887bb9e165', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-15 14:23:57.64296+00', ''),
	('00000000-0000-0000-0000-000000000000', '6de089c1-05ff-41af-a466-312908a0e7f9', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-15 14:23:57.645708+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e666f327-1ccf-41e4-b526-9e6b55556e1d', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-15 14:24:35.087725+00', ''),
	('00000000-0000-0000-0000-000000000000', '03b266d9-ebf4-4d6f-904e-cad0cbc1ddcc', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-15 14:28:46.021442+00', ''),
	('00000000-0000-0000-0000-000000000000', '514dfa8e-d958-4792-89cd-ebb8acbb01a8', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-15 14:52:03.560977+00', ''),
	('00000000-0000-0000-0000-000000000000', '1c2bcc9d-cf78-4883-9356-b195ce257806', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-15 14:53:59.0637+00', ''),
	('00000000-0000-0000-0000-000000000000', '91c57b3e-c8f4-486f-9947-59a8f244d048', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-15 16:04:00.32874+00', ''),
	('00000000-0000-0000-0000-000000000000', '164ae5e6-6ec2-4465-aff5-9447e8582374', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-15 16:04:00.355285+00', ''),
	('00000000-0000-0000-0000-000000000000', '5c0faa23-9526-4f68-b9a5-e93cd690b28d', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-15 16:46:12.873863+00', ''),
	('00000000-0000-0000-0000-000000000000', '0bf6cb5f-90b5-4eeb-8cca-286731f39e31', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-15 16:46:12.89074+00', ''),
	('00000000-0000-0000-0000-000000000000', '27cc5ada-5143-4659-a95d-54b696e13bf9', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-15 16:46:31.849633+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f6ee284b-3508-49f0-804f-d66d840605d8', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-15 18:07:05.111763+00', ''),
	('00000000-0000-0000-0000-000000000000', '21013e94-8f75-41cd-97f4-c7d48da28310', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-15 18:07:05.133053+00', ''),
	('00000000-0000-0000-0000-000000000000', '385ecbad-e813-411d-ae93-651e62d89cc6', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-15 20:11:40.817392+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd71f88b1-84fc-4bef-a553-93a43d034853', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-15 20:11:40.831677+00', ''),
	('00000000-0000-0000-0000-000000000000', '4e6a6d2a-f536-460c-8bd4-436f0a429ed9', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-15 22:21:31.723366+00', ''),
	('00000000-0000-0000-0000-000000000000', '459b0090-2ddc-40c4-bfd0-b7b1635c32c7', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-15 22:21:31.738699+00', ''),
	('00000000-0000-0000-0000-000000000000', '3cc0720e-7859-4757-aebe-958d93bd483a', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-15 22:24:57.481005+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a7a8fd6f-8883-485e-b836-4c1f2c70461e', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-15 22:24:57.492177+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b348e4dd-a382-424f-b5d3-b1cba9ca4347', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-15 22:31:37.65785+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c7108425-5c67-498b-81e2-cdaae1e0935d', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-15 22:31:37.658865+00', ''),
	('00000000-0000-0000-0000-000000000000', '5d568595-8827-401f-8dda-dab782b1984e', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-15 23:17:20.455048+00', ''),
	('00000000-0000-0000-0000-000000000000', '864d93d0-3bd1-4301-a89c-d662caa7c53f', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-15 23:25:51.328237+00', ''),
	('00000000-0000-0000-0000-000000000000', '08b552c1-8fd4-40dd-ba0d-02b4507a73f6', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-15 23:25:51.338908+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c97a7560-c7ba-4a1f-a153-1dd1b1ffc2d9', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-16 00:08:08.436332+00', ''),
	('00000000-0000-0000-0000-000000000000', '1925b36d-5833-402f-8dfb-d290941a7dbd', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 00:30:09.95907+00', ''),
	('00000000-0000-0000-0000-000000000000', '038dae86-2d3e-4d80-938d-f0702aaf1dd1', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 00:30:09.977164+00', ''),
	('00000000-0000-0000-0000-000000000000', '52f12dcd-a1ba-4d6c-8c88-6bba6fa76aea', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 00:30:10.298076+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fcbe581e-dcd3-443b-bcc9-0c4175e0b847', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 00:31:58.96646+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f5006ec3-07a1-44f2-9f7d-106afe2f800e', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 00:31:58.970055+00', ''),
	('00000000-0000-0000-0000-000000000000', '1ff93ef4-b90c-45b3-bbbd-ba0f346e5d54', '{"action":"token_refreshed","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 08:47:53.612524+00', ''),
	('00000000-0000-0000-0000-000000000000', '33ee4c37-fb1d-43d9-968c-cf4907a476f7', '{"action":"token_revoked","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 08:47:53.640698+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b314890c-cf8e-4f3e-aae2-34f41c347eb6', '{"action":"token_refreshed","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 10:02:13.673305+00', ''),
	('00000000-0000-0000-0000-000000000000', '6692bddf-c373-41e1-ab8f-a0fa01e9c358', '{"action":"token_revoked","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 10:02:13.687944+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c1126ebe-47fe-4471-a642-8cfb737998bb', '{"action":"login","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-16 10:03:00.023318+00', ''),
	('00000000-0000-0000-0000-000000000000', '8f37bdb4-b8c2-41b2-8753-486862c417c9', '{"action":"token_refreshed","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 10:04:36.212467+00', ''),
	('00000000-0000-0000-0000-000000000000', '48902c22-d203-48e8-849b-ec60a8125234', '{"action":"token_revoked","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 10:04:36.213454+00', ''),
	('00000000-0000-0000-0000-000000000000', 'de4cf85d-57be-437e-afdf-006e719fbc3f', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 10:09:31.820738+00', ''),
	('00000000-0000-0000-0000-000000000000', '40ca2a1a-01ea-45af-9615-87ac3e404b3f', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 10:09:31.826704+00', ''),
	('00000000-0000-0000-0000-000000000000', '1969e33d-6fed-44fd-9317-592cc35a2bf6', '{"action":"login","actor_id":"b0dfdcee-ff52-4efd-9ed5-6452f98945fe","actor_username":"pinatolaura@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-16 10:09:32.48386+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e408a8d4-817c-4124-8f1b-ab994e020696', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 10:55:31.826718+00', ''),
	('00000000-0000-0000-0000-000000000000', '03774012-3249-42d8-9e08-f20f1d0a72d8', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 10:55:31.848553+00', ''),
	('00000000-0000-0000-0000-000000000000', 'df26d241-6002-4244-8f25-fa7f456a6b43', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 11:17:39.272245+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b375fa93-d211-48c0-a21a-089e08eda2f9', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 11:17:39.283403+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ee3f6d12-8db0-43eb-bdd7-a07d1fdd963b', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 11:24:02.293919+00', ''),
	('00000000-0000-0000-0000-000000000000', '04369c4c-9d06-42d3-81b6-022101688746', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 11:24:02.304954+00', ''),
	('00000000-0000-0000-0000-000000000000', '66fb01f8-c941-4168-adeb-a1fceb7f9d8c', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 11:24:02.688388+00', ''),
	('00000000-0000-0000-0000-000000000000', '3f08733d-a0eb-45a9-a343-61da30bbac63', '{"action":"token_refreshed","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 11:25:35.701026+00', ''),
	('00000000-0000-0000-0000-000000000000', '1d95b52a-0830-4dc5-b71b-50c3a7819ccb', '{"action":"token_revoked","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 11:25:35.701973+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e2a2535a-64a2-4f0d-9207-d037d5d42695', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 12:22:22.28059+00', ''),
	('00000000-0000-0000-0000-000000000000', '212fe6c1-d24e-4d59-ab91-54c58673ed6f', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 12:22:22.301965+00', ''),
	('00000000-0000-0000-0000-000000000000', '6b50703f-dfa5-4272-89dd-a972432d82b0', '{"action":"token_refreshed","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 12:25:39.02722+00', ''),
	('00000000-0000-0000-0000-000000000000', '12aaff3a-20a2-4f3e-9ed5-3b6c9ac5ee53', '{"action":"token_revoked","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 12:25:39.030578+00', ''),
	('00000000-0000-0000-0000-000000000000', '3c262081-ec6c-4399-9ad5-9f78479009c6', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 12:26:53.622291+00', ''),
	('00000000-0000-0000-0000-000000000000', '171bcd15-34b8-48e3-bad6-929fc26fad0b', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 12:26:53.623785+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cec79fdb-2a15-48f9-80f4-f869050ca20c', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 12:27:48.3965+00', ''),
	('00000000-0000-0000-0000-000000000000', '6478bfe5-687b-4336-8098-6f6000fdfa74', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 12:27:48.398824+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c1244026-d852-49ef-b7e6-627f8a34c1a6', '{"action":"token_refreshed","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 12:30:10.774027+00', ''),
	('00000000-0000-0000-0000-000000000000', '8a459fce-08bd-4a9e-8e17-4439d0ae6621', '{"action":"token_revoked","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 12:30:10.77646+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a2f85624-22d9-4e50-85cf-28aa399329f1', '{"action":"logout","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"account"}', '2025-10-16 12:30:16.955211+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c07b3d1c-7ca1-4bc4-8bd6-3917708fd21c', '{"action":"login","actor_id":"7c263c3e-11b2-468e-a74d-98910c429842","actor_username":"aledip06@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-16 12:30:24.820178+00', ''),
	('00000000-0000-0000-0000-000000000000', '40791a40-532f-4574-8dd2-747b3c5c9465', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-16 12:33:00.11279+00', ''),
	('00000000-0000-0000-0000-000000000000', '00f28863-5d4b-486b-b2e7-ad3f0bf0b7de', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 13:54:34.054345+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e13e3325-cae3-4199-89c1-2d6dad736fa0', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 13:54:34.070442+00', ''),
	('00000000-0000-0000-0000-000000000000', '3110ff8a-0fec-42a7-aba8-919c108c79a8', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 13:54:34.504944+00', ''),
	('00000000-0000-0000-0000-000000000000', 'aeeb9989-19aa-47ff-bde9-254fca9c75ce', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 14:50:39.393915+00', ''),
	('00000000-0000-0000-0000-000000000000', '9baf6636-a3fb-44a1-b406-aa6e9a3fdab9', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 14:50:39.406005+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b2a87255-63f6-42c4-ade2-56616c09b4ec', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 15:01:30.760241+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ccd091b0-69e6-4a31-87e7-c6ca6787a55a', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 15:01:30.771395+00', ''),
	('00000000-0000-0000-0000-000000000000', '2e4b4803-a1fa-43ec-9b18-9ae216d7345e', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 15:21:15.459379+00', ''),
	('00000000-0000-0000-0000-000000000000', '932dd58a-a2fe-49b0-8dcf-9adb8cad4bae', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 15:21:15.477085+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a34e9f04-be50-44df-b5d7-c9a27fe968cf', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 16:00:36.922721+00', ''),
	('00000000-0000-0000-0000-000000000000', '769ebab3-4e59-4ee3-8b52-9fce8682eb4e', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 16:00:36.937511+00', ''),
	('00000000-0000-0000-0000-000000000000', '59cfc198-dd1e-40b9-a3ec-c092970d5cc1', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 18:11:27.755991+00', ''),
	('00000000-0000-0000-0000-000000000000', 'db1ff121-fd7b-4468-b9f4-217bbba4dfd1', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 18:11:27.777114+00', ''),
	('00000000-0000-0000-0000-000000000000', '42413613-6358-4494-ab7d-40f4f8b6769e', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 20:35:59.47395+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a3dfa850-ecad-4555-80d3-d6a1651ac23e', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 20:35:59.490032+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd998c1d9-b139-48c6-be3c-c2e8691c844e', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 21:05:22.016235+00', ''),
	('00000000-0000-0000-0000-000000000000', 'af56b526-797c-433e-b3f2-743edc05c908', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 21:05:22.032692+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e9a3f362-9516-4891-b393-d7ae9bb7e8b0', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 22:50:50.505255+00', ''),
	('00000000-0000-0000-0000-000000000000', '51c75b1c-fe25-423f-905b-ed2b0ada9b01', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 22:50:50.529621+00', ''),
	('00000000-0000-0000-0000-000000000000', '4912dd1e-51fa-4391-ac03-29aecf181a7d', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-18 17:34:51.218664+00', ''),
	('00000000-0000-0000-0000-000000000000', 'acdfa891-bc44-4fbd-ae0a-bb05290030b3', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 22:59:25.156417+00', ''),
	('00000000-0000-0000-0000-000000000000', 'aceb3003-0b06-4cd6-967d-b0a69e6cf049', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-16 22:59:25.159864+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a71b80bb-8d85-4a5c-8fab-44c4f3da65bd', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-17 08:48:58.442462+00', ''),
	('00000000-0000-0000-0000-000000000000', '4957baf4-bb74-4a80-8e0f-8d31c380f377', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-17 08:48:58.474177+00', ''),
	('00000000-0000-0000-0000-000000000000', '0219309c-307e-4a44-997d-7e62ddd56947', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-17 11:32:24.254963+00', ''),
	('00000000-0000-0000-0000-000000000000', '2af1cddf-42d3-442b-9674-9d30c2e69e14', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-17 11:32:24.28399+00', ''),
	('00000000-0000-0000-0000-000000000000', '486098ec-2386-4f14-ae54-0ed1db33e405', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-17 13:26:22.983403+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e410fe4f-4b2d-44ac-9b42-ebfc4a8c4e1c', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-17 13:26:23.00594+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd2bd7644-077b-4698-ac5b-a255ec0df439', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-17 17:21:53.377642+00', ''),
	('00000000-0000-0000-0000-000000000000', '5212b7b2-e693-4cb1-9586-a7f95759cf15', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-17 18:20:11.067951+00', ''),
	('00000000-0000-0000-0000-000000000000', '121e2828-7083-421f-9606-ebdd1330d3e4', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-17 18:20:11.088103+00', ''),
	('00000000-0000-0000-0000-000000000000', '5b4779cf-c99b-44f5-aab0-e12738daf929', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-17 19:19:33.251788+00', ''),
	('00000000-0000-0000-0000-000000000000', '03b5d47e-bb6c-4fbd-a127-bf108d682a6c', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-17 19:19:33.265145+00', ''),
	('00000000-0000-0000-0000-000000000000', '8723bffd-ff88-4937-bde1-6952fc401ddd', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-17 20:18:25.621032+00', ''),
	('00000000-0000-0000-0000-000000000000', '4607f8ee-8b3c-4195-918f-88d7a0d9d8a0', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-17 20:18:25.634966+00', ''),
	('00000000-0000-0000-0000-000000000000', '32c9f6a9-b950-4f27-9720-dab607421c7b', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-17 21:17:05.607631+00', ''),
	('00000000-0000-0000-0000-000000000000', '422927e5-8514-4df9-b305-c2e75cd57f7a', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-17 21:17:05.626178+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b6c07d5c-abaa-4461-813e-e54a8a7a2c44', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-17 23:13:30.015168+00', ''),
	('00000000-0000-0000-0000-000000000000', '69556995-e4a5-404d-9908-c468244438f4', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-17 23:13:30.03772+00', ''),
	('00000000-0000-0000-0000-000000000000', '3f8bd1f8-b6fe-43ed-89c6-0693d7396991', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-18 00:48:40.965285+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e00ada0c-a445-4e11-87e9-f76b7ac39d99', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-18 00:48:40.988671+00', ''),
	('00000000-0000-0000-0000-000000000000', '8b59ab5b-5754-4f90-a069-c988d562392c', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-18 00:49:35.362009+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c9678c77-7fb6-4650-8882-aaee90ab2b30', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-18 00:49:35.362963+00', ''),
	('00000000-0000-0000-0000-000000000000', '65ac4d86-2711-4a75-82a6-33d58a0f6914', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-18 13:09:40.198052+00', ''),
	('00000000-0000-0000-0000-000000000000', '4aef2b61-4537-4d74-96c3-2fd1e01fe7c5', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-18 13:09:40.230312+00', ''),
	('00000000-0000-0000-0000-000000000000', '735e18d7-ba1c-46a7-8a94-1c1c2c7240bc', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-18 14:14:38.187275+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c7a3e6ee-df1a-45f8-8ff0-4c7cd1ff9e79', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-18 14:14:38.211658+00', ''),
	('00000000-0000-0000-0000-000000000000', '2d6cb689-cd7e-48ef-aecc-48492d132ff7', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-18 15:43:45.08047+00', ''),
	('00000000-0000-0000-0000-000000000000', '50a9382d-ec10-4f98-aa8b-e696025a9700', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-18 15:43:45.096665+00', ''),
	('00000000-0000-0000-0000-000000000000', '3f382a76-fa35-46cd-95fb-03f66a50a069', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-18 16:44:17.784971+00', ''),
	('00000000-0000-0000-0000-000000000000', '57d0dcaa-3f2c-45fb-8927-510398cf7094', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-18 16:44:17.795202+00', ''),
	('00000000-0000-0000-0000-000000000000', '879658d9-3016-4f28-b884-21baa3e06b19', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-18 17:07:14.004676+00', ''),
	('00000000-0000-0000-0000-000000000000', '1c4083fe-b59f-42e5-b2e8-9c61b0200961', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-18 17:07:14.015576+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b6b1ac86-4b1c-44dc-9f8d-f63a4c3821e2', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-18 21:21:40.076813+00', ''),
	('00000000-0000-0000-0000-000000000000', '5726be80-ed87-4605-b908-8f1a2fcc99e5', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-18 21:21:40.104485+00', ''),
	('00000000-0000-0000-0000-000000000000', '077439e7-4371-4c66-b0ac-c0e564ea04cf', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-18 21:54:40.410667+00', ''),
	('00000000-0000-0000-0000-000000000000', '37785fe1-8c17-41b4-a3b7-24932c13f594', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-18 21:54:40.427272+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ab010d2c-4349-448b-a1e2-eb0b948accf1', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-18 23:16:11.210396+00', ''),
	('00000000-0000-0000-0000-000000000000', '04e2edcf-ed0c-4f0d-85d5-e6113a801dc4', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-18 23:16:11.22776+00', ''),
	('00000000-0000-0000-0000-000000000000', '7965781e-8f0f-4246-a1dd-3d62c0681a01', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-19 10:00:07.772528+00', ''),
	('00000000-0000-0000-0000-000000000000', 'aae22f16-b881-47fc-ab75-41b2fbf646d8', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-19 10:00:07.803871+00', ''),
	('00000000-0000-0000-0000-000000000000', '6c434f9c-e48e-4704-bde5-cdaf87e61675', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-19 14:48:02.655483+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cfd219d3-698c-4da8-91e1-7b3e07b9a640', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-19 14:48:02.678971+00', ''),
	('00000000-0000-0000-0000-000000000000', '2f23f338-c78f-47ea-925c-2d3e0c7bc9de', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-19 14:55:00.526989+00', ''),
	('00000000-0000-0000-0000-000000000000', '648172be-8199-4ce3-a622-ca73f22d76df', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-19 14:55:00.54736+00', ''),
	('00000000-0000-0000-0000-000000000000', '80793510-bf85-4773-a451-cd4092ff4e7e', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-19 15:53:33.377547+00', ''),
	('00000000-0000-0000-0000-000000000000', '235b37a4-93fa-4b61-bdad-765ba6e6938a', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-19 15:53:33.392934+00', ''),
	('00000000-0000-0000-0000-000000000000', '1e9ea940-499f-40a3-b11f-51ba15dd4936', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-19 16:52:45.585851+00', ''),
	('00000000-0000-0000-0000-000000000000', '6baf0777-1556-4570-942b-7c278d579451', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-19 16:52:45.599998+00', ''),
	('00000000-0000-0000-0000-000000000000', '82bd33af-d6f8-448a-af43-9b7ae5b49d88', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-19 17:51:28.579393+00', ''),
	('00000000-0000-0000-0000-000000000000', '85ebfb1f-b3e1-40b2-a4a8-56f61c677c98', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-19 17:51:28.593719+00', ''),
	('00000000-0000-0000-0000-000000000000', '5464f887-081c-484d-bd8d-c4c72fa278dd', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-19 18:50:00.801602+00', ''),
	('00000000-0000-0000-0000-000000000000', '9776b2d5-c93b-4238-998f-4de8c09131d2', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-19 18:50:00.816086+00', ''),
	('00000000-0000-0000-0000-000000000000', '926bbb8e-be6c-4e33-9e09-fd0d384af4eb', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-20 09:43:12.98578+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bdb8eb31-21a1-411c-afc7-97098878005c', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-20 09:43:13.004834+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd769a535-cf81-4a1d-9c0b-ba855ab3c9c0', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-20 09:59:53.584359+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ddadcb3e-d82b-4e56-9a6a-4a3501593f10', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-20 09:59:53.590679+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a4d0e029-39dd-498c-995b-fb3e0aff58c9', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-20 11:04:52.023696+00', ''),
	('00000000-0000-0000-0000-000000000000', '15cc2335-e476-495d-a6a5-0fce9d068941', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-20 11:04:52.036586+00', ''),
	('00000000-0000-0000-0000-000000000000', '4310c3ea-1685-4eb7-b1d1-032b6a2c7eb0', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-20 12:07:30.450511+00', ''),
	('00000000-0000-0000-0000-000000000000', '49c9611e-17c6-4f4e-a82f-336eec62193a', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-20 12:07:30.461599+00', ''),
	('00000000-0000-0000-0000-000000000000', '76b819aa-115a-4931-b593-2f6139fd0fd1', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-20 12:25:06.662732+00', ''),
	('00000000-0000-0000-0000-000000000000', '9f4fb8fd-773d-454d-bb56-6ab7001d70d9', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-20 12:25:06.667002+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e354682e-94e9-429f-a524-ce04f59966b3', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-20 13:12:48.592143+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f17ec67f-13db-41f7-990d-dd954ba4c73f', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-20 13:12:48.605481+00', ''),
	('00000000-0000-0000-0000-000000000000', '92414079-7a36-4130-aff3-5e2849a95d0c', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-20 15:05:29.586264+00', ''),
	('00000000-0000-0000-0000-000000000000', '89be3694-5e56-45d9-b9ed-966239aed1c8', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-20 15:05:29.602365+00', ''),
	('00000000-0000-0000-0000-000000000000', '71edbe63-8a44-4f37-bce2-effa81f615d7', '{"action":"token_refreshed","actor_id":"7c263c3e-11b2-468e-a74d-98910c429842","actor_username":"aledip06@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-10-20 15:34:36.067357+00', ''),
	('00000000-0000-0000-0000-000000000000', '1aa3ac41-c9e1-469a-84c0-a0d19adfa0de', '{"action":"token_revoked","actor_id":"7c263c3e-11b2-468e-a74d-98910c429842","actor_username":"aledip06@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-10-20 15:34:36.07716+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c10cb1af-e0c1-4b7a-8556-1bb2140ede69', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-20 17:16:23.187902+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ba7b6827-ac1c-4a53-b76f-700e356ded53', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-20 17:16:23.197581+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c0a8a016-ad9e-4d2d-a56d-213d74a42264', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-20 19:23:49.214628+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fcdcab53-1430-4321-a79d-cc3bbfb6f0d2', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-20 19:23:49.223391+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd202c255-4c34-4eae-bec5-20f2be933ed0', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-20 19:24:09.362024+00', ''),
	('00000000-0000-0000-0000-000000000000', '9699bc65-2bfb-46c3-9e59-02f9a9036fda', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-20 19:24:09.363293+00', ''),
	('00000000-0000-0000-0000-000000000000', '2c93423b-7b59-452a-9b93-50139928f365', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-20 19:59:41.293679+00', ''),
	('00000000-0000-0000-0000-000000000000', '57d32627-0953-496d-b315-15ad55b45d52', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-20 19:59:41.306974+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b1bcc4a6-afaf-4244-b079-ab85a4e0a4c4', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-20 19:59:41.711842+00', ''),
	('00000000-0000-0000-0000-000000000000', '1ab7156d-0520-46e5-8374-1dbdfceffd3e', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-20 21:31:12.269243+00', ''),
	('00000000-0000-0000-0000-000000000000', '6305d8ed-5a99-4fbe-8351-b9fe2ce69b2d', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-20 21:31:12.284909+00', ''),
	('00000000-0000-0000-0000-000000000000', '2c5a9a58-ca6c-42a5-9332-59dc823472a9', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-20 22:43:07.010464+00', ''),
	('00000000-0000-0000-0000-000000000000', '8f767ffd-0473-449f-a62d-34a0ef7c120d', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-20 22:43:07.026319+00', ''),
	('00000000-0000-0000-0000-000000000000', '7c406277-f300-4ce7-bcff-b3736b9af495', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-21 00:49:06.77529+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c78cddf1-1c33-4fed-b0e8-816a8d0439f4', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-21 00:49:06.786166+00', ''),
	('00000000-0000-0000-0000-000000000000', '30fd57fd-75f7-4b31-b673-00e7461da6b6', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-21 01:00:56.100014+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd8ca4682-8b7c-48e1-a947-ef86d12d37a5', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-21 01:00:56.111617+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a66337d8-58d7-46c0-abbf-268c72131fc9', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-21 08:59:26.364487+00', ''),
	('00000000-0000-0000-0000-000000000000', '3310f988-0f62-4c51-8e12-9bd2b1bfdaa5', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-21 08:59:26.380732+00', ''),
	('00000000-0000-0000-0000-000000000000', '292ff46e-1ea7-44ff-84bd-3438345999c3', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-21 11:55:02.583124+00', ''),
	('00000000-0000-0000-0000-000000000000', '0b44ab6a-648f-4945-bb2b-3d99f0675317', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-21 11:55:02.598269+00', ''),
	('00000000-0000-0000-0000-000000000000', '386b12c2-f0d7-4a92-9586-7c9d46911ae5', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-21 12:38:40.487297+00', ''),
	('00000000-0000-0000-0000-000000000000', 'aa53624d-5bbf-48e9-a662-9e25351cf487', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-21 12:38:40.497529+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e837e8bd-d8df-49de-bfa9-be0a7db083c0', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-21 13:37:34.74651+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b19b0e77-0e7f-4620-8bf3-4ced66eba1c3', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-21 13:37:34.75903+00', ''),
	('00000000-0000-0000-0000-000000000000', '40d0e691-a683-47a1-af7e-dbb60e9894dd', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-21 13:40:16.919905+00', ''),
	('00000000-0000-0000-0000-000000000000', '99a450fd-517b-4add-88b8-394238e9ba70', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-21 13:40:16.921766+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ef437e27-5492-4cb4-8cfa-0fc95d9db483', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-21 14:25:05.358482+00', ''),
	('00000000-0000-0000-0000-000000000000', '39b44daf-9af2-44aa-a939-3db3d20b59ac', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-21 14:25:05.370944+00', ''),
	('00000000-0000-0000-0000-000000000000', '6ab5da83-64c1-42b5-89db-9f50f4f7d6a7', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-21 15:10:56.510327+00', ''),
	('00000000-0000-0000-0000-000000000000', '5678648f-0304-40c9-a5d5-ede6e13240d7', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-21 15:10:56.524974+00', ''),
	('00000000-0000-0000-0000-000000000000', '39f111d5-e88f-4d79-a51d-1d649f61dc73', '{"action":"logout","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account"}', '2025-10-21 15:11:55.004684+00', ''),
	('00000000-0000-0000-0000-000000000000', '7b12855f-f01d-43c6-9a80-313828d9d49b', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-21 15:12:12.71585+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b358d6a5-9e48-455f-9025-0a4be388db2c', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-22 00:16:47.769591+00', ''),
	('00000000-0000-0000-0000-000000000000', '46f31d14-c56b-4d58-b5e7-1bb8890983c6', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-22 09:04:23.009365+00', ''),
	('00000000-0000-0000-0000-000000000000', 'abe4c23e-345b-4e97-bebd-c6027707a879', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-22 21:13:01.297652+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c97a94f0-1087-4462-9195-caa833c5f756', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-22 21:13:01.316353+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ee2222a7-6c07-47cc-b0b8-c7dc35473844', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-23 15:41:10.464369+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c23d0196-014b-4fd4-a1ac-401d7d949c1a', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-23 15:41:10.482914+00', ''),
	('00000000-0000-0000-0000-000000000000', 'de2941f3-4fcf-46d4-93a7-22a29b453a0d', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-23 15:48:21.374282+00', ''),
	('00000000-0000-0000-0000-000000000000', '7f5a23a1-1ceb-4357-a93a-c4e69e5b4a44', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-23 15:48:21.381847+00', ''),
	('00000000-0000-0000-0000-000000000000', '5400b6a6-4528-45db-ad23-174d48cd8484', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-23 15:52:41.806948+00', ''),
	('00000000-0000-0000-0000-000000000000', '7c65a477-3835-4dd3-8554-9f2921ae2cea', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-23 16:44:49.792766+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd4648a82-0d32-4f36-9d87-66af03d538c5', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-23 18:27:11.925301+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fad0c82e-afad-4e97-bc70-551d1e84181f', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-23 18:27:11.937623+00', ''),
	('00000000-0000-0000-0000-000000000000', '546ca0e7-4faa-4ea1-8606-f065736858e5', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-23 18:53:13.805537+00', ''),
	('00000000-0000-0000-0000-000000000000', '87c9a586-6f5d-443d-887d-5368179a3239', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-23 18:53:13.82042+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ec27f586-2934-4085-ae99-c9a8513c9312', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-23 22:08:48.567857+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd06bdb6e-4fe9-411b-9b3e-c67f6423d26e', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-23 22:08:48.582168+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ed0ac45f-1ecf-4241-a0a2-6a1a6a66bf1b', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-24 01:19:48.44456+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a5c0e5be-1ff5-48e8-9fd7-00fb3c810e59', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-24 01:37:28.993801+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c7629715-3164-441d-a51a-2bab3a773c8c', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-24 01:47:21.617096+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f1ef7d5e-051b-447f-99d0-750e5fcf1367', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-24 01:47:21.625817+00', ''),
	('00000000-0000-0000-0000-000000000000', 'be786587-a988-4e59-9673-0edfc69ae497', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-24 10:04:18.757798+00', ''),
	('00000000-0000-0000-0000-000000000000', '8054f886-3841-4759-a6cb-bf2945dd9015', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-24 10:04:18.775313+00', ''),
	('00000000-0000-0000-0000-000000000000', '0e2667d9-7dba-44d7-96d8-d55152081a88', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-24 10:22:09.566262+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ba875ddf-fcbe-47e4-b979-201ea00d2cbd', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-24 10:22:09.576454+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b1d8e579-ac0b-4833-bd0c-0312db502cbd', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-24 11:29:17.830849+00', ''),
	('00000000-0000-0000-0000-000000000000', 'be4baa47-8a3b-4bbb-b3d7-0e0912adc85e', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-24 11:29:17.842978+00', ''),
	('00000000-0000-0000-0000-000000000000', '5c910207-e5d5-4fef-b77e-929bf8cd0202', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-24 13:02:29.51107+00', ''),
	('00000000-0000-0000-0000-000000000000', '63ae7bdd-c7ac-4db2-9f94-8a94e0e3fa40', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-24 13:02:29.524339+00', ''),
	('00000000-0000-0000-0000-000000000000', '807c66aa-b55c-4d39-8359-d3b3f352b9b4', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-24 13:31:55.613939+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c3020251-eaa1-4ee1-9e38-56b074598409', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-24 13:31:55.631236+00', ''),
	('00000000-0000-0000-0000-000000000000', '471a03b0-e79e-40ee-a5b7-33ec498684e3', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-24 16:51:26.368957+00', ''),
	('00000000-0000-0000-0000-000000000000', 'afeb7003-6b24-479a-8e4d-2a437b10464a', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-24 16:52:47.002681+00', ''),
	('00000000-0000-0000-0000-000000000000', '09c6776b-2684-46d8-bb1f-62dc50de7883', '{"action":"login","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-24 17:02:34.768425+00', ''),
	('00000000-0000-0000-0000-000000000000', '253f2782-e495-4119-84d7-75f49c77de34', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-24 17:06:08.506841+00', ''),
	('00000000-0000-0000-0000-000000000000', '52652390-d013-4009-875e-a064ff57e2a7', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-24 17:06:08.51137+00', ''),
	('00000000-0000-0000-0000-000000000000', '4ddcc4e9-16af-473d-975a-4b743b03cd81', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-24 17:49:39.957939+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b83eccf9-733e-4b68-84c7-a7a000cf45ef', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-24 17:49:39.968987+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bd13c0e2-27fc-45fc-84ce-4db4d0da7419', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-24 17:57:33.228581+00', ''),
	('00000000-0000-0000-0000-000000000000', '95fa2b1b-5f92-4059-bba1-ffe4664bd3d6', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-24 17:57:33.232797+00', ''),
	('00000000-0000-0000-0000-000000000000', '4899894c-0f8a-408a-9dce-58593fdd2a0c', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-24 21:25:22.705874+00', ''),
	('00000000-0000-0000-0000-000000000000', '74d7e888-7a5e-4ae2-96e6-c4d362ee0d10', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-24 21:25:22.718929+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e7a0745e-acdd-4274-98d1-98b961d29041', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-24 22:24:06.274337+00', ''),
	('00000000-0000-0000-0000-000000000000', '839c4905-4aa3-40d3-9913-74cb6a5dca13', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-24 22:24:06.287313+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a547976c-55d1-4498-ba76-ee7ba628e599', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-24 22:24:06.764912+00', ''),
	('00000000-0000-0000-0000-000000000000', '07563983-2cc2-484a-8bb9-af48ef137c4e', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-24 23:09:12.716999+00', ''),
	('00000000-0000-0000-0000-000000000000', '26bb996a-46c4-4618-9fb3-15a97fec581c', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-24 23:09:12.729282+00', ''),
	('00000000-0000-0000-0000-000000000000', '9642645c-959a-4137-8a05-f0bd53c9b4c1', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-24 23:22:43.435809+00', ''),
	('00000000-0000-0000-0000-000000000000', '441809db-cb0b-4f9b-a105-ce8c46667523', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-24 23:22:43.450359+00', ''),
	('00000000-0000-0000-0000-000000000000', '7f51da33-f5e8-43d9-881d-22668852910b', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-25 00:15:34.635816+00', ''),
	('00000000-0000-0000-0000-000000000000', '30efe981-c6cb-4391-8c2c-dc3946e8dbb1', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-25 00:15:34.645456+00', ''),
	('00000000-0000-0000-0000-000000000000', '4f407f59-5a03-4d11-8402-708ce0c5ac62', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-25 11:21:35.306734+00', ''),
	('00000000-0000-0000-0000-000000000000', '76eb31e5-c47e-4bdf-a335-6842520ea93f', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-25 11:21:35.329672+00', ''),
	('00000000-0000-0000-0000-000000000000', '96d1c249-1145-48e8-ac72-6b59f437250b', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-25 11:22:18.350037+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ac00c675-2880-4c87-a20a-e5bf7338d447', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-25 11:22:18.356214+00', ''),
	('00000000-0000-0000-0000-000000000000', '66a69646-35f1-423a-b014-771332e0fd96', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-25 12:21:25.64475+00', ''),
	('00000000-0000-0000-0000-000000000000', '8b862a3e-94c8-4c75-8b39-4c6a596ce4c4', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-25 12:21:25.659513+00', ''),
	('00000000-0000-0000-0000-000000000000', '199034c0-53e4-4309-adf7-5eb12eb931d6', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-25 12:22:05.588241+00', ''),
	('00000000-0000-0000-0000-000000000000', '7b745f14-334c-407b-934b-03fc9e711651', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-25 13:57:05.383496+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd973f786-eaaf-413e-8571-a99c4bb137ec', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-25 13:57:05.399232+00', ''),
	('00000000-0000-0000-0000-000000000000', 'db6efeb4-811c-4ab1-9719-a073b2fa60d4', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-25 15:05:50.695801+00', ''),
	('00000000-0000-0000-0000-000000000000', '55bfca3f-fbb8-4b87-8f8c-8a50ac51653c', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-25 15:05:50.712934+00', ''),
	('00000000-0000-0000-0000-000000000000', '4e7d6612-1740-4945-886d-c61239ae9369', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-25 15:59:06.59685+00', ''),
	('00000000-0000-0000-0000-000000000000', '3537a45a-d9f1-4fb3-be40-4e1ca13bb134', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-25 21:05:53.854545+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f128e450-6b42-43a6-87cc-6bfa7390dcf9', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-25 21:05:53.872268+00', ''),
	('00000000-0000-0000-0000-000000000000', '8ffe9c1e-848a-4639-8854-c222abb3e2e2', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-25 21:06:43.212913+00', ''),
	('00000000-0000-0000-0000-000000000000', '492ac9eb-9ef9-436c-87e8-4de687859049', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-26 02:22:49.360848+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bcb428ab-cd2f-4ab7-859f-0030a4e6a9df', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-26 02:22:49.385513+00', ''),
	('00000000-0000-0000-0000-000000000000', '6f8cadec-0500-4ed8-922b-9456666c9dbb', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-26 10:11:02.250657+00', ''),
	('00000000-0000-0000-0000-000000000000', '83213e20-7a3b-4a9e-9b07-f8f5b0a53649', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-26 10:11:02.271214+00', ''),
	('00000000-0000-0000-0000-000000000000', '5b020a2b-9974-470a-a6aa-ae987c98dc57', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-26 10:12:38.2464+00', ''),
	('00000000-0000-0000-0000-000000000000', '73c99961-c795-4f3e-970c-32b9059bfa80', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-26 10:12:38.253974+00', ''),
	('00000000-0000-0000-0000-000000000000', '138582f7-45ed-40e2-9da4-871af6b0d01f', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-26 10:14:46.601032+00', ''),
	('00000000-0000-0000-0000-000000000000', 'db100aec-f08f-44f4-873c-d7895cbc6d4d', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-26 10:14:46.603226+00', ''),
	('00000000-0000-0000-0000-000000000000', '7a1ac821-1749-402e-9761-1dd9dbc9ab6f', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-26 10:14:59.405313+00', ''),
	('00000000-0000-0000-0000-000000000000', '8755814e-7dbb-4357-826d-6148a5489d9a', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-26 10:14:59.40736+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ed64e3d2-84fa-4a3b-8796-d66aa966964a', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-26 11:29:07.56423+00', ''),
	('00000000-0000-0000-0000-000000000000', '5a911721-c16f-4082-a48c-320fb7fcef08', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-26 11:29:07.577343+00', ''),
	('00000000-0000-0000-0000-000000000000', '632729de-74b8-4218-bec8-9c41b7821eb0', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-26 12:21:56.553003+00', ''),
	('00000000-0000-0000-0000-000000000000', '96af9198-8245-4337-b950-6337eb35761d', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-26 12:21:56.56954+00', ''),
	('00000000-0000-0000-0000-000000000000', '97d0c4aa-190c-4f7d-9d21-0688f1323be6', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-26 13:28:30.581119+00', ''),
	('00000000-0000-0000-0000-000000000000', '8161d8d3-5af6-42a9-8a5e-b5da46dae205', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-26 13:28:30.597068+00', ''),
	('00000000-0000-0000-0000-000000000000', '64fa9160-bd50-4b0c-9173-f95cdcab7780', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-26 15:08:08.626286+00', ''),
	('00000000-0000-0000-0000-000000000000', 'aa9bc0da-3c38-4244-a0be-6cf5cab30e3d', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-26 15:08:08.642082+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c3763efc-cfc5-403f-adff-26dfa648ca97', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-26 16:10:04.003294+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e8f243d0-62f6-46b0-9a19-dc6a639a6e81', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-26 16:10:04.018022+00', ''),
	('00000000-0000-0000-0000-000000000000', '8681c65f-e877-4da4-98a5-1e715d122c2f', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-26 16:50:55.8154+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ee528541-af1b-49ad-8b14-3e43c56723d1', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-26 16:59:02.759415+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bc12f1fa-9259-4215-b999-b580b11d5622', '{"action":"token_refreshed","actor_id":"7c263c3e-11b2-468e-a74d-98910c429842","actor_username":"aledip06@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-10-26 17:11:59.198762+00', ''),
	('00000000-0000-0000-0000-000000000000', '6920a5a1-6875-4d60-951a-11bf1a57f2ac', '{"action":"token_revoked","actor_id":"7c263c3e-11b2-468e-a74d-98910c429842","actor_username":"aledip06@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-10-26 17:11:59.204455+00', ''),
	('00000000-0000-0000-0000-000000000000', '109c3475-142b-49cf-83b3-2a31a212f88c', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-26 17:18:02.753969+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c148eedd-8281-44c0-a58e-c6b49d479a18', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-26 17:29:18.847209+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd7ac57e3-cb87-48cb-8d58-2baaf18ac16d', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-26 17:37:32.693478+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a819bcf6-d228-481b-857c-64d8f5cefbcd', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-26 17:37:38.890657+00', ''),
	('00000000-0000-0000-0000-000000000000', '68507c91-ad06-4cfd-aaf4-e018cb361031', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-26 17:40:06.168695+00', ''),
	('00000000-0000-0000-0000-000000000000', '79d5de3f-0294-47d7-8ed8-12be0d77e75b', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-26 18:36:36.564908+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a2d165cb-d83a-4be0-9379-20c0bab7258f', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-26 18:42:26.08819+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b14d6141-0614-4455-8db5-b3ac741e18a1', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-26 19:00:47.928529+00', ''),
	('00000000-0000-0000-0000-000000000000', 'adc70081-74fb-44cc-8116-20f8549eb752', '{"action":"token_refreshed","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-26 19:15:44.330898+00', ''),
	('00000000-0000-0000-0000-000000000000', '12c391a1-2ab7-4ac4-a87e-cbc27cca1a9d', '{"action":"token_revoked","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-26 19:15:44.335952+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b15fe9d8-dbf9-47ae-84a1-9dd94d22f42e', '{"action":"token_refreshed","actor_id":"7c263c3e-11b2-468e-a74d-98910c429842","actor_username":"aledip06@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-10-26 19:26:03.640652+00', ''),
	('00000000-0000-0000-0000-000000000000', '56f614db-994b-4f14-b98d-ffca0180ede4', '{"action":"token_revoked","actor_id":"7c263c3e-11b2-468e-a74d-98910c429842","actor_username":"aledip06@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-10-26 19:26:03.649329+00', ''),
	('00000000-0000-0000-0000-000000000000', '146475c4-264c-4a36-a821-fe2f405600b9', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-26 21:32:53.248712+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bc5d7503-e6b4-4e23-9f35-6d20ab6b2c7f', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-26 21:32:53.267442+00', ''),
	('00000000-0000-0000-0000-000000000000', '43b6962a-846d-4273-a117-c29baa14757a', '{"action":"token_refreshed","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-27 10:49:03.970551+00', ''),
	('00000000-0000-0000-0000-000000000000', '4c114831-03fd-4ecd-81ba-9db381cae15b', '{"action":"token_revoked","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-27 10:49:03.990791+00', ''),
	('00000000-0000-0000-0000-000000000000', '9bb8f68c-00a0-40a1-9d66-e282fbbefdcb', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-27 14:45:33.651026+00', ''),
	('00000000-0000-0000-0000-000000000000', '94945ac0-dd43-4c47-8b9e-8293a6813da1', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-27 14:45:33.669285+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd50a8c30-2d64-4d4a-af71-69f7009a7d93', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-27 14:58:47.569591+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a7f93283-6082-4452-afcf-72943dcecc13', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-27 15:01:18.978073+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a4526cbe-e542-4ead-8aa6-493bb22b8e51', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-27 15:01:18.980091+00', ''),
	('00000000-0000-0000-0000-000000000000', '973b8dc4-61fc-4b36-9c57-efc709675e74', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-27 15:21:03.405747+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a2e3b118-d6bf-44f8-b90b-77e2d0304a98', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-27 15:21:03.459197+00', ''),
	('00000000-0000-0000-0000-000000000000', '2e0c929c-c4ed-43e2-9201-22264919dc61', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-27 16:08:54.330842+00', ''),
	('00000000-0000-0000-0000-000000000000', '13c421c2-83de-4c14-b98e-6d7016e05a36', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-27 16:08:54.340955+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd3b9e1b1-0143-4be3-9f53-b76cc8fad1ee', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-27 17:17:45.121891+00', ''),
	('00000000-0000-0000-0000-000000000000', '395641bd-dcd3-41ae-9745-ecc57876e653', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-27 17:17:45.139962+00', ''),
	('00000000-0000-0000-0000-000000000000', '8b5ce9df-903c-4515-97f2-2dbaee175794', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-27 18:19:41.189828+00', ''),
	('00000000-0000-0000-0000-000000000000', '38ad6c0e-5b20-4538-8160-70ba7381bbee', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-27 18:19:41.207294+00', ''),
	('00000000-0000-0000-0000-000000000000', '935f24d5-405c-4c0b-8771-26f0aa83ef69', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-27 19:18:00.710977+00', ''),
	('00000000-0000-0000-0000-000000000000', '0dc47bd1-0b28-4d51-ba4d-42f8a5218fb1', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-27 19:18:00.725968+00', ''),
	('00000000-0000-0000-0000-000000000000', '647fced1-d424-46da-974a-2f4ba1d1db03', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-27 19:31:30.38037+00', ''),
	('00000000-0000-0000-0000-000000000000', '9bb0a969-98ba-4c00-aeb7-c521f5e5944d', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-27 19:31:30.389241+00', ''),
	('00000000-0000-0000-0000-000000000000', '7def95a9-5320-4c91-a7f1-ba08f9ebe30a', '{"action":"token_refreshed","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-27 19:33:31.525046+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ee623f37-3c8e-4062-a4f3-029f0f26ef1b', '{"action":"token_revoked","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-27 19:33:31.528238+00', ''),
	('00000000-0000-0000-0000-000000000000', '850104b5-1531-4d69-8be0-3584a70d63fc', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-27 20:25:08.391299+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bd8e4318-5a09-48ec-8892-8e1e2e931bcc', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-27 20:25:08.406824+00', ''),
	('00000000-0000-0000-0000-000000000000', '31708deb-a229-49fd-89b6-1957ef8b108d', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-27 20:56:54.29979+00', ''),
	('00000000-0000-0000-0000-000000000000', '80bae922-a8bb-4f24-b0c5-1f04e1380bc9', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-27 21:43:53.926669+00', ''),
	('00000000-0000-0000-0000-000000000000', '6a858613-0064-4bca-b424-cbe949e40d2b', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-27 21:43:53.939521+00', ''),
	('00000000-0000-0000-0000-000000000000', '94ab9a94-19c8-48c9-8e7c-01d4f9281b89', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-27 21:47:02.808648+00', ''),
	('00000000-0000-0000-0000-000000000000', '8d0fe4c9-0d47-47ac-aace-d4857a95bf02', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-27 21:47:02.810007+00', ''),
	('00000000-0000-0000-0000-000000000000', '5d212ec1-571e-418d-a7a2-c470f0fa0c8e', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-27 21:49:59.056287+00', ''),
	('00000000-0000-0000-0000-000000000000', '9dc0d3d9-faa2-4152-a968-bf1b001f77d4', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-27 23:15:37.888887+00', ''),
	('00000000-0000-0000-0000-000000000000', '6e9dbbbb-4661-412d-a736-1401036863a4', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-27 23:15:37.907329+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e9dadaa6-c41c-479f-8df2-870acc455ff4', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-27 23:19:12.823315+00', ''),
	('00000000-0000-0000-0000-000000000000', '28d4bf30-4f14-4c25-897f-79c6ce484f05', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-27 23:19:12.826729+00', ''),
	('00000000-0000-0000-0000-000000000000', '056d9ef3-4a3c-42e1-ae4f-a5dfafadd80e', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-27 23:24:10.41337+00', ''),
	('00000000-0000-0000-0000-000000000000', '5c823044-9180-4c2d-a8ea-24afecd550d1', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-28 00:00:44.244906+00', ''),
	('00000000-0000-0000-0000-000000000000', '6356137c-e18c-4c55-a33b-aaf46b39f490', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-28 00:11:32.652729+00', ''),
	('00000000-0000-0000-0000-000000000000', '23ee2c5f-cce3-42cd-815d-c950f5a25044', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-28 00:18:06.40168+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a52a3b8b-fec3-4836-86cf-51c4e589934b', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-28 00:18:06.405222+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f657ccb9-4367-4e0d-b42a-9bf3d3c09ce7', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-28 00:22:27.322272+00', ''),
	('00000000-0000-0000-0000-000000000000', '3492f070-f0c3-4af4-b5fc-c695607cddb8', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-28 00:24:33.772487+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e7d11e95-ad1a-4ae9-824b-a585b9ab926e', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-28 00:26:40.7144+00', ''),
	('00000000-0000-0000-0000-000000000000', 'db3b607e-a167-4767-9e58-b62ec1f78edf', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-28 00:29:54.158305+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fd15b9aa-f3a4-4652-ab71-2be77d97eea8', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-28 00:29:54.160936+00', ''),
	('00000000-0000-0000-0000-000000000000', 'eb66e190-57fa-444f-ae00-e4bc9b3f7de7', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-28 01:10:08.3767+00', ''),
	('00000000-0000-0000-0000-000000000000', '3427a65f-f55c-41b9-855f-33c59ab0c062', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-28 01:10:08.386573+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cfb333ec-5da4-4e8b-8874-cc7dcaf9b34a', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-28 01:11:47.405206+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a40bf31a-098f-439a-9e09-45661226fddf', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-28 01:18:57.695402+00', ''),
	('00000000-0000-0000-0000-000000000000', '5ded69ee-fec7-4f94-a1fc-7dd76d21d6d1', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-28 01:18:57.702953+00', ''),
	('00000000-0000-0000-0000-000000000000', '907c6519-72e8-4474-8f0a-989df35d5bfa', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-28 01:43:54.98408+00', ''),
	('00000000-0000-0000-0000-000000000000', '11557b4d-6f0f-4bf2-a166-8662bdd61924', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-28 01:43:54.998556+00', ''),
	('00000000-0000-0000-0000-000000000000', '20ba64d2-af46-4382-ae6c-8344e3a8aef1', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-28 02:10:03.518556+00', ''),
	('00000000-0000-0000-0000-000000000000', '8abf106f-a9e9-4525-bc34-190ccc4320f9', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-28 02:10:03.53193+00', ''),
	('00000000-0000-0000-0000-000000000000', '43cfce36-1656-47e7-98cc-0feac09bca9a', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-28 02:26:39.768937+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fa3b0470-c527-44ac-b393-6b84a8fb8029', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-28 02:35:26.07674+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f3674fc5-cdda-4d62-972f-539211685875', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-28 02:35:26.083645+00', ''),
	('00000000-0000-0000-0000-000000000000', '934d7c09-5781-4c9d-89a4-fd5bab1d0fae', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-28 13:46:58.122518+00', ''),
	('00000000-0000-0000-0000-000000000000', '3db7de1a-0d62-4b15-b168-c78f70edc952', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-28 13:46:58.128034+00', ''),
	('00000000-0000-0000-0000-000000000000', 'edbe3b9d-5b17-46ba-9170-68454d5dbfff', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-28 13:46:58.135922+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b33d1b28-0893-4908-b8c1-0c19db09d6ed', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-28 13:46:58.135783+00', ''),
	('00000000-0000-0000-0000-000000000000', '62abcc59-0728-4750-a4f6-c125fcb428ad', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-28 13:47:10.885194+00', ''),
	('00000000-0000-0000-0000-000000000000', '6f823c14-54c3-4e34-b3ab-bcdfd2e5d22f', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-28 13:47:10.887842+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ab2fc4a0-86c5-42a8-af10-a1c5c644519a', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-28 13:49:40.236642+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e4968ac6-92d6-4248-800e-5510ced4f2df', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-28 13:49:40.238667+00', ''),
	('00000000-0000-0000-0000-000000000000', 'af4d5161-2015-495d-9159-a253951b099c', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-28 13:52:18.910871+00', ''),
	('00000000-0000-0000-0000-000000000000', '119d860b-2340-42af-9ffd-6f1417d3c0b5', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-28 14:33:09.25673+00', ''),
	('00000000-0000-0000-0000-000000000000', '2a96dfc8-b3c1-4fe1-9a0f-ac52b1cbd21e', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-28 15:15:10.709304+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cd275cc1-44aa-48b8-b9a5-2ad52d564823', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-28 15:15:10.726668+00', ''),
	('00000000-0000-0000-0000-000000000000', '5c37b6f7-a1cb-4f69-bb31-85e9cfb341c0', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-28 15:19:05.566327+00', ''),
	('00000000-0000-0000-0000-000000000000', '4682a0d6-5745-43b6-bd69-9714044debb5', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-28 15:19:45.685316+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd9b5c7e5-2bae-434c-9a46-07ab87f39998', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-28 15:36:04.67406+00', ''),
	('00000000-0000-0000-0000-000000000000', '832e632d-6221-4695-b03c-55a18684101b', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-28 16:00:26.110675+00', ''),
	('00000000-0000-0000-0000-000000000000', '5ad50ae4-2d2e-4e21-8f13-7ffa2c7b0917', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-28 16:29:51.638793+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd6d7aca6-0b6c-4688-b4ec-b7422dab2f05', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-28 16:29:51.65087+00', ''),
	('00000000-0000-0000-0000-000000000000', '827c94c6-b4f3-42b3-b3c3-d0d3f5da9f71', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-28 16:33:14.077859+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f9e03418-e6e9-4830-ac32-80bf9483c572', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-28 16:34:26.501238+00', ''),
	('00000000-0000-0000-0000-000000000000', '2425e5c2-9b0b-4965-a8c4-d48cf6d3ba50', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-28 16:48:29.294808+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd390b981-d16a-4b0b-87ce-c1ad4bf8ca9d', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-28 16:51:46.42541+00', ''),
	('00000000-0000-0000-0000-000000000000', '22c9c1fc-4e43-474e-b3e2-f8549e02c360', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-28 16:51:46.428168+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd51f186c-3d46-4734-99bb-3a7c4b65ff74', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-28 16:55:37.906331+00', ''),
	('00000000-0000-0000-0000-000000000000', '29a7c5c5-56f3-4827-ab6b-cc22c0f468a5', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-28 17:33:49.038249+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cc865e7a-3efb-4e41-b22c-97247c2027d9', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-28 17:33:49.049136+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ebcc2edc-be07-45e3-aed2-202a5fa3160a', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-28 18:05:33.809778+00', ''),
	('00000000-0000-0000-0000-000000000000', 'dad43dcc-c4e4-45b2-9c95-fd2b3c05c377', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-28 18:05:33.822972+00', ''),
	('00000000-0000-0000-0000-000000000000', '9bf57a77-6c69-49bc-bafe-76c193688e54', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-28 18:05:59.46593+00', ''),
	('00000000-0000-0000-0000-000000000000', '0fab0e15-7144-4788-ae71-3dcfa5c87ad7', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-28 18:15:20.673298+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c866f57e-f07f-4ae2-922a-b830c9eacb03', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-28 20:28:34.513166+00', ''),
	('00000000-0000-0000-0000-000000000000', '63832998-5041-47e7-a628-7d445d20bd6b', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-28 20:28:34.531123+00', ''),
	('00000000-0000-0000-0000-000000000000', '546fcc3d-41b0-44c5-815f-1fca56af5e3b', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-29 15:36:59.607599+00', ''),
	('00000000-0000-0000-0000-000000000000', '6729b66f-959f-474c-bd9e-8fa55ca0fa74', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-29 15:36:59.624783+00', ''),
	('00000000-0000-0000-0000-000000000000', '56e3f49c-5041-4e70-96bb-2f7b5a839a2e', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-29 15:57:47.611517+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ff6ea25a-7ba5-4bc5-9500-9344a6e5d743', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-29 16:56:28.307887+00', ''),
	('00000000-0000-0000-0000-000000000000', '2639ceee-0210-4a8e-8f1d-692eb9e2b281', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-29 16:56:28.320637+00', ''),
	('00000000-0000-0000-0000-000000000000', '43c425a2-0f54-4fc2-ab28-ba0284ea8fb9', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-29 17:45:24.074315+00', ''),
	('00000000-0000-0000-0000-000000000000', '46865716-45af-4ca1-9ead-cfaa03533b77', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-29 17:45:24.084784+00', ''),
	('00000000-0000-0000-0000-000000000000', '2bf8fc7f-6558-48d5-bb5d-d144e02222c2', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-29 18:06:56.370133+00', ''),
	('00000000-0000-0000-0000-000000000000', '77946a34-8e85-4aae-88ea-35950ff50d57', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-29 18:06:56.378224+00', ''),
	('00000000-0000-0000-0000-000000000000', 'faf7392d-0898-4468-a553-0249795c1c58', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-29 18:54:05.431472+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e097cdde-c52c-4897-b321-0ef18dff1747', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-29 18:54:05.445935+00', ''),
	('00000000-0000-0000-0000-000000000000', '8b35492c-2599-489f-82c5-8782ea90df74', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-29 19:55:38.37187+00', ''),
	('00000000-0000-0000-0000-000000000000', '5087ffd9-8a34-4be0-9757-f2009de444bc', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-29 19:55:38.379624+00', ''),
	('00000000-0000-0000-0000-000000000000', '0db5faaf-1668-46e0-b1b8-39329beb40fb', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-29 20:26:34.429857+00', ''),
	('00000000-0000-0000-0000-000000000000', '49a6cd93-c9f2-4451-92e9-a43c872311a8', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-29 20:26:34.448658+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd54fcc0b-0241-4144-a8ce-482d18bb2d7c', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-29 21:39:38.659153+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a5cba227-be4f-422a-97fa-8d75a31794b2', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-29 21:39:38.675296+00', ''),
	('00000000-0000-0000-0000-000000000000', '9914cf87-c6d7-4458-8935-a6cf0c8228c1', '{"action":"logout","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account"}', '2025-10-29 21:39:44.803321+00', ''),
	('00000000-0000-0000-0000-000000000000', '0ba2140b-d092-4d37-98a0-fb1b9fa11768', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-29 23:51:43.106977+00', ''),
	('00000000-0000-0000-0000-000000000000', '00121201-7632-41a8-ae4a-4d148b1416b5', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-30 02:48:29.363733+00', ''),
	('00000000-0000-0000-0000-000000000000', '1e2a0c04-d894-4499-804a-4d4bc570d896', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-30 02:48:29.378246+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ca0feed0-9832-4022-92d8-705a07486301', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-30 11:37:06.346133+00', ''),
	('00000000-0000-0000-0000-000000000000', '74a036b8-fa5d-4762-98e3-3620b36aa228', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-30 11:37:06.364401+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd2570475-e105-4df7-b534-cb1b05938153', '{"action":"logout","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account"}', '2025-10-30 11:37:08.970443+00', ''),
	('00000000-0000-0000-0000-000000000000', '0610a319-6fcc-4ce5-89f7-d32783fe636c', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-30 11:39:33.033126+00', ''),
	('00000000-0000-0000-0000-000000000000', '63fda6bf-2a00-4ffb-9230-20bd5fbd623b', '{"action":"user_confirmation_requested","actor_id":"c4cf2c17-e064-45d5-9a99-c9f56d510b43","actor_username":"ouazanaruben@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-10-30 18:31:11.212614+00', ''),
	('00000000-0000-0000-0000-000000000000', 'be872c3e-e8fe-4b59-aab5-95b30ed9a25b', '{"action":"user_signedup","actor_id":"c4cf2c17-e064-45d5-9a99-c9f56d510b43","actor_username":"ouazanaruben@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}', '2025-10-30 18:31:41.935032+00', ''),
	('00000000-0000-0000-0000-000000000000', '20e21841-f005-44e9-8514-afdb821391aa', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-30 22:10:03.207052+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd9caaa52-29cf-4e93-9f1c-35559cbbaa3b', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-30 22:10:03.225672+00', ''),
	('00000000-0000-0000-0000-000000000000', '31281b4b-9517-45c7-9ae4-d42b5b4cc6cd', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-30 23:18:46.509097+00', ''),
	('00000000-0000-0000-0000-000000000000', '9e0b9264-a0f4-48ac-ac99-218cbac644bf', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-10-30 23:18:46.521328+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b39d3a88-9168-432f-bea1-29009352cdf4', '{"action":"logout","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account"}', '2025-10-30 23:18:49.943755+00', ''),
	('00000000-0000-0000-0000-000000000000', '18507a21-2d74-4abf-afc0-e091449c0097', '{"action":"login","actor_id":"c4cf2c17-e064-45d5-9a99-c9f56d510b43","actor_username":"ouazanaruben@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-30 23:18:59.404559+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c53e2f5d-60c1-4b4d-9b8c-6899fb91b4bf', '{"action":"logout","actor_id":"c4cf2c17-e064-45d5-9a99-c9f56d510b43","actor_username":"ouazanaruben@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-10-30 23:19:13.996343+00', ''),
	('00000000-0000-0000-0000-000000000000', '14f9bac5-6aeb-4856-8b17-41a8cea49e33', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-30 23:19:30.292764+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ad096785-c2c5-49e3-9d2b-2780d6bf74fe', '{"action":"login","actor_id":"c4cf2c17-e064-45d5-9a99-c9f56d510b43","actor_username":"ouazanaruben@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-31 00:04:29.522364+00', ''),
	('00000000-0000-0000-0000-000000000000', 'dcde0675-1322-40f6-9fb9-9dc52abd4c75', '{"action":"logout","actor_id":"c4cf2c17-e064-45d5-9a99-c9f56d510b43","actor_username":"ouazanaruben@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-10-31 00:12:19.070144+00', ''),
	('00000000-0000-0000-0000-000000000000', '475b653d-f603-498b-ad7c-ab0ba2c8f25a', '{"action":"user_confirmation_requested","actor_id":"55034d65-9e42-4b51-bd39-fbde6eeec7e7","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-10-31 00:14:43.007295+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f7bbc988-1c12-467f-8eb7-8acf1136edc0', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-31 00:19:42.052821+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a0d876c9-4187-4f06-9b92-331785519c94', '{"action":"user_confirmation_requested","actor_id":"a57510c5-d4eb-414a-beeb-8ca49c94d311","actor_username":"ouazanaruben@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-10-31 00:37:27.615351+00', ''),
	('00000000-0000-0000-0000-000000000000', '12f2a88b-fb2a-4539-84e6-e0ee30b2e2f5', '{"action":"user_signedup","actor_id":"a57510c5-d4eb-414a-beeb-8ca49c94d311","actor_username":"ouazanaruben@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}', '2025-10-31 00:37:54.474249+00', ''),
	('00000000-0000-0000-0000-000000000000', '6c786d7e-dab4-44f7-9666-402c350253b0', '{"action":"login","actor_id":"a57510c5-d4eb-414a-beeb-8ca49c94d311","actor_username":"ouazanaruben@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-31 00:38:05.634766+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cf8815f0-17ba-45d7-b34d-1dda14ecca31', '{"action":"logout","actor_id":"a57510c5-d4eb-414a-beeb-8ca49c94d311","actor_username":"ouazanaruben@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-10-31 00:58:50.72436+00', ''),
	('00000000-0000-0000-0000-000000000000', '7b547f89-7bb0-4ba6-812e-c74bbee20ace', '{"action":"user_confirmation_requested","actor_id":"040f9cb9-ae84-40b2-a9a0-fc4a53842e6a","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-10-31 00:59:49.816538+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b8d21a22-fb81-4325-be6d-14bb9bbb96c8', '{"action":"user_signedup","actor_id":"040f9cb9-ae84-40b2-a9a0-fc4a53842e6a","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}', '2025-10-31 01:00:29.954738+00', ''),
	('00000000-0000-0000-0000-000000000000', '3e6cff72-c222-44aa-b56a-258e2822602a', '{"action":"login","actor_id":"040f9cb9-ae84-40b2-a9a0-fc4a53842e6a","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-31 01:00:40.784065+00', ''),
	('00000000-0000-0000-0000-000000000000', 'df2ebc34-9094-4480-89e6-6db82b288087', '{"action":"logout","actor_id":"040f9cb9-ae84-40b2-a9a0-fc4a53842e6a","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-10-31 01:03:40.978606+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b17fa96e-fc70-495a-a74c-497fbf1c4928', '{"action":"logout","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account"}', '2025-10-31 01:04:54.209915+00', ''),
	('00000000-0000-0000-0000-000000000000', '9f4c98b9-2641-4865-8e42-af652432d1c9', '{"action":"user_repeated_signup","actor_id":"a57510c5-d4eb-414a-beeb-8ca49c94d311","actor_username":"ouazanaruben@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-10-31 01:07:06.581988+00', ''),
	('00000000-0000-0000-0000-000000000000', '2e8c0968-3a5b-4312-b689-6edc0b4ccd86', '{"action":"user_repeated_signup","actor_id":"a57510c5-d4eb-414a-beeb-8ca49c94d311","actor_username":"ouazanaruben@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-10-31 01:08:54.376547+00', ''),
	('00000000-0000-0000-0000-000000000000', '3e9cca56-cffb-4949-872b-c68b2180b0fa', '{"action":"user_confirmation_requested","actor_id":"902fb614-afa8-4d9d-bb44-c7c72c60f29d","actor_username":"runavii@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-10-31 01:10:11.811125+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f4a205ca-a629-4ba1-bc78-c464a509a307', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-18 17:34:51.230523+00', ''),
	('00000000-0000-0000-0000-000000000000', '3caf6067-9079-4611-b3dd-884233a6c496', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-18 23:43:39.513324+00', ''),
	('00000000-0000-0000-0000-000000000000', '28bd5a4f-2c66-462f-9eb8-434388b4135b', '{"action":"user_repeated_signup","actor_id":"040f9cb9-ae84-40b2-a9a0-fc4a53842e6a","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-10-31 01:15:26.325082+00', ''),
	('00000000-0000-0000-0000-000000000000', '13186475-ffd2-4557-9a6f-85e3d0796292', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-03 11:36:33.885349+00', ''),
	('00000000-0000-0000-0000-000000000000', '71ca0ff1-3073-452f-a3f2-d0f5050924e8', '{"action":"user_confirmation_requested","actor_id":"0c3e9099-fe61-4619-9058-06ca6851bd84","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-10-31 01:19:23.97722+00', ''),
	('00000000-0000-0000-0000-000000000000', '5a90e262-c526-4bde-8c64-7d3f85ccb9e5', '{"action":"user_signedup","actor_id":"0c3e9099-fe61-4619-9058-06ca6851bd84","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}', '2025-10-31 01:19:35.165901+00', ''),
	('00000000-0000-0000-0000-000000000000', '45479a91-23c3-4a0b-9dee-ce843b5714e0', '{"action":"login","actor_id":"0c3e9099-fe61-4619-9058-06ca6851bd84","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-31 01:19:44.335795+00', ''),
	('00000000-0000-0000-0000-000000000000', '33644a20-e447-4223-bb68-95d3cc451452', '{"action":"logout","actor_id":"0c3e9099-fe61-4619-9058-06ca6851bd84","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-10-31 01:39:29.766177+00', ''),
	('00000000-0000-0000-0000-000000000000', '58e67325-4527-49f8-ac36-a40fa207ff38', '{"action":"user_repeated_signup","actor_id":"a57510c5-d4eb-414a-beeb-8ca49c94d311","actor_username":"ouazanaruben@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-10-31 01:43:29.626584+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a77b8445-8e5a-4ab4-8431-9ee78d6fddfd', '{"action":"user_repeated_signup","actor_id":"0c3e9099-fe61-4619-9058-06ca6851bd84","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-10-31 01:48:12.817863+00', ''),
	('00000000-0000-0000-0000-000000000000', '49e6dc81-78d9-4d4a-a599-afaa0ff86dd8', '{"action":"user_confirmation_requested","actor_id":"328e27ad-6352-4198-b173-370bd705950b","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-10-31 01:52:12.64501+00', ''),
	('00000000-0000-0000-0000-000000000000', '1f4f51a2-fa06-4483-bf81-cc317f29396f', '{"action":"user_signedup","actor_id":"328e27ad-6352-4198-b173-370bd705950b","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}', '2025-10-31 01:52:27.361692+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c8920507-a3c9-4a63-97e3-b812e5bbf776', '{"action":"login","actor_id":"328e27ad-6352-4198-b173-370bd705950b","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-31 01:52:31.841719+00', ''),
	('00000000-0000-0000-0000-000000000000', '9d37a0c5-3bf5-41d0-9f80-fe8d286339d1', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-31 01:54:16.42485+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ffaacd7f-dcc5-4c8a-8b93-8a8512375f2d', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-10-31 18:45:28.432863+00', ''),
	('00000000-0000-0000-0000-000000000000', '2b952e00-f520-4b9b-994b-91e5dda1f7ba', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-01 15:27:53.4702+00', ''),
	('00000000-0000-0000-0000-000000000000', '030d8760-dcec-4c69-8952-03bcfefde7e4', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-01 15:27:53.489165+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f1c48cc9-b32d-4d67-8e89-d11f43a2a0d5', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-01 23:15:50.883681+00', ''),
	('00000000-0000-0000-0000-000000000000', '3dfe9750-1223-417f-a92e-46b180d2cffd', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-01 23:15:50.899447+00', ''),
	('00000000-0000-0000-0000-000000000000', '75a4963a-9bf5-4034-98e7-cfa4aeea0df1', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-02 17:12:37.982457+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e208541d-2b3d-41b6-95df-2b7a8a886ed6', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-02 17:12:37.999396+00', ''),
	('00000000-0000-0000-0000-000000000000', '452ca1af-2520-4941-a782-87db80e802d2', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-02 22:05:21.360602+00', ''),
	('00000000-0000-0000-0000-000000000000', '14a6edf7-d136-45db-a82c-e2f98693a53d', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-02 22:05:21.374709+00', ''),
	('00000000-0000-0000-0000-000000000000', '9d0da440-b370-4c0f-ac4d-2b5e523eb611', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-02 23:31:49.700905+00', ''),
	('00000000-0000-0000-0000-000000000000', '0373eef3-a33f-4213-b4c9-079e498d1fd0', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-02 23:31:49.719688+00', ''),
	('00000000-0000-0000-0000-000000000000', '2fec6e92-3a64-4662-90eb-40625229ce26', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-03 00:53:06.868697+00', ''),
	('00000000-0000-0000-0000-000000000000', '99cd621d-43eb-4444-87a8-cb9606f5d434', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-03 00:53:06.884468+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c93e2fb6-6f70-4740-b2fc-a08d43d697c0', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-03 03:45:31.946027+00', ''),
	('00000000-0000-0000-0000-000000000000', '1acdf109-40a9-4c95-b434-04d9f78be768', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-03 03:45:31.960925+00', ''),
	('00000000-0000-0000-0000-000000000000', 'de37af91-d511-48b3-8069-0bcfa0d17241', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-03 09:35:14.582748+00', ''),
	('00000000-0000-0000-0000-000000000000', '5e32c804-55d7-41ef-8fb6-f12a2202a70e', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-03 09:35:14.596772+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ce54a3e3-0847-4d84-b5bc-c97e85e0fbb2', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-03 09:49:34.751398+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ca3b4881-0893-4bde-90b9-7f9e3af1acfe', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-03 10:55:32.30944+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a30d4d19-b0f2-4390-8e42-5de6b7dfb70e', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-03 10:55:32.320939+00', ''),
	('00000000-0000-0000-0000-000000000000', '46458b30-ec9f-4008-9ae9-3a25e805491d', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-03 11:18:30.828609+00', ''),
	('00000000-0000-0000-0000-000000000000', '88610851-2ae2-4d1d-841f-75bfe2cabba1', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-03 11:18:30.840715+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c1beaee2-5150-49a7-b254-ed203efa25eb', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-03 11:36:33.900062+00', ''),
	('00000000-0000-0000-0000-000000000000', '3f455c59-8abd-47a6-8040-8fa5f9f9e80e', '{"action":"token_refreshed","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-03 11:51:26.513425+00', ''),
	('00000000-0000-0000-0000-000000000000', '233651f8-6df4-498a-8392-3867f7fc4e55', '{"action":"token_revoked","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-03 11:51:26.521826+00', ''),
	('00000000-0000-0000-0000-000000000000', '0b584e51-b292-4eae-ae9c-4398528df96b', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-03 12:49:29.67468+00', ''),
	('00000000-0000-0000-0000-000000000000', '3a74b753-46b2-42cd-a07a-518f504a45ea', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-03 12:49:29.690393+00', ''),
	('00000000-0000-0000-0000-000000000000', '2475956b-58c9-495b-b32b-986b261c851e', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-03 13:05:59.762809+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f035aa6c-f4c3-4caa-84ae-b2b1214b48d2', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-03 13:05:59.773416+00', ''),
	('00000000-0000-0000-0000-000000000000', '25bd157a-8961-492d-bd8a-cbc1f916ac37', '{"action":"logout","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account"}', '2025-11-03 13:07:23.51165+00', ''),
	('00000000-0000-0000-0000-000000000000', '7ee76634-6e33-4079-bbe1-16a38ae35102', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-03 13:07:38.813299+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd6d80643-67c0-4277-8189-c6f76e33be05', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-03 14:03:46.7799+00', ''),
	('00000000-0000-0000-0000-000000000000', '0b79df18-501c-438e-b465-d3c56e068ace', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-03 14:49:22.395873+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f5c36be0-219f-481d-a243-85247158de4e', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-03 14:49:22.409774+00', ''),
	('00000000-0000-0000-0000-000000000000', '241e0124-e829-4934-937f-1dc55b9d657a', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-03 15:54:00.323885+00', ''),
	('00000000-0000-0000-0000-000000000000', '872a942b-94fb-4671-9e6c-e9ac1828028f', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-03 15:54:00.339246+00', ''),
	('00000000-0000-0000-0000-000000000000', '914578e7-c6ae-4cc4-a36c-bbfe1202a281', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-03 17:02:13.545076+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ddc8f0af-5b4f-49e3-a9a8-0baac297ce28', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-03 17:02:13.557611+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e9ef932c-b29b-4665-a918-26bc2023e2b9', '{"action":"logout","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account"}', '2025-11-03 17:02:28.394212+00', ''),
	('00000000-0000-0000-0000-000000000000', '94554549-ae21-4ce7-98fe-3e06a19c4221', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-03 17:02:44.344252+00', ''),
	('00000000-0000-0000-0000-000000000000', '1d707f29-c5a4-4a20-bfb2-9992be123744', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-03 17:33:29.894053+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a066089d-514e-4636-a4e6-573a06690044', '{"action":"logout","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account"}', '2025-11-03 17:41:18.238302+00', ''),
	('00000000-0000-0000-0000-000000000000', '6d39adae-ac23-4d28-b845-46ebfa4d140a', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-03 17:41:34.912597+00', ''),
	('00000000-0000-0000-0000-000000000000', '05ce0256-c887-4c28-9b50-2baaddc6ea7c', '{"action":"logout","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account"}', '2025-11-03 17:42:03.87545+00', ''),
	('00000000-0000-0000-0000-000000000000', '3a3b57ce-5ed4-4459-b354-5e5b428d088b', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-03 17:42:17.097841+00', ''),
	('00000000-0000-0000-0000-000000000000', '0f2c8d6f-3a45-4cc4-ba2c-0890ba8bad9f', '{"action":"token_refreshed","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-03 18:07:22.450406+00', ''),
	('00000000-0000-0000-0000-000000000000', '063fbabb-a024-4662-9f1d-8556cc1c8fa4', '{"action":"token_revoked","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-03 18:07:22.467576+00', ''),
	('00000000-0000-0000-0000-000000000000', '709dd479-06b4-45f8-89a9-b6dfa75c9201', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-03 21:57:06.237255+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bd08ba4c-1be1-4676-898c-5174d6cdae7a', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-03 22:38:36.856108+00', ''),
	('00000000-0000-0000-0000-000000000000', '7092e17c-2e62-4f3e-af5e-b591b3bc920e', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-03 22:38:36.866016+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a7ace48b-349f-4872-b25d-28a5d70a3d87', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-04 00:42:15.985833+00', ''),
	('00000000-0000-0000-0000-000000000000', '0dac9d71-121e-41e0-9021-4aa1dc542593', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-04 00:42:16.003372+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bbe689a9-b9ce-4ef9-b1fc-3a576f81e113', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-04 01:40:30.204805+00', ''),
	('00000000-0000-0000-0000-000000000000', '0ad3a8fd-c166-46cb-ba52-26e5e1815a24', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-04 01:40:30.217353+00', ''),
	('00000000-0000-0000-0000-000000000000', '3d0ca275-dc73-4806-bfaa-5391d84e80a2', '{"action":"token_refreshed","actor_id":"7c263c3e-11b2-468e-a74d-98910c429842","actor_username":"aledip06@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-11-04 09:16:22.359524+00', ''),
	('00000000-0000-0000-0000-000000000000', '76687d76-cabb-4398-aa5f-8e921dbddfa5', '{"action":"token_revoked","actor_id":"7c263c3e-11b2-468e-a74d-98910c429842","actor_username":"aledip06@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-11-04 09:16:22.380814+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f7e98758-bd78-4e21-9d38-1fd44fefe974', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-04 16:18:20.534214+00', ''),
	('00000000-0000-0000-0000-000000000000', '9eab5f73-115b-4136-ab9f-457f70deb700', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-04 16:18:20.551782+00', ''),
	('00000000-0000-0000-0000-000000000000', '00a9ed9f-4534-45f8-9825-b76c153b2a1b', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-04 17:32:02.990753+00', ''),
	('00000000-0000-0000-0000-000000000000', '75e48cca-60d6-4a96-9447-6589a7673dfc', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-04 17:32:03.007512+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd9f54d10-714b-4bfe-8ceb-97cede9a525b', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-04 18:31:56.677711+00', ''),
	('00000000-0000-0000-0000-000000000000', 'daa92fb5-19b0-45b2-a3c8-ec736dcbd0fc', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-04 18:31:56.691458+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd980666a-8c66-43ab-891d-d81e4d13766e', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-04 19:31:11.847707+00', ''),
	('00000000-0000-0000-0000-000000000000', '7dcf7151-5132-4805-a122-0b5d28e89b12', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-04 19:31:11.862178+00', ''),
	('00000000-0000-0000-0000-000000000000', '6e4612d2-dfc3-46d0-972e-7116d419c108', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-04 20:39:54.357727+00', ''),
	('00000000-0000-0000-0000-000000000000', '40d76a1d-3726-41f0-b452-b32cdbdfb1b7', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-04 20:39:54.369997+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ed4ed638-6254-44db-9561-193d6915ef0d', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-04 21:39:00.264924+00', ''),
	('00000000-0000-0000-0000-000000000000', '2525c5d4-5d15-4bef-b06e-b38d41acd4ab', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-04 21:39:00.28015+00', ''),
	('00000000-0000-0000-0000-000000000000', '9464d820-af7f-48a1-903b-5274a6305d0a', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-04 21:40:47.259357+00', ''),
	('00000000-0000-0000-0000-000000000000', 'abebcd05-52a2-45eb-bab9-fa0dffb9433a', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-04 21:40:47.278365+00', ''),
	('00000000-0000-0000-0000-000000000000', '9ef9a376-0f61-46c3-8885-fab7c7cfacdb', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-04 22:49:17.229478+00', ''),
	('00000000-0000-0000-0000-000000000000', '315525d8-4f4f-4e2d-bce8-2c44e521b854', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-04 22:49:17.244648+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd89ded09-4f43-446c-a7d2-f73cf7f58ee8', '{"action":"token_refreshed","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-05 09:06:51.622866+00', ''),
	('00000000-0000-0000-0000-000000000000', '8da78c4d-366f-4453-b14b-7da071867a03', '{"action":"token_revoked","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-05 09:06:51.634824+00', ''),
	('00000000-0000-0000-0000-000000000000', '95e09f7e-3e22-4cc0-bd55-78c692b43dae', '{"action":"token_refreshed","actor_id":"7c263c3e-11b2-468e-a74d-98910c429842","actor_username":"aledip06@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-11-05 09:47:22.044237+00', ''),
	('00000000-0000-0000-0000-000000000000', '633ec469-3377-4530-9b1f-82666da88353', '{"action":"token_revoked","actor_id":"7c263c3e-11b2-468e-a74d-98910c429842","actor_username":"aledip06@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-11-05 09:47:22.057624+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a0760880-4796-494b-b151-56d6bfcb6c96', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-05 13:28:26.13507+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd3badc39-23a4-46ca-8a6b-6eb2fca5a2d7', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-05 13:28:26.154781+00', ''),
	('00000000-0000-0000-0000-000000000000', '0d26df45-9117-4b23-93fc-32faec0c150c', '{"action":"token_refreshed","actor_id":"b0dfdcee-ff52-4efd-9ed5-6452f98945fe","actor_username":"pinatolaura@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-11-05 18:01:26.310981+00', ''),
	('00000000-0000-0000-0000-000000000000', '4713a9bc-4be3-4edd-9507-479c0315809b', '{"action":"token_revoked","actor_id":"b0dfdcee-ff52-4efd-9ed5-6452f98945fe","actor_username":"pinatolaura@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-11-05 18:01:26.322925+00', ''),
	('00000000-0000-0000-0000-000000000000', '180baf69-9577-4cd3-9925-b29a39d8e0e4', '{"action":"login","actor_id":"b0dfdcee-ff52-4efd-9ed5-6452f98945fe","actor_username":"pinatolaura@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-05 18:02:02.448992+00', ''),
	('00000000-0000-0000-0000-000000000000', '73399677-b1ab-4569-97bb-a9a9106b717f', '{"action":"token_refreshed","actor_id":"b0dfdcee-ff52-4efd-9ed5-6452f98945fe","actor_username":"pinatolaura@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-11-05 19:41:34.81943+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ea85cf03-c9d2-49a9-899b-5e82418f05b3', '{"action":"token_revoked","actor_id":"b0dfdcee-ff52-4efd-9ed5-6452f98945fe","actor_username":"pinatolaura@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-11-05 19:41:34.835945+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c1936bd2-8863-4616-9813-f17628b5c46c', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-05 22:12:02.395515+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd83a5fb8-ec64-449c-82b4-b923b24e1509', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-05 22:12:02.411162+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b41d1f9c-906c-4368-8f80-90b9ab885c5c', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-06 22:06:26.729262+00', ''),
	('00000000-0000-0000-0000-000000000000', 'dd7c28f1-61b1-4876-8e93-c7aed22f93af', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-06 22:06:26.745954+00', ''),
	('00000000-0000-0000-0000-000000000000', 'eb54aa57-67fe-4d79-94fd-f3bfa652a83c', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-07 12:19:35.10762+00', ''),
	('00000000-0000-0000-0000-000000000000', '847d4742-500b-4e3a-8af7-26c85e1ff133', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-07 12:19:35.128608+00', ''),
	('00000000-0000-0000-0000-000000000000', '0579057f-ce29-440d-9e6d-6329e53a4470', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-07 16:19:01.253438+00', ''),
	('00000000-0000-0000-0000-000000000000', '2c7b813e-0c81-4544-aed6-57bf4de46e2c', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-07 16:19:01.266727+00', ''),
	('00000000-0000-0000-0000-000000000000', '73be1f15-03df-42c5-9c47-4fb109b3c59d', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-07 23:07:35.840297+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c8facd51-f4b3-48a4-9090-eb8605280009', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-07 23:07:35.856286+00', ''),
	('00000000-0000-0000-0000-000000000000', '611df42d-ccce-4ad1-ae92-e845db71fb58', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-08 11:23:10.090221+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a54509db-def5-4e61-a731-40c91e015fcb', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-08 11:23:10.104149+00', ''),
	('00000000-0000-0000-0000-000000000000', '466b8b79-d103-4e1f-b295-1f1920546dae', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-08 12:21:18.877224+00', ''),
	('00000000-0000-0000-0000-000000000000', '6a8d25c1-d98e-4c65-9535-56e7911e667a', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-08 12:21:18.890964+00', ''),
	('00000000-0000-0000-0000-000000000000', '4e8ec9d1-7c86-4841-b62c-e1c81af4c4d1', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-08 13:06:59.085337+00', ''),
	('00000000-0000-0000-0000-000000000000', '173aa8af-03ea-49d5-960d-c39c892e2bd6', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-08 13:56:52.2267+00', ''),
	('00000000-0000-0000-0000-000000000000', '24561f5c-153b-4628-9c5d-bebfc076bad9', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-08 13:56:52.240667+00', ''),
	('00000000-0000-0000-0000-000000000000', '6031e566-a64c-4570-8139-66021ce7229a', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-08 14:05:37.549449+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cead9c41-f5f1-4dd9-8fd6-b988c3ead91e', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-08 14:05:37.564646+00', ''),
	('00000000-0000-0000-0000-000000000000', '819bd2ed-f1a2-426c-8554-9af63a4d6036', '{"action":"logout","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account"}', '2025-11-08 14:05:58.638326+00', ''),
	('00000000-0000-0000-0000-000000000000', '2876c0ff-d024-439e-bb00-696873bbbf78', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-08 14:06:17.73687+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fcbfc7dd-627b-4b51-a88e-ee67153898b2', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-08 14:07:14.787506+00', ''),
	('00000000-0000-0000-0000-000000000000', '5daf502e-9433-47f8-bb3b-2df798989ebb', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-08 14:08:51.905283+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f86d2807-5963-4dda-83af-636bc341cfe1', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-08 14:25:30.812675+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c255cdac-9bf1-477b-99eb-d345a3ed7eb7', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-08 16:02:25.464214+00', ''),
	('00000000-0000-0000-0000-000000000000', '4e3304c6-4998-4ea2-9d3d-d05e4f8890aa', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-08 16:02:25.476629+00', ''),
	('00000000-0000-0000-0000-000000000000', '8fc0aad3-8dd8-4def-ac16-b023c2a52d61', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-08 22:07:16.275749+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c9a3bdab-49fd-45c9-9a56-6bd8a6467cd1', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-08 22:07:16.289605+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cb4dd7a6-1dc4-42a3-9554-9b7d7d46b5b2', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-09 22:07:49.926514+00', ''),
	('00000000-0000-0000-0000-000000000000', '8d65f39b-47de-4da2-9c7a-556872d086f2', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-09 22:07:49.944195+00', ''),
	('00000000-0000-0000-0000-000000000000', '9f01a5b8-4a2e-4e15-8143-f45dc1d3e627', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-09 23:17:59.615031+00', ''),
	('00000000-0000-0000-0000-000000000000', '493f6485-3224-47ad-a625-27da1d2f3ef4', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-09 23:17:59.638238+00', ''),
	('00000000-0000-0000-0000-000000000000', '19906903-276a-4c8d-9f4b-881e8adb0a4b', '{"action":"logout","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account"}', '2025-11-10 00:10:01.844855+00', ''),
	('00000000-0000-0000-0000-000000000000', '1232a3f8-efb1-4e19-a74b-0e4dededc13d', '{"action":"user_repeated_signup","actor_id":"328e27ad-6352-4198-b173-370bd705950b","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-11-10 00:11:09.68645+00', ''),
	('00000000-0000-0000-0000-000000000000', '0f34f3a3-f45e-4876-8ff2-e3322413b911', '{"action":"user_confirmation_requested","actor_id":"84745966-e0a2-4394-af07-b9173f766c03","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-11-10 00:12:49.015257+00', ''),
	('00000000-0000-0000-0000-000000000000', '4703939a-0324-4c02-8c03-ee6a2e0bc2d5', '{"action":"user_signedup","actor_id":"84745966-e0a2-4394-af07-b9173f766c03","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}', '2025-11-10 00:13:46.733799+00', ''),
	('00000000-0000-0000-0000-000000000000', '698b06c1-805b-4290-b9e3-130841a68fd6', '{"action":"login","actor_id":"84745966-e0a2-4394-af07-b9173f766c03","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-10 00:13:51.811264+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c8c491bd-3925-420d-a6bd-af6c9a949c24', '{"action":"logout","actor_id":"84745966-e0a2-4394-af07-b9173f766c03","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-11-10 00:20:33.007741+00', ''),
	('00000000-0000-0000-0000-000000000000', '3ff0200d-929d-42ce-a9bf-b4a2be7828ef', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-10 00:20:52.45581+00', ''),
	('00000000-0000-0000-0000-000000000000', '5d2ac405-0666-4fd0-98be-e85dc25cb12e', '{"action":"logout","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account"}', '2025-11-10 00:23:21.433131+00', ''),
	('00000000-0000-0000-0000-000000000000', '95ce0d2d-3819-48f9-8ae4-13af729b88c1', '{"action":"login","actor_id":"84745966-e0a2-4394-af07-b9173f766c03","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-10 00:25:00.922961+00', ''),
	('00000000-0000-0000-0000-000000000000', '84d007af-ddb9-4c19-afbc-31127cba01d9', '{"action":"login","actor_id":"84745966-e0a2-4394-af07-b9173f766c03","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-10 00:35:26.998255+00', ''),
	('00000000-0000-0000-0000-000000000000', '41b0ebaf-7cb1-4b90-8a83-96747244efb3', '{"action":"login","actor_id":"84745966-e0a2-4394-af07-b9173f766c03","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-10 00:36:14.691931+00', ''),
	('00000000-0000-0000-0000-000000000000', '425a915a-2894-4245-889e-9d556c6a864c', '{"action":"login","actor_id":"84745966-e0a2-4394-af07-b9173f766c03","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-10 00:40:39.05706+00', ''),
	('00000000-0000-0000-0000-000000000000', '1c2c83fa-319c-4148-b492-c16a29a6f8ca', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"theloyalvice@gmail.com","user_id":"84745966-e0a2-4394-af07-b9173f766c03","user_phone":""}}', '2025-11-10 00:40:40.661736+00', ''),
	('00000000-0000-0000-0000-000000000000', '7b79902a-5fbd-407e-b1ac-64fa5e4352b5', '{"action":"user_confirmation_requested","actor_id":"843503b8-40ab-41d3-9438-3f4085257ea2","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-11-10 01:25:11.411473+00', ''),
	('00000000-0000-0000-0000-000000000000', 'dbdbb74c-acfa-4277-9bb1-927a32a22f23', '{"action":"user_signedup","actor_id":"843503b8-40ab-41d3-9438-3f4085257ea2","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}', '2025-11-10 01:25:34.247137+00', ''),
	('00000000-0000-0000-0000-000000000000', '430e7e01-fd2d-426b-921e-96f57463ef1b', '{"action":"login","actor_id":"843503b8-40ab-41d3-9438-3f4085257ea2","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-10 01:25:39.758862+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd2d043ae-685e-4f5b-9fe0-63ddf6164c36', '{"action":"token_refreshed","actor_id":"843503b8-40ab-41d3-9438-3f4085257ea2","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-11-10 11:31:30.31189+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f6759c49-b93c-4e70-8b48-095105a0c34f', '{"action":"token_revoked","actor_id":"843503b8-40ab-41d3-9438-3f4085257ea2","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-11-10 11:31:30.325413+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e7bba580-2dc8-4e87-8032-b99c296c1dd9', '{"action":"login","actor_id":"843503b8-40ab-41d3-9438-3f4085257ea2","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-10 11:32:32.342063+00', ''),
	('00000000-0000-0000-0000-000000000000', '28ec36cf-7e35-4b9d-823a-c78feed180d9', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-18 18:48:53.054358+00', ''),
	('00000000-0000-0000-0000-000000000000', '4fe4254e-b52e-41a7-b2f6-6984b9122a64', '{"action":"token_refreshed","actor_id":"843503b8-40ab-41d3-9438-3f4085257ea2","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-11-10 12:41:28.086146+00', ''),
	('00000000-0000-0000-0000-000000000000', '14515808-8c28-4685-b644-ed0ee2b495cf', '{"action":"token_revoked","actor_id":"843503b8-40ab-41d3-9438-3f4085257ea2","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-11-10 12:41:28.102035+00', ''),
	('00000000-0000-0000-0000-000000000000', '71ec6172-5c75-42a3-b2bf-90b63925567f', '{"action":"login","actor_id":"843503b8-40ab-41d3-9438-3f4085257ea2","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-10 12:45:57.369894+00', ''),
	('00000000-0000-0000-0000-000000000000', '7c8dbd89-7fe3-4e08-94a0-eb31bca63824', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"theloyalvice@gmail.com","user_id":"843503b8-40ab-41d3-9438-3f4085257ea2","user_phone":""}}', '2025-11-10 12:45:59.315199+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e23a31be-d6da-48a2-aafc-4c3e14191f1c', '{"action":"user_confirmation_requested","actor_id":"5f994f3f-9422-4725-94a8-1e9ee89a3666","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-11-10 12:51:59.048709+00', ''),
	('00000000-0000-0000-0000-000000000000', '0286d9f5-f2e6-46c8-b8d9-43c219263e4e', '{"action":"user_signedup","actor_id":"5f994f3f-9422-4725-94a8-1e9ee89a3666","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}', '2025-11-10 12:53:19.288218+00', ''),
	('00000000-0000-0000-0000-000000000000', '96eb21b2-184e-4cd0-a220-cfbbcbd51f94', '{"action":"login","actor_id":"5f994f3f-9422-4725-94a8-1e9ee89a3666","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-10 12:53:23.502751+00', ''),
	('00000000-0000-0000-0000-000000000000', '397b4073-2c52-408d-af7c-cad0d9dc2550', '{"action":"login","actor_id":"5f994f3f-9422-4725-94a8-1e9ee89a3666","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-10 12:54:34.85743+00', ''),
	('00000000-0000-0000-0000-000000000000', '73160db2-fe7a-42a2-8c5a-9046bd89def0', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"theloyalvice@gmail.com","user_id":"5f994f3f-9422-4725-94a8-1e9ee89a3666","user_phone":""}}', '2025-11-10 12:54:35.602604+00', ''),
	('00000000-0000-0000-0000-000000000000', '35791509-058e-4961-92e3-1461838c190f', '{"action":"user_confirmation_requested","actor_id":"5fff5d62-975c-4603-a2f5-aeef63a914b2","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-11-10 12:59:21.104279+00', ''),
	('00000000-0000-0000-0000-000000000000', '49d01b72-991e-45a5-9adc-34ae0abbf640', '{"action":"user_signedup","actor_id":"5fff5d62-975c-4603-a2f5-aeef63a914b2","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}', '2025-11-10 13:02:04.928635+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e3817979-4c1c-4a5b-9bff-64f745d68bbf', '{"action":"login","actor_id":"5fff5d62-975c-4603-a2f5-aeef63a914b2","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-10 13:02:08.039898+00', ''),
	('00000000-0000-0000-0000-000000000000', '27af8b82-25cb-4717-9b9a-aa3087f9b718', '{"action":"login","actor_id":"5fff5d62-975c-4603-a2f5-aeef63a914b2","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-10 13:02:39.253957+00', ''),
	('00000000-0000-0000-0000-000000000000', '752a9719-66f2-4760-bbea-fc368dcce4fe', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-18 18:48:53.07436+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd56325ae-1fa3-453b-99e4-d1f3eaafa748', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"theloyalvice@gmail.com","user_id":"5fff5d62-975c-4603-a2f5-aeef63a914b2","user_phone":""}}', '2025-11-10 13:02:39.928695+00', ''),
	('00000000-0000-0000-0000-000000000000', '04f8bd4a-77ed-4c41-9f8c-e8ab8a43b630', '{"action":"user_confirmation_requested","actor_id":"c3239605-d3f7-4233-bcb0-1ec29908ace7","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-11-10 13:05:01.153561+00', ''),
	('00000000-0000-0000-0000-000000000000', '69867a7b-0600-40d4-bb1d-0be719586d7e', '{"action":"user_signedup","actor_id":"c3239605-d3f7-4233-bcb0-1ec29908ace7","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}', '2025-11-10 13:05:08.708652+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd3a83c04-b123-4bcb-bf35-0aab9ab38cab', '{"action":"login","actor_id":"c3239605-d3f7-4233-bcb0-1ec29908ace7","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-10 13:05:11.201153+00', ''),
	('00000000-0000-0000-0000-000000000000', '61d93ffb-887b-40fe-ae9a-01cf3b63345c', '{"action":"login","actor_id":"c3239605-d3f7-4233-bcb0-1ec29908ace7","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-10 13:05:47.512657+00', ''),
	('00000000-0000-0000-0000-000000000000', '0abc8f36-ce01-427d-b179-1952fad1c45d', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"theloyalvice@gmail.com","user_id":"c3239605-d3f7-4233-bcb0-1ec29908ace7","user_phone":""}}', '2025-11-10 13:05:48.176902+00', ''),
	('00000000-0000-0000-0000-000000000000', '5869dffc-b61b-4869-ad24-ac14b86418f3', '{"action":"user_confirmation_requested","actor_id":"5455afe7-9078-454e-9943-7b20309b25bd","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-11-10 13:07:22.603346+00', ''),
	('00000000-0000-0000-0000-000000000000', '8d3702d3-b593-4201-a244-2c4f4e830669', '{"action":"user_signedup","actor_id":"5455afe7-9078-454e-9943-7b20309b25bd","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}', '2025-11-10 13:07:30.122144+00', ''),
	('00000000-0000-0000-0000-000000000000', '06c547fd-3710-4c75-8b31-3b0b37fe196c', '{"action":"login","actor_id":"5455afe7-9078-454e-9943-7b20309b25bd","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-10 13:07:32.593591+00', ''),
	('00000000-0000-0000-0000-000000000000', '1d47ecd4-4af9-4050-827d-ce4530f2d201', '{"action":"login","actor_id":"5455afe7-9078-454e-9943-7b20309b25bd","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-10 13:08:17.349516+00', ''),
	('00000000-0000-0000-0000-000000000000', '646026f6-cda8-4c92-ac0d-ebc5ad866ccb', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"theloyalvice@gmail.com","user_id":"5455afe7-9078-454e-9943-7b20309b25bd","user_phone":""}}', '2025-11-10 13:08:18.105955+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ad6d7881-98d7-4a36-b7d8-b3dfbb64a1c5', '{"action":"user_confirmation_requested","actor_id":"d2dc5b36-0220-4307-9e33-e161c31f8131","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-11-10 13:25:18.727841+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c898435a-b3ae-449a-acd7-56bb4bf926e7', '{"action":"user_signedup","actor_id":"d2dc5b36-0220-4307-9e33-e161c31f8131","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}', '2025-11-10 13:25:38.987943+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd560fb2b-eb89-480c-9eda-6a95a7c0d2b7', '{"action":"login","actor_id":"d2dc5b36-0220-4307-9e33-e161c31f8131","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-10 13:25:44.896719+00', ''),
	('00000000-0000-0000-0000-000000000000', '669e4d3e-2f63-4cf2-a8ab-7b3b79b9029e', '{"action":"login","actor_id":"d2dc5b36-0220-4307-9e33-e161c31f8131","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-10 13:27:04.766614+00', ''),
	('00000000-0000-0000-0000-000000000000', '2c5e854b-eb3d-4f18-a18e-dd1b69093230', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"theloyalvice@gmail.com","user_id":"d2dc5b36-0220-4307-9e33-e161c31f8131","user_phone":""}}', '2025-11-10 13:27:05.500385+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b1eda617-8e26-46ef-9be3-cc9862109809', '{"action":"user_confirmation_requested","actor_id":"9265c173-160d-406b-bc9e-398ab58de461","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-11-10 13:32:50.140843+00', ''),
	('00000000-0000-0000-0000-000000000000', '7cf7cf73-69d0-4d11-a9ec-41d0d8666b69', '{"action":"user_signedup","actor_id":"9265c173-160d-406b-bc9e-398ab58de461","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}', '2025-11-10 13:33:29.969467+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e82ff2a6-42cc-4b06-b2f2-f7f30207701b', '{"action":"login","actor_id":"9265c173-160d-406b-bc9e-398ab58de461","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-10 13:33:37.449455+00', ''),
	('00000000-0000-0000-0000-000000000000', '97e01182-b36c-4af2-ad08-8c5b58ae8e1f', '{"action":"login","actor_id":"9265c173-160d-406b-bc9e-398ab58de461","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-10 13:34:41.98283+00', ''),
	('00000000-0000-0000-0000-000000000000', 'babe5c3a-e1ab-4914-895f-6967da6de9f6', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"theloyalvice@gmail.com","user_id":"9265c173-160d-406b-bc9e-398ab58de461","user_phone":""}}', '2025-11-10 13:34:42.749177+00', ''),
	('00000000-0000-0000-0000-000000000000', '9cc026ac-6bbf-435e-a1f5-c417cbe4c9bb', '{"action":"user_confirmation_requested","actor_id":"9deea0d7-0929-43ee-bb24-94cea89a8a84","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-11-10 13:51:58.742213+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b421f5e1-3843-47e4-ba60-5272401fdb05', '{"action":"user_signedup","actor_id":"9deea0d7-0929-43ee-bb24-94cea89a8a84","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}', '2025-11-10 13:52:07.420075+00', ''),
	('00000000-0000-0000-0000-000000000000', '7fc720bf-748b-4aed-a414-eb8f80d76266', '{"action":"login","actor_id":"9deea0d7-0929-43ee-bb24-94cea89a8a84","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-10 13:52:15.628664+00', ''),
	('00000000-0000-0000-0000-000000000000', '03edfc18-6083-47ac-b723-ee95723ffaf4', '{"action":"login","actor_id":"9deea0d7-0929-43ee-bb24-94cea89a8a84","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-10 13:53:44.197645+00', ''),
	('00000000-0000-0000-0000-000000000000', '9f9eb71c-a8da-4b80-8324-bf00fb1fda70', '{"action":"login","actor_id":"9deea0d7-0929-43ee-bb24-94cea89a8a84","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-10 13:56:13.427257+00', ''),
	('00000000-0000-0000-0000-000000000000', 'da230c5b-48a9-47d5-b431-9b03d743240e', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"theloyalvice@gmail.com","user_id":"9deea0d7-0929-43ee-bb24-94cea89a8a84","user_phone":""}}', '2025-11-10 13:56:14.288248+00', ''),
	('00000000-0000-0000-0000-000000000000', '2dca9ec3-086e-4a17-a9d9-6888e7728ced', '{"action":"user_confirmation_requested","actor_id":"03ed0a52-3a9e-4158-b394-332a856f96ad","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-11-10 14:07:42.674433+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a0f9c416-39bb-4a0b-b60a-9f133c69aa92', '{"action":"user_signedup","actor_id":"03ed0a52-3a9e-4158-b394-332a856f96ad","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}', '2025-11-10 14:07:56.970513+00', ''),
	('00000000-0000-0000-0000-000000000000', '2243ae57-182e-415b-bcb3-58fedb1038ff', '{"action":"login","actor_id":"03ed0a52-3a9e-4158-b394-332a856f96ad","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-10 14:07:59.940946+00', ''),
	('00000000-0000-0000-0000-000000000000', '4ed7de27-8489-42cc-bc60-7076b92adb76', '{"action":"login","actor_id":"03ed0a52-3a9e-4158-b394-332a856f96ad","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-10 14:08:37.452721+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bc7d111c-aa1f-4e5c-bb67-6ac9c6b278b2', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"theloyalvice@gmail.com","user_id":"03ed0a52-3a9e-4158-b394-332a856f96ad","user_phone":""}}', '2025-11-10 14:08:38.281148+00', ''),
	('00000000-0000-0000-0000-000000000000', '4c4f6fd8-6703-470d-b9b0-fab27fbc52f5', '{"action":"user_confirmation_requested","actor_id":"77161568-d6bd-465a-b0df-903ef7d2d0f4","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-11-10 14:10:36.563503+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ec30f759-fbfb-4b08-9f1b-243c57018412', '{"action":"user_signedup","actor_id":"77161568-d6bd-465a-b0df-903ef7d2d0f4","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}', '2025-11-10 14:10:51.722681+00', ''),
	('00000000-0000-0000-0000-000000000000', '1c4e06e6-1438-4804-b904-cbdb7eaf6d99', '{"action":"login","actor_id":"77161568-d6bd-465a-b0df-903ef7d2d0f4","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-10 14:10:58.153993+00', ''),
	('00000000-0000-0000-0000-000000000000', '45b33ccd-9d8d-45b9-a43f-c6cd2137df97', '{"action":"login","actor_id":"77161568-d6bd-465a-b0df-903ef7d2d0f4","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-10 14:11:27.522687+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b5c01679-c183-4969-a4f2-167d592abe96', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"theloyalvice@gmail.com","user_id":"77161568-d6bd-465a-b0df-903ef7d2d0f4","user_phone":""}}', '2025-11-10 14:11:28.485738+00', ''),
	('00000000-0000-0000-0000-000000000000', '7f756c4a-7a1d-4b01-8748-583da37ef3e6', '{"action":"user_confirmation_requested","actor_id":"80b0837d-abcc-4892-a707-87103b571e0e","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-11-10 14:14:01.734753+00', ''),
	('00000000-0000-0000-0000-000000000000', '1970a115-b902-4783-9512-a9fbbb56b338', '{"action":"user_signedup","actor_id":"80b0837d-abcc-4892-a707-87103b571e0e","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}', '2025-11-10 14:14:10.474983+00', ''),
	('00000000-0000-0000-0000-000000000000', '9f53c8df-cf0f-4cbe-a223-557ee5903565', '{"action":"login","actor_id":"80b0837d-abcc-4892-a707-87103b571e0e","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-10 14:14:15.935098+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bc0ba515-69d6-47b1-b742-f58be2512834', '{"action":"login","actor_id":"80b0837d-abcc-4892-a707-87103b571e0e","actor_username":"theloyalvice@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-10 14:14:51.018243+00', ''),
	('00000000-0000-0000-0000-000000000000', '2352eadb-5680-437e-9040-e1d8a9b090cd', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"theloyalvice@gmail.com","user_id":"80b0837d-abcc-4892-a707-87103b571e0e","user_phone":""}}', '2025-11-10 14:14:59.232601+00', ''),
	('00000000-0000-0000-0000-000000000000', '13b0829f-4138-4a1c-8fd2-1ed514c814c2', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-10 16:12:31.067836+00', ''),
	('00000000-0000-0000-0000-000000000000', '925572fa-0426-4795-93f2-ba2a5ef354d0', '{"action":"logout","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account"}', '2025-11-10 16:52:16.921288+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd9601d46-ae2b-4387-9ed1-dd4646caba4c', '{"action":"user_recovery_requested","actor_id":"328e27ad-6352-4198-b173-370bd705950b","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"user"}', '2025-11-10 16:53:26.334984+00', ''),
	('00000000-0000-0000-0000-000000000000', 'dd347f34-5015-4d4b-b1bc-3506216a5145', '{"action":"user_recovery_requested","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"user"}', '2025-11-10 16:55:01.051956+00', ''),
	('00000000-0000-0000-0000-000000000000', '989a49c8-7898-4c33-8c7a-ea56187b182d', '{"action":"login","actor_id":"328e27ad-6352-4198-b173-370bd705950b","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-11-10 16:57:46.777274+00', ''),
	('00000000-0000-0000-0000-000000000000', '4d1e1eff-5184-4081-9cb5-a136c5cbc27e', '{"action":"user_recovery_requested","actor_id":"328e27ad-6352-4198-b173-370bd705950b","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"user"}', '2025-11-10 17:01:05.84681+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c5a209b6-8da7-403c-ae89-f4b7bc19a3bc', '{"action":"login","actor_id":"328e27ad-6352-4198-b173-370bd705950b","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-11-10 17:01:25.923637+00', ''),
	('00000000-0000-0000-0000-000000000000', '0f50460a-ee44-4b53-b02a-4f27397c7d81', '{"action":"user_recovery_requested","actor_id":"328e27ad-6352-4198-b173-370bd705950b","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"user"}', '2025-11-10 17:02:09.871218+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e319a05b-ef81-4e7f-ae1f-ce0ac7ca8bb9', '{"action":"login","actor_id":"328e27ad-6352-4198-b173-370bd705950b","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-11-10 17:02:23.613072+00', ''),
	('00000000-0000-0000-0000-000000000000', '98feb94d-e836-478f-b219-4ad48ebe93ff', '{"action":"logout","actor_id":"328e27ad-6352-4198-b173-370bd705950b","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-11-10 17:02:59.364782+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f12d9819-91b1-4105-ac7f-d4bf3dd1f03b', '{"action":"user_recovery_requested","actor_id":"328e27ad-6352-4198-b173-370bd705950b","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"user"}', '2025-11-10 17:03:53.830661+00', ''),
	('00000000-0000-0000-0000-000000000000', '227ec6f6-0cd2-49f9-af4d-cd12f16eb6c0', '{"action":"login","actor_id":"328e27ad-6352-4198-b173-370bd705950b","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-11-10 17:04:07.694228+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c86b0e52-b974-4757-8107-467dd2b57c66', '{"action":"user_updated_password","actor_id":"328e27ad-6352-4198-b173-370bd705950b","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"user"}', '2025-11-10 17:04:17.986527+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a94bb93c-e94b-4d4a-942f-d718e34c52b3', '{"action":"user_modified","actor_id":"328e27ad-6352-4198-b173-370bd705950b","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"user"}', '2025-11-10 17:04:17.988054+00', ''),
	('00000000-0000-0000-0000-000000000000', '79913b4e-f49f-4946-8fbe-a46d1b1a71fa', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-10 17:18:49.987895+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a0b337a7-747d-4f34-a553-b963402a5407', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-10 22:29:37.978197+00', ''),
	('00000000-0000-0000-0000-000000000000', '730a1517-a62a-4fee-bf6a-9d487b08d11d', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-11 15:57:28.917482+00', ''),
	('00000000-0000-0000-0000-000000000000', '3335b0fa-5e4d-40f1-ae7b-95fbe7c50d33', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-11 15:57:28.94198+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cba6163e-6cfc-4ccf-a562-91bc7cf717d6', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-11 16:59:41.597005+00', ''),
	('00000000-0000-0000-0000-000000000000', '7ef77a8b-e320-4999-b6d3-0fce882a6c90', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-11 16:59:41.617212+00', ''),
	('00000000-0000-0000-0000-000000000000', '0dbeb77c-7d05-4408-a3b5-9ef94c5622d3', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-11 17:29:15.194159+00', ''),
	('00000000-0000-0000-0000-000000000000', '2419175a-4e78-4283-9d4f-14d48453e4cb', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-11 17:29:15.20624+00', ''),
	('00000000-0000-0000-0000-000000000000', '6d5fe881-1ec6-4003-8fd9-f300919dfef9', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-11 17:32:32.675912+00', ''),
	('00000000-0000-0000-0000-000000000000', '187f685b-9ea7-4ef9-a5fd-8fb5be5a3d33', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-11 18:07:04.910388+00', ''),
	('00000000-0000-0000-0000-000000000000', '26609fee-52a6-4013-9bab-186dff4fa281', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-11 18:07:04.924347+00', ''),
	('00000000-0000-0000-0000-000000000000', '8cc44d67-aae9-4067-bb7d-af206bdfb212', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-11 21:30:30.793035+00', ''),
	('00000000-0000-0000-0000-000000000000', '349c6213-b27b-4ae1-ac2a-26776bcab26e', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-11 21:30:30.809474+00', ''),
	('00000000-0000-0000-0000-000000000000', '0178865c-a2ba-4f39-8dd4-7565bbe06967', '{"action":"logout","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account"}', '2025-11-11 22:01:27.544465+00', ''),
	('00000000-0000-0000-0000-000000000000', '8de201ca-86ef-4fa3-aed4-990a1440f706', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-11 22:01:39.93117+00', ''),
	('00000000-0000-0000-0000-000000000000', '850a9af9-3ade-4f4d-8207-f2d2162d7941', '{"action":"logout","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account"}', '2025-11-11 22:01:51.12269+00', ''),
	('00000000-0000-0000-0000-000000000000', '88491c3b-e291-46ea-aea4-ff82970300b7', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-11 22:02:10.077941+00', ''),
	('00000000-0000-0000-0000-000000000000', '82cfc4cf-5a9e-4f10-894b-8202ac507437', '{"action":"logout","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account"}', '2025-11-11 22:02:31.127357+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f9b1b5e6-3208-4bf4-81c2-86bb094dd4ca', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-11 22:02:42.995469+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a3464bc5-48e9-4bc7-9db1-9990defdc965', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-11 22:42:49.755953+00', ''),
	('00000000-0000-0000-0000-000000000000', '89545294-810e-4fd0-9911-5408819c24dd', '{"action":"logout","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account"}', '2025-11-11 22:44:10.206401+00', ''),
	('00000000-0000-0000-0000-000000000000', '2da216c2-2cd0-4562-9c71-a8ed744b1e70', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-11 22:44:27.106251+00', ''),
	('00000000-0000-0000-0000-000000000000', '12c1740b-25fd-463e-a92f-bbb2c7b6f588', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-12 11:44:04.368905+00', ''),
	('00000000-0000-0000-0000-000000000000', '999ccc92-139e-4e1d-8344-4e2de4a802f7', '{"action":"logout","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account"}', '2025-11-12 11:44:15.461465+00', ''),
	('00000000-0000-0000-0000-000000000000', '17f0f897-c3d0-4166-b8bc-9cc105668579', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-12 11:44:28.342215+00', ''),
	('00000000-0000-0000-0000-000000000000', '9c7fb166-963d-4db7-bbee-af2b4dfe6c48', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-12 13:47:58.766069+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fd967521-aa6a-4175-9983-ed4b260b5162', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-12 13:47:58.786154+00', ''),
	('00000000-0000-0000-0000-000000000000', '191215e6-4f20-4e48-9621-a8d387490c3f', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-12 14:51:26.047921+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b8cc0969-60cf-43e0-abc6-693d7adbd1f5', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-12 14:51:26.066713+00', ''),
	('00000000-0000-0000-0000-000000000000', 'da67dc64-377e-4dab-b11b-4dcd4724482e', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-12 14:58:05.264161+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fc9e0a5e-e797-4d59-8410-177857c2b8f6', '{"action":"logout","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account"}', '2025-11-12 15:01:00.551083+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a3a5db06-df57-48d1-93f9-38a9e2a53247', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-12 15:01:15.071555+00', ''),
	('00000000-0000-0000-0000-000000000000', '5f0b7727-ff02-4508-8bd8-b9cdb2ae3518', '{"action":"logout","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account"}', '2025-11-12 15:03:18.933356+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a587928b-9929-4184-95b2-0461230eadc1', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-12 15:03:35.597231+00', ''),
	('00000000-0000-0000-0000-000000000000', '7341b21a-16e8-4c9f-9f18-8e221117dd18', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-12 15:28:31.663303+00', ''),
	('00000000-0000-0000-0000-000000000000', '277fc709-f0de-497f-ac28-fc7c97a4f95d', '{"action":"logout","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account"}', '2025-11-12 15:31:17.168004+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fdcd855e-1f42-4132-9d9f-b544cad350f4', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-12 15:31:40.357081+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e002aa2e-0d31-411d-8673-a13b927486ed', '{"action":"logout","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account"}', '2025-11-12 15:39:19.641161+00', ''),
	('00000000-0000-0000-0000-000000000000', '4da3cd10-9caf-479d-afe3-f8d771ef148c', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-12 15:39:34.968725+00', ''),
	('00000000-0000-0000-0000-000000000000', '740089bf-1cd5-4d56-964a-7c9a33b19ff1', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-12 15:50:58.866636+00', ''),
	('00000000-0000-0000-0000-000000000000', '20cbce0b-1d85-4e66-9f41-adfc770ba4cc', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-12 16:18:36.488995+00', ''),
	('00000000-0000-0000-0000-000000000000', '0f55bfaf-9e02-46e2-b9a6-6a10862ef0df', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-12 16:20:24.599407+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e55b9ffb-552a-45cd-afb7-e8c24efcbedf', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-12 16:37:42.180295+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f4bdfcf3-032a-460f-9f3e-a7a7a2e12feb', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-12 16:37:52.785966+00', ''),
	('00000000-0000-0000-0000-000000000000', '206548f7-a9a3-4d94-bd15-a886d65c190d', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-12 16:37:52.790359+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e5e5b1e2-35c8-4789-9c26-16a2c1f60f50', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-12 16:49:49.160295+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a2bfc4ef-1af3-453c-a12c-c0c3ec9980b7', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-12 16:49:49.168756+00', ''),
	('00000000-0000-0000-0000-000000000000', '8c9101ee-dbc7-42bc-b4ac-fa06709e7860', '{"action":"logout","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account"}', '2025-11-12 17:09:10.333211+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fe2db907-13f0-44d5-aea4-8b4ed654e94c', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-12 17:09:27.612682+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a9423e10-3707-4c2c-96cd-fdc02185740d', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-12 17:35:16.653112+00', ''),
	('00000000-0000-0000-0000-000000000000', '511d9364-adf3-4c31-97c0-15144978d5cb', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-12 17:37:19.741917+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b203d313-2152-4d3b-a356-8f9960f56777', '{"action":"logout","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account"}', '2025-11-12 17:37:58.446224+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f9f11e2d-610c-4acf-8a67-a7b6705b73c0', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-12 17:38:15.192083+00', ''),
	('00000000-0000-0000-0000-000000000000', '9151fbdf-216e-4bda-acdc-02a4067e7361', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-12 17:39:25.427462+00', ''),
	('00000000-0000-0000-0000-000000000000', '6c0441de-c793-4e97-bc01-8dfa3b75d1ec', '{"action":"logout","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account"}', '2025-11-12 17:43:27.237942+00', ''),
	('00000000-0000-0000-0000-000000000000', '112c8761-3b4c-4a61-b438-484772918d8b', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-12 18:27:18.139396+00', ''),
	('00000000-0000-0000-0000-000000000000', '83e929a6-4751-4f9e-b7d6-0eaa0ac8d036', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-12 19:40:15.309099+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c6bcd90c-a2a9-43f2-bb83-ae3eaf71c6e6', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-12 20:13:36.508897+00', ''),
	('00000000-0000-0000-0000-000000000000', '4c45f248-9ae5-4159-8743-0b834ca37241', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-12 20:13:36.521592+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f0deb381-9d54-482d-b7a6-2dc0e67cc3d7', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-12 21:15:47.325738+00', ''),
	('00000000-0000-0000-0000-000000000000', '993adb60-8709-4f5c-81d9-2c77c422503c', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-12 21:15:47.342492+00', ''),
	('00000000-0000-0000-0000-000000000000', '149eade2-23d7-4b23-a09f-661569ef3892', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-12 21:29:11.229086+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd4e6371e-e4e8-40e1-8fc7-1e17884dd3fd', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-12 21:29:11.242668+00', ''),
	('00000000-0000-0000-0000-000000000000', '53af25b6-9d84-4499-a94d-3469dc669387', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-12 22:22:25.895912+00', ''),
	('00000000-0000-0000-0000-000000000000', '3c25ba57-9ce2-4c74-aa46-337e5f4d4bb2', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-12 22:22:25.914608+00', ''),
	('00000000-0000-0000-0000-000000000000', '811fe3dc-83c4-4f5d-a3e0-0f6db3c026d5', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-12 23:21:33.760214+00', ''),
	('00000000-0000-0000-0000-000000000000', '573fce4a-6a25-4cd0-a6fb-f81edd295020', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-12 23:21:33.777917+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd28a53f3-f043-48a3-ba99-0c7c00195565', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-13 00:27:42.854259+00', ''),
	('00000000-0000-0000-0000-000000000000', '81ad2c1e-1f3b-4092-9d80-27159b3e07b5', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-13 00:27:42.876517+00', ''),
	('00000000-0000-0000-0000-000000000000', '8673f130-b2f9-4850-a063-9ad5eb538641', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-13 10:32:08.293387+00', ''),
	('00000000-0000-0000-0000-000000000000', '0756425c-12ca-4f58-aaa0-da8ce421a8a1', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-13 10:32:08.312613+00', ''),
	('00000000-0000-0000-0000-000000000000', '4da66e2b-2db7-4b44-9dd6-41edb5ccad41', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-13 10:42:47.66546+00', ''),
	('00000000-0000-0000-0000-000000000000', '85dcfb89-079c-4946-afcb-5d51a599afe1', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-13 10:42:47.671137+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a46923be-ecf1-452d-bbac-e98c6a8e5cec', '{"action":"token_refreshed","actor_id":"328e27ad-6352-4198-b173-370bd705950b","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-11-13 10:46:50.001573+00', ''),
	('00000000-0000-0000-0000-000000000000', '1f9c1fbb-ff05-461e-bd4c-0ecdea541214', '{"action":"token_revoked","actor_id":"328e27ad-6352-4198-b173-370bd705950b","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-11-13 10:46:50.012448+00', ''),
	('00000000-0000-0000-0000-000000000000', '60a9d0c4-072f-4978-bc64-5eaf68e0f476', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-13 10:48:27.766401+00', ''),
	('00000000-0000-0000-0000-000000000000', '2a2018ee-bc5c-4472-a611-32ae54578351', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-13 10:54:06.444107+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd16ddb62-5bca-4110-a01a-7db337a9bc93', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-13 10:59:32.476737+00', ''),
	('00000000-0000-0000-0000-000000000000', '129e2e05-4b31-493c-a41b-3f43e393f904', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-13 11:00:55.924064+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b0203fe4-1a1e-490c-bc71-1a496e1d1618', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-13 12:20:47.535526+00', ''),
	('00000000-0000-0000-0000-000000000000', '1f3a4277-3fe7-456a-a087-ae47e4bf3995', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-13 12:20:47.547056+00', ''),
	('00000000-0000-0000-0000-000000000000', '03c8e23c-5427-4466-b2f0-895763da04d0', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-13 13:50:43.155371+00', ''),
	('00000000-0000-0000-0000-000000000000', '5b4d5ff2-e404-4580-9827-ae7b316715c0', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-13 13:50:43.170146+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f130f56a-d9a6-432f-bd30-2a2cfcf7bb97', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-13 14:53:14.787705+00', ''),
	('00000000-0000-0000-0000-000000000000', '24642966-ab3d-4f31-a3d8-9ddb6a9d201f', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-13 14:53:14.797887+00', ''),
	('00000000-0000-0000-0000-000000000000', '0ff16303-1785-41e4-9d20-7d4f0614c17e', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-13 17:23:05.761233+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a6d93ba6-c933-4207-8f4b-a2c69ed4c4a8', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-13 17:23:05.777436+00', ''),
	('00000000-0000-0000-0000-000000000000', '82e96820-46ba-4165-905b-b21291c8c379', '{"action":"user_recovery_requested","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"user"}', '2025-11-13 17:27:43.399072+00', ''),
	('00000000-0000-0000-0000-000000000000', '03a40229-1556-4672-8bae-b5664215ea8a', '{"action":"login","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"account"}', '2025-11-13 17:28:11.581448+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd5cbac34-956c-4504-b729-5904a2ecaf7c', '{"action":"user_recovery_requested","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"user"}', '2025-11-13 17:29:28.479635+00', ''),
	('00000000-0000-0000-0000-000000000000', '0bd338e1-4cc3-43f1-be65-ef749c9cc3d6', '{"action":"login","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"account"}', '2025-11-13 17:29:45.534006+00', ''),
	('00000000-0000-0000-0000-000000000000', '0669f938-c780-41b7-929c-4d42611dd5b9', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-13 18:49:02.204364+00', ''),
	('00000000-0000-0000-0000-000000000000', '2ae6a41b-34cb-4e6d-8a75-6706731e2d4e', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-13 19:07:44.778266+00', ''),
	('00000000-0000-0000-0000-000000000000', 'daa4187e-b5d0-4c18-b9d8-0a739b9403cb', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-13 19:07:44.787097+00', ''),
	('00000000-0000-0000-0000-000000000000', '1350fc69-ebbf-48cc-90c8-f84267d09500', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-13 21:44:16.834288+00', ''),
	('00000000-0000-0000-0000-000000000000', '0d247264-b556-4c79-95fe-10c0a9f73fd5', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-13 21:44:16.847985+00', ''),
	('00000000-0000-0000-0000-000000000000', '2695027d-aee3-4a94-8b33-051b6fa13b7f', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-13 22:16:08.951658+00', ''),
	('00000000-0000-0000-0000-000000000000', '03b61c43-0fd3-43cd-86a1-a67535e85a61', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-13 22:16:08.965038+00', ''),
	('00000000-0000-0000-0000-000000000000', '57142191-2b93-48ea-8fc7-10a13b62d76a', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-13 23:18:50.790326+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ad07dab5-959d-4ff2-a09c-9053ba90d524', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-13 23:18:50.804837+00', ''),
	('00000000-0000-0000-0000-000000000000', '92ccb6ea-fa4f-4d79-81b5-0f15e93efa26', '{"action":"token_refreshed","actor_id":"328e27ad-6352-4198-b173-370bd705950b","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-11-13 23:19:00.381312+00', ''),
	('00000000-0000-0000-0000-000000000000', '70852b19-e369-432c-acfe-b061ac0380de', '{"action":"token_revoked","actor_id":"328e27ad-6352-4198-b173-370bd705950b","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-11-13 23:19:00.38239+00', ''),
	('00000000-0000-0000-0000-000000000000', '448e5f52-ecdb-4adb-9e2e-4fd855658025', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-13 23:20:58.934597+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b64c4a6e-15b2-4f19-ae14-1d4d3341d2b9', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-13 23:20:58.956706+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e45866ff-08e9-4ef1-85a5-666fd9638434', '{"action":"logout","actor_id":"328e27ad-6352-4198-b173-370bd705950b","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-11-13 23:22:01.868132+00', ''),
	('00000000-0000-0000-0000-000000000000', 'eede07dd-34b9-4629-95b4-3b4136dcd860', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-13 23:22:12.599498+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e4413fb5-9d82-416a-9ef1-e3936b65abc8', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-13 23:23:30.025142+00', ''),
	('00000000-0000-0000-0000-000000000000', '7759e21f-6e9d-4fd1-bd60-2094dc527b45', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-13 23:23:30.027076+00', ''),
	('00000000-0000-0000-0000-000000000000', '24601c7b-cd8f-4f7b-936d-440cb62922ae', '{"action":"logout","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account"}', '2025-11-13 23:24:50.437955+00', ''),
	('00000000-0000-0000-0000-000000000000', '6d9e9a3b-3614-4571-a2f5-87de9407c2e0', '{"action":"login","actor_id":"328e27ad-6352-4198-b173-370bd705950b","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-13 23:25:12.698401+00', ''),
	('00000000-0000-0000-0000-000000000000', '2f72c50d-db80-4b82-b2cf-654997bd4ad7', '{"action":"logout","actor_id":"328e27ad-6352-4198-b173-370bd705950b","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-11-13 23:25:35.439812+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ba72ff5c-3004-4c58-8957-43b14e25b627', '{"action":"user_recovery_requested","actor_id":"328e27ad-6352-4198-b173-370bd705950b","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"user"}', '2025-11-13 23:25:40.081253+00', ''),
	('00000000-0000-0000-0000-000000000000', '8a215f10-9d8b-4e70-9698-65aad82fa9f5', '{"action":"user_recovery_requested","actor_id":"328e27ad-6352-4198-b173-370bd705950b","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"user"}', '2025-11-13 23:27:28.638851+00', ''),
	('00000000-0000-0000-0000-000000000000', '1d86105f-8097-448a-b9c9-de4f1b461253', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-13 23:29:17.086189+00', ''),
	('00000000-0000-0000-0000-000000000000', '5b61cd0a-1c21-426e-9315-f06afafe1a60', '{"action":"logout","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account"}', '2025-11-13 23:29:26.853596+00', ''),
	('00000000-0000-0000-0000-000000000000', '4689d879-3b9e-48c2-9a13-0906312a2373', '{"action":"user_recovery_requested","actor_id":"328e27ad-6352-4198-b173-370bd705950b","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"user"}', '2025-11-13 23:29:43.314628+00', ''),
	('00000000-0000-0000-0000-000000000000', '6d14556a-cccb-4913-8c12-45a34e4f536f', '{"action":"user_recovery_requested","actor_id":"328e27ad-6352-4198-b173-370bd705950b","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"user"}', '2025-11-13 23:33:43.04179+00', ''),
	('00000000-0000-0000-0000-000000000000', '97ba5acb-f885-421c-ac2f-e1b5e2b615e9', '{"action":"login","actor_id":"328e27ad-6352-4198-b173-370bd705950b","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-11-13 23:33:57.835436+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e2970c53-1273-4f49-b2b3-0e7ba267221c', '{"action":"user_updated_password","actor_id":"328e27ad-6352-4198-b173-370bd705950b","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"user"}', '2025-11-13 23:34:07.992253+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c85f060c-58b7-4ced-9dc1-f85b4e843e77', '{"action":"user_modified","actor_id":"328e27ad-6352-4198-b173-370bd705950b","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"user"}', '2025-11-13 23:34:07.99422+00', ''),
	('00000000-0000-0000-0000-000000000000', '77a5eb04-e561-4f3f-8e6c-021d33c1acc7', '{"action":"login","actor_id":"328e27ad-6352-4198-b173-370bd705950b","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-13 23:34:50.304815+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ba23255a-5c88-49f5-b2f2-bb859ac621bf', '{"action":"logout","actor_id":"328e27ad-6352-4198-b173-370bd705950b","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-11-13 23:34:55.191031+00', ''),
	('00000000-0000-0000-0000-000000000000', '67c8b4ad-39a5-4d51-af16-10aa33137110', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-14 00:05:52.968639+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b37bbe61-3f53-4b7f-aab3-5e6e7f2ee3eb', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-14 00:50:48.345984+00', ''),
	('00000000-0000-0000-0000-000000000000', '8f29fe2a-67cd-4774-a093-ae3a8c270f23', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-14 01:57:40.92567+00', ''),
	('00000000-0000-0000-0000-000000000000', '1d0eded2-5e33-4d5c-8bac-c57761b26317', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-14 01:57:40.942379+00', ''),
	('00000000-0000-0000-0000-000000000000', '044b63cd-11f5-49f4-bd9a-13928558b113', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-14 02:48:16.134253+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a7da0c1c-7281-470d-abe8-3f8a37a2bd85', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-14 02:48:16.152475+00', ''),
	('00000000-0000-0000-0000-000000000000', '4dff4982-1537-4618-ad89-69bf1fecaf2a', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-14 09:19:35.330643+00', ''),
	('00000000-0000-0000-0000-000000000000', '93a3ea0a-2f91-4f99-abff-a312fa44d8bf', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-14 09:19:35.350971+00', ''),
	('00000000-0000-0000-0000-000000000000', '08d8557c-4a2e-4c6a-bffd-a83b891c6c17', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-14 11:12:22.685912+00', ''),
	('00000000-0000-0000-0000-000000000000', '893d85ba-101c-43e9-aa19-32061ff2a85b', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-14 11:12:22.70518+00', ''),
	('00000000-0000-0000-0000-000000000000', '26b8ff5d-3ac8-4fe7-9dad-a6a9ce3733b0', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-14 16:32:10.051153+00', ''),
	('00000000-0000-0000-0000-000000000000', '30b655ab-a3b8-4ec0-82c7-dbfca9096637', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-14 16:32:10.070764+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cbf6f937-6507-4702-872e-9e3685f12570', '{"action":"logout","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account"}', '2025-11-14 16:34:43.803933+00', ''),
	('00000000-0000-0000-0000-000000000000', '0f8198e2-1ae6-435b-9a47-ea544ea9ca98', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-14 16:35:01.213771+00', ''),
	('00000000-0000-0000-0000-000000000000', '7f89b902-0ae8-46eb-b2f3-f806aacdc47d', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-14 18:47:11.210248+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e392d247-5d21-4e81-acf1-57cbf72d3cdd', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-14 18:47:11.224899+00', ''),
	('00000000-0000-0000-0000-000000000000', '801af51b-758d-45e9-b073-d602a40a40b0', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-15 22:33:24.980331+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a0c53c88-1a2f-4ac4-97f9-fa6f13311f2d', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-15 22:33:25.00011+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a87b73bc-decc-4801-9d8a-f5fcb474fba0', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-16 18:30:27.601851+00', ''),
	('00000000-0000-0000-0000-000000000000', '6c6cdb32-fa23-4ea2-8bf7-9bc8017559cc', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-16 21:03:17.51101+00', ''),
	('00000000-0000-0000-0000-000000000000', '6b96d676-8e5d-4879-a9d6-e19f8de1a318', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-16 21:03:17.5318+00', ''),
	('00000000-0000-0000-0000-000000000000', '4d91a534-273c-471a-b160-6df8670a0f9b', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-16 21:04:57.484244+00', ''),
	('00000000-0000-0000-0000-000000000000', '557b8de2-606d-45cb-9fcd-1181e73f6ae7', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-16 21:04:57.511551+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c6b7e9ac-6e3f-4786-a2e2-4c7bf81e6851', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-16 22:09:51.933375+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e64ced1d-4f8b-4829-9ab3-ef280d845e8c', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-16 22:09:51.947828+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e86fd64d-649c-4cf2-a5c4-3118a95dda20', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-16 23:15:52.682101+00', ''),
	('00000000-0000-0000-0000-000000000000', 'db5fe9b1-2386-44a5-8268-f92c0bab73ac', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-16 23:36:05.820079+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c154aa4e-b41d-40d1-9b5c-9cd61eb847aa', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-17 00:37:50.326647+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b66e692d-f3bc-440e-b4c9-fa0bd7c1a834', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-17 00:37:50.348881+00', ''),
	('00000000-0000-0000-0000-000000000000', '3ca16680-af51-4a88-9c72-68baa55eef95', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-17 01:14:46.729756+00', ''),
	('00000000-0000-0000-0000-000000000000', '1cc5e108-5303-4e1a-ace8-7d673c730e81', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-17 01:14:46.743063+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd6355c35-6a59-436b-92d6-941a522995dc', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-17 01:15:30.806316+00', ''),
	('00000000-0000-0000-0000-000000000000', '76dfcd23-62ff-4a6f-a3b4-91ad1567e0e0', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-17 01:15:30.809941+00', ''),
	('00000000-0000-0000-0000-000000000000', '91b87577-470e-4aa3-a75c-c52c7391cb00', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-17 01:36:08.504247+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f90a3b6d-0f6d-4c21-b7db-5047a7271ba8', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-17 01:36:08.528218+00', ''),
	('00000000-0000-0000-0000-000000000000', '0a02d6a3-5ac6-499c-b01a-235450e3c4bb', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-17 10:24:02.579425+00', ''),
	('00000000-0000-0000-0000-000000000000', '19f9c772-693f-440f-b425-5b89b8fe79ba', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-17 10:24:02.600198+00', ''),
	('00000000-0000-0000-0000-000000000000', '78d5c3ed-a2e4-4866-9a44-60fe7d6ae565', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-17 17:02:15.513998+00', ''),
	('00000000-0000-0000-0000-000000000000', '08f62a10-76d9-4f87-9ec9-ac89479866e5', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-17 17:02:15.532782+00', ''),
	('00000000-0000-0000-0000-000000000000', '0e5de5ee-f6e8-4701-91cb-135474a22f87', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-17 20:45:50.217042+00', ''),
	('00000000-0000-0000-0000-000000000000', '922923e9-11a8-4051-9e70-3b4ed3e6d9d1', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-17 20:45:50.23485+00', ''),
	('00000000-0000-0000-0000-000000000000', '2ece5b9e-1fc5-4744-9f6a-fcfd2a4b2b09', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-17 21:24:56.116198+00', ''),
	('00000000-0000-0000-0000-000000000000', '74854b4c-e409-4970-83bb-f441209003a9', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-17 21:24:56.134114+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd16c4ac9-b04c-4310-a399-550910204566', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-17 21:53:20.56942+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cd1c7842-0813-44ca-a3c3-4f9fcefe60ca', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-17 21:53:20.585723+00', ''),
	('00000000-0000-0000-0000-000000000000', '3c9831b3-1b5a-48b6-886c-0a1284364994', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-17 21:53:21.710746+00', ''),
	('00000000-0000-0000-0000-000000000000', '11ffd354-720b-4025-8d05-cc70e13bd5b1', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-17 21:53:21.71272+00', ''),
	('00000000-0000-0000-0000-000000000000', 'af59d6d0-091d-4a2b-a077-86dbfaf7bf7b', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-17 22:35:19.826857+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a1aef384-077f-4abe-b31e-ec068be3aaf2', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-17 22:35:19.847337+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c71120a3-b4b7-40c1-939a-e3be55b7e5b1', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-17 22:52:12.403999+00', ''),
	('00000000-0000-0000-0000-000000000000', '0ea421f7-147c-420e-a4c2-158534a2d5e6', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-17 22:52:12.409319+00', ''),
	('00000000-0000-0000-0000-000000000000', 'df6e9108-be10-4be9-aab5-cdf1b487cab1', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-17 23:16:05.988396+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b6d3a610-d33f-4d9c-8421-6d595beb379b', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-17 23:16:05.998981+00', ''),
	('00000000-0000-0000-0000-000000000000', '10aacd9f-6a2a-4e79-9574-cf0fe32a5191', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-17 23:43:47.802949+00', ''),
	('00000000-0000-0000-0000-000000000000', '86c273bf-4b6d-4845-8290-8b73a9bfcd9e', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-17 23:43:47.824315+00', ''),
	('00000000-0000-0000-0000-000000000000', '8216d9e3-e884-4d4b-9283-90acdcf917da', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-18 00:05:51.616334+00', ''),
	('00000000-0000-0000-0000-000000000000', 'aa31fb9c-eb51-4586-b56a-96b8ec51d966', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-18 00:05:51.62994+00', ''),
	('00000000-0000-0000-0000-000000000000', '9cda6312-d53f-4399-b91f-6215a8712f75', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-18 00:45:14.084854+00', ''),
	('00000000-0000-0000-0000-000000000000', '626fee18-55ee-4836-b2f1-59df79e9c367', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-18 00:45:14.105462+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a6fce1c6-39c2-4f98-8e9f-ac72a1232f6b', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-18 01:07:57.010499+00', ''),
	('00000000-0000-0000-0000-000000000000', '01f5adeb-7208-4b05-9ab4-856b26d44086', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-18 01:07:57.024149+00', ''),
	('00000000-0000-0000-0000-000000000000', '9a7460be-0636-4f20-a11d-62686a7b9f7a', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-18 10:20:50.880457+00', ''),
	('00000000-0000-0000-0000-000000000000', 'faefc140-3d16-48ef-86d7-822fdb8c6fa9', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-18 10:20:50.896862+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fddfe09b-037d-4f14-8b01-6285ad927501', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-18 11:20:17.573532+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b38f51e7-c7d0-48bb-90f0-57d37e8534eb', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-18 11:20:17.594475+00', ''),
	('00000000-0000-0000-0000-000000000000', '92da4470-beef-489a-b827-a4824b375e83', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-18 12:36:18.350251+00', ''),
	('00000000-0000-0000-0000-000000000000', '2dc9a85c-a37d-4593-ab93-3eaf4a69c016', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-18 12:36:18.368354+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fdd3fae2-c03a-448f-bb6c-c1b0cf9dd151', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-18 13:42:02.003868+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bf9efebf-539d-49b4-a993-cd2ad70017c6', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-18 13:42:02.020141+00', ''),
	('00000000-0000-0000-0000-000000000000', '7539407a-5e1b-4566-9562-0c1c48d6affe', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-18 15:07:49.139762+00', ''),
	('00000000-0000-0000-0000-000000000000', '60595e25-cbae-4888-a535-5fb5c238ba10', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-18 15:07:49.154626+00', ''),
	('00000000-0000-0000-0000-000000000000', '22a96030-55ee-4d60-b79c-569fd83253c1', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-18 16:33:18.981972+00', ''),
	('00000000-0000-0000-0000-000000000000', '7b01cd85-bf5d-4beb-9282-f5b68ddad995', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-18 16:33:19.00532+00', ''),
	('00000000-0000-0000-0000-000000000000', '2a2fbadd-626b-4078-b43f-a66506b86036', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-18 16:34:35.82127+00', ''),
	('00000000-0000-0000-0000-000000000000', '8804ab84-07ba-49ff-9cb5-1be4235c7c74', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-18 16:34:35.823022+00', ''),
	('00000000-0000-0000-0000-000000000000', 'da3a9c71-ab0b-4c28-ba51-2b81be16f766', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-18 21:52:26.908355+00', ''),
	('00000000-0000-0000-0000-000000000000', '2092b7e0-1d0a-4052-8e9b-0b3cc6ba0b2e', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-19 12:50:42.780993+00', ''),
	('00000000-0000-0000-0000-000000000000', '8854b41c-187e-47b6-aa97-0c435d706f07', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-19 12:50:42.802277+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fdf97f16-9bc3-4abd-8605-98b328ffc8e0', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-19 14:10:50.40145+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b67d0bc7-de57-4453-ba91-a10d83f5c0c5', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-19 14:10:50.415293+00', ''),
	('00000000-0000-0000-0000-000000000000', '155ad5d4-fb0c-48b6-917f-1bed8bfc561f', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-19 14:21:49.487967+00', ''),
	('00000000-0000-0000-0000-000000000000', '61ec7a51-6c04-4723-8174-5d60c98dd804', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-19 14:21:49.504305+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd387eabf-a1ef-4660-9c66-c229cf0ad0af', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-19 15:10:20.498572+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bc611fab-2a62-4acc-9f12-9a9af1a17657', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-19 15:10:20.529292+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd8c7b0bd-1846-4707-a819-88f8010cfaad', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-19 15:39:25.2835+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a0005a77-4cb5-4dc8-9606-c0b034f44f70', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-19 16:38:52.864248+00', ''),
	('00000000-0000-0000-0000-000000000000', '98b32e49-e2c8-4dee-99d2-a8971a816758', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-19 16:38:52.880922+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f5305de5-4015-4efc-abcf-87dd9fe56aa3', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-19 17:34:28.707404+00', ''),
	('00000000-0000-0000-0000-000000000000', '5258bee4-2801-4bfb-a42e-d46d3a2bf02d', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-19 17:34:28.725266+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f92c8dc5-2e0f-414d-b931-de1673d5fc19', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-19 17:37:30.215275+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ecfdad61-713b-4aa8-ba16-e6e3e0d53e58', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-19 17:37:30.217654+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bde4d2ee-38ca-47e5-a8d0-1c4a283473f7', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-19 18:42:14.75909+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fbd90c7e-5b29-41ab-a401-7ce6ffa03909', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-19 18:42:14.774639+00', ''),
	('00000000-0000-0000-0000-000000000000', '745e1bf6-be5d-4104-a904-dd0ca899974c', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-19 18:57:02.72754+00', ''),
	('00000000-0000-0000-0000-000000000000', '1f57fb61-5784-4d55-a3ba-a8fd60d19a0d', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-19 18:57:02.73978+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b3162fe6-b4bb-457d-b731-a2f058b2fa19', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-19 19:50:40.628224+00', ''),
	('00000000-0000-0000-0000-000000000000', '8b1d0534-cdad-4d60-9f74-c500508123da', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-19 19:50:40.650047+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fd953e1b-8589-4e3c-a313-2645d58ef263', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-19 20:58:18.086415+00', ''),
	('00000000-0000-0000-0000-000000000000', '0fa9aa4d-e3e2-4ce1-895a-3ce0788b1c34', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-19 20:58:18.10148+00', ''),
	('00000000-0000-0000-0000-000000000000', '0a2cba07-789a-4657-a94a-53b12eb6b6e5', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-19 21:18:03.250523+00', ''),
	('00000000-0000-0000-0000-000000000000', '61c713e9-780e-4c15-879a-41b0e22cd73b', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-19 21:18:03.26433+00', ''),
	('00000000-0000-0000-0000-000000000000', '6133dc30-c8c1-416d-80cf-b48af91baa35', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-19 21:38:28.417435+00', ''),
	('00000000-0000-0000-0000-000000000000', '663e4bc1-557b-4ec4-aad8-9feb4c0075a2', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-19 21:38:28.427359+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a522103d-cae0-4df4-9299-07d4245117a4', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-19 22:41:21.688088+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b8b3d7d8-89d6-4b96-81a4-0b3ca7052513', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-19 22:41:21.720789+00', ''),
	('00000000-0000-0000-0000-000000000000', '46d9cf36-c216-42a6-b9ec-baf7bd007438', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-19 23:12:23.023926+00', ''),
	('00000000-0000-0000-0000-000000000000', '2c56eb03-349e-4f1a-953f-c373220b4d7d', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-19 23:12:23.040466+00', ''),
	('00000000-0000-0000-0000-000000000000', '3cf9e821-ca5a-46a6-a685-677e14376f9c', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-19 23:40:04.431803+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e99b2e46-a12a-4e94-88a0-4436ca395381', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-19 23:40:04.444543+00', ''),
	('00000000-0000-0000-0000-000000000000', '9292e229-00cf-4107-8230-cfe7858fe230', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-20 00:12:24.691952+00', ''),
	('00000000-0000-0000-0000-000000000000', '5408c130-9c0b-4f15-96ce-f98b221bdaf6', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-20 00:12:24.709908+00', ''),
	('00000000-0000-0000-0000-000000000000', '562a6aec-7e85-4aaa-8398-6f3f5ea7c3fb', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-20 01:07:06.481321+00', ''),
	('00000000-0000-0000-0000-000000000000', '0e6a0e78-ce78-42aa-8c46-9e39667024fe', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-20 01:07:06.498967+00', ''),
	('00000000-0000-0000-0000-000000000000', '5e527952-db59-4ad9-a2d0-d88a6f028639', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-20 01:13:13.877864+00', ''),
	('00000000-0000-0000-0000-000000000000', '069bf745-9516-4d75-83ec-092bd59028e2', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-20 01:13:13.889274+00', ''),
	('00000000-0000-0000-0000-000000000000', '9c959ec9-a697-4c11-89ed-81479defcbd8', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-20 02:12:16.345534+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cb37de81-314e-4d13-862c-1d20bf1b37b0', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-20 02:12:16.364245+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd7506581-47e1-4e86-995a-d748c2357320', '{"action":"token_refreshed","actor_id":"7c263c3e-11b2-468e-a74d-98910c429842","actor_username":"aledip06@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-11-20 10:13:22.432216+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd27cea58-7eae-4689-866f-8e83644ce0a5', '{"action":"token_revoked","actor_id":"7c263c3e-11b2-468e-a74d-98910c429842","actor_username":"aledip06@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-11-20 10:13:22.452926+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b7036735-ff81-4aec-80a8-8356c29fa0c6', '{"action":"logout","actor_id":"7c263c3e-11b2-468e-a74d-98910c429842","actor_username":"aledip06@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-11-20 10:13:47.02397+00', ''),
	('00000000-0000-0000-0000-000000000000', '2b1111ac-7cf7-4ff4-b103-34df5caa1787', '{"action":"login","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-20 10:14:02.346043+00', ''),
	('00000000-0000-0000-0000-000000000000', 'dca8ec6f-42ca-40c5-99b5-4e52749d1a51', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-20 11:13:48.054302+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b3f1b973-9e77-4103-b494-a5a0f7e649f3', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-20 11:13:48.078767+00', ''),
	('00000000-0000-0000-0000-000000000000', '2e0a404e-63f0-4402-ab88-828987c18ba2', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-20 12:23:05.599308+00', ''),
	('00000000-0000-0000-0000-000000000000', '934691e6-9c6e-4909-be3a-df7738222bb1', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-20 12:23:05.618545+00', ''),
	('00000000-0000-0000-0000-000000000000', '51990f81-dc3f-457c-a29f-e16c31086ccb', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-20 13:40:17.5246+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fc713c03-2f36-4f24-b020-7c73635ed5ba', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-20 13:40:17.54046+00', ''),
	('00000000-0000-0000-0000-000000000000', '3a9331b4-f52e-4540-82a6-f23420efc3e5', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-20 16:33:37.708342+00', ''),
	('00000000-0000-0000-0000-000000000000', '1903b19c-bfac-48d0-b135-8342660bb774', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-20 16:33:37.725271+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c8a4c461-abbd-4d40-ae24-063aa2e40f43', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-20 17:11:37.320238+00', ''),
	('00000000-0000-0000-0000-000000000000', '1da8311a-7249-4690-9d4b-148ce021e0c0', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-20 17:11:37.331871+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd5a42756-4239-48b3-923d-c27409fa9c13', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-20 17:45:32.832474+00', ''),
	('00000000-0000-0000-0000-000000000000', 'caa07496-ff99-4ec3-be72-f23a80fc3c79', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-20 17:45:32.850119+00', ''),
	('00000000-0000-0000-0000-000000000000', '9fc822a7-9d2f-47b7-8805-9fdb9bbffccd', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-20 17:56:35.747659+00', ''),
	('00000000-0000-0000-0000-000000000000', '6afa3b97-eb35-4295-a87d-b842612097a9', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-20 17:56:35.767062+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e526ffc8-67a7-487e-9016-15a1ecda8566', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-20 18:04:05.12926+00', ''),
	('00000000-0000-0000-0000-000000000000', '0ad8baaf-13b1-4205-bdcf-f1a831e41e5b', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-20 18:04:05.140822+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bf04e66a-6db6-46fc-be1d-74d2b2c4608c', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-20 18:55:02.376647+00', ''),
	('00000000-0000-0000-0000-000000000000', '585115bc-4263-4e5d-b5db-74111dbedb7c', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-20 18:55:02.408895+00', ''),
	('00000000-0000-0000-0000-000000000000', '1f40ea4d-d22d-4c7b-9f10-a8f6b62ca25a', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-20 19:03:19.061275+00', ''),
	('00000000-0000-0000-0000-000000000000', '21a0523a-f6ca-476a-823a-bd6938616c0c', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-20 19:03:19.063519+00', ''),
	('00000000-0000-0000-0000-000000000000', '75dc9001-c2e5-4691-828a-8620003b652a', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-20 20:58:48.039774+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ccdeeeb9-9965-412b-9c99-520b94d9afd0', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-20 20:58:48.057115+00', ''),
	('00000000-0000-0000-0000-000000000000', '9f852f52-81d4-40a6-8425-269479c5ccc2', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-20 21:05:07.397817+00', ''),
	('00000000-0000-0000-0000-000000000000', '5914373d-da8e-4453-b1f6-e02008337b04', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-20 21:05:07.40959+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bd94ec40-7b29-449e-a473-4c7721e39aa9', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-21 11:58:27.873167+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f8610ea9-3ccc-49ea-a664-8b43fb6ae956', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-21 11:58:27.888637+00', ''),
	('00000000-0000-0000-0000-000000000000', '23db978a-fb33-4a37-a25a-80852cc61861', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-21 16:34:03.182905+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cd19e530-0770-4587-9a7c-af0ba5418857', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-21 17:23:54.401461+00', ''),
	('00000000-0000-0000-0000-000000000000', '8c71fd7a-a535-47c2-a829-6add98cb9bf9', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-21 17:23:54.411722+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cb935b8b-1111-4ce3-94db-57133585af1c', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-21 17:32:21.445001+00', ''),
	('00000000-0000-0000-0000-000000000000', '37fb3433-62ec-47a2-98b3-af95772c5652', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-21 17:32:21.456734+00', ''),
	('00000000-0000-0000-0000-000000000000', '06d7d147-f159-4f41-aac0-6c4c1d953a7e', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-21 17:38:49.200967+00', ''),
	('00000000-0000-0000-0000-000000000000', '4a8a59f6-58c3-4aac-b499-c3bf49b3d6e5', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-21 17:38:49.203916+00', ''),
	('00000000-0000-0000-0000-000000000000', '12bd045c-3d32-43ba-83e0-8cc40194c957', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-21 17:48:28.175749+00', ''),
	('00000000-0000-0000-0000-000000000000', '43dcd24c-482a-4f13-8988-30dcc94e4c79', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-21 18:30:45.440262+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e957f1cb-3248-4568-adcf-776c52654e17', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-21 18:30:45.456463+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f23bc889-5187-4940-8b00-05fe610e4047', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-21 18:40:45.986348+00', ''),
	('00000000-0000-0000-0000-000000000000', '3843406d-e34c-4298-b736-b0e8ac1d5720', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-21 18:40:45.992811+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e44c7e9c-c446-400a-b1c2-a21a784600ce', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-21 20:47:37.366034+00', ''),
	('00000000-0000-0000-0000-000000000000', '19a1ce0b-6161-4f7b-9112-e56b5968679b', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-21 20:47:37.384426+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c0b060e4-6250-42ec-9f2f-3f19844d2e40', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-22 14:14:36.165087+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd5d76dd1-7488-4379-94fe-494dbbcf0fc4', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-22 15:07:08.11124+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a3e86697-aae3-49d4-a61d-d932240af2f1', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-22 15:07:08.131207+00', ''),
	('00000000-0000-0000-0000-000000000000', '461a4e2d-94f4-45a7-aaa6-70f3b1a895e6', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-22 15:15:18.15755+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a218809f-d76e-4db0-97ce-3dc10e342d10', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-22 15:15:18.167498+00', ''),
	('00000000-0000-0000-0000-000000000000', '1ef0488b-6f95-4a20-91c8-a6e8b44482fd', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-22 21:16:15.931116+00', ''),
	('00000000-0000-0000-0000-000000000000', '6f0655d7-2fa1-42e4-a358-52d0695e315f', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-22 21:16:15.947246+00', ''),
	('00000000-0000-0000-0000-000000000000', '6366e2a6-a581-471c-a36c-7170ae295420', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-22 23:17:42.517333+00', ''),
	('00000000-0000-0000-0000-000000000000', '9b472539-c6be-491c-8cf9-ffa638c1d9cf', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-22 23:17:42.536717+00', ''),
	('00000000-0000-0000-0000-000000000000', '34caf261-969e-459e-bedd-924587ec3d86', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-23 14:39:16.26503+00', ''),
	('00000000-0000-0000-0000-000000000000', '41ce9d45-96e1-4a39-a274-c8793946c1d7', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-23 14:39:16.283825+00', ''),
	('00000000-0000-0000-0000-000000000000', '147e1242-57d7-4f1b-87e4-dc433b569e67', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-23 17:15:15.951809+00', ''),
	('00000000-0000-0000-0000-000000000000', '68bb7936-8235-4303-aeff-5a7f22f98b53', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-23 17:15:15.972166+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e8a7cb75-e87b-479a-9c8a-ab420f399f87', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-23 17:15:20.426406+00', ''),
	('00000000-0000-0000-0000-000000000000', '457b5188-3588-4114-af09-fe3c9552fe68', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-23 17:15:20.427919+00', ''),
	('00000000-0000-0000-0000-000000000000', '416d9fc2-76f9-4b2d-b795-bce43e8d7476', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-23 17:22:38.591547+00', ''),
	('00000000-0000-0000-0000-000000000000', '5fd6fc14-ae6a-467f-9379-8bffa6624801', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-23 18:13:24.636388+00', ''),
	('00000000-0000-0000-0000-000000000000', '56fd1de3-353d-4ac0-ba5f-8a4ecf4c3ba8', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-23 18:13:24.650433+00', ''),
	('00000000-0000-0000-0000-000000000000', '1965ee8f-783a-4092-be0b-f0294d85ace0', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-23 18:14:51.636617+00', ''),
	('00000000-0000-0000-0000-000000000000', '95bb0973-745c-4f8c-b769-edd60e217476', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-23 18:14:51.639465+00', ''),
	('00000000-0000-0000-0000-000000000000', '262a037a-d67a-401c-98e1-0c7fda3c5bcd', '{"action":"logout","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account"}', '2025-11-23 18:30:27.007858+00', ''),
	('00000000-0000-0000-0000-000000000000', '2a28d062-5951-48d6-a733-fd929c43e1d9', '{"action":"user_recovery_requested","actor_id":"328e27ad-6352-4198-b173-370bd705950b","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"user"}', '2025-11-23 18:32:41.44561+00', ''),
	('00000000-0000-0000-0000-000000000000', '075f226f-78be-421e-bbc0-e64868f159e0', '{"action":"login","actor_id":"328e27ad-6352-4198-b173-370bd705950b","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-11-23 18:32:57.474093+00', ''),
	('00000000-0000-0000-0000-000000000000', '6c8b9ba2-b529-4918-995c-6fc3ef6afef0', '{"action":"user_recovery_requested","actor_id":"328e27ad-6352-4198-b173-370bd705950b","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"user"}', '2025-11-23 18:34:00.210091+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a777afb2-4028-4238-b1fb-eaac104db0c4', '{"action":"login","actor_id":"328e27ad-6352-4198-b173-370bd705950b","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-11-23 18:34:17.730059+00', ''),
	('00000000-0000-0000-0000-000000000000', '39ddf9cb-8d01-4c87-b998-4262e2e9ea0f', '{"action":"logout","actor_id":"328e27ad-6352-4198-b173-370bd705950b","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-11-23 18:35:38.040213+00', ''),
	('00000000-0000-0000-0000-000000000000', '2374c10b-f5a0-4545-a45a-55ae96a9afcd', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-23 18:35:44.621612+00', ''),
	('00000000-0000-0000-0000-000000000000', '8499e81a-e4ea-42de-881f-6c9b128591ea', '{"action":"logout","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account"}', '2025-11-23 18:35:52.254722+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ec5f94e1-02b3-4a39-b900-8f3223815673', '{"action":"user_recovery_requested","actor_id":"328e27ad-6352-4198-b173-370bd705950b","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"user"}', '2025-11-23 18:36:07.562457+00', ''),
	('00000000-0000-0000-0000-000000000000', '17317c9b-21d4-4f65-abe7-d33c0da738a4', '{"action":"login","actor_id":"328e27ad-6352-4198-b173-370bd705950b","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-11-23 18:36:22.162997+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a5dcfe26-c41e-4672-83ba-fca8abb78de1', '{"action":"user_updated_password","actor_id":"328e27ad-6352-4198-b173-370bd705950b","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"user"}', '2025-11-23 18:36:30.61647+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f08e1f23-bc2e-4021-8d10-7255f8db4620', '{"action":"user_modified","actor_id":"328e27ad-6352-4198-b173-370bd705950b","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"user"}', '2025-11-23 18:36:30.617222+00', ''),
	('00000000-0000-0000-0000-000000000000', 'beb05330-dbd6-4651-9f5d-9e5a4e4066fa', '{"action":"login","actor_id":"328e27ad-6352-4198-b173-370bd705950b","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-23 18:48:20.449991+00', ''),
	('00000000-0000-0000-0000-000000000000', '13c4bae4-0b35-4054-ab61-807ff7304cb7', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"runavii7@gmail.com","user_id":"328e27ad-6352-4198-b173-370bd705950b","user_phone":""}}', '2025-11-23 18:48:21.442545+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ad0f96f7-5849-4dad-8f32-90d16c8479c9', '{"action":"user_confirmation_requested","actor_id":"8960d5db-b666-4f93-b68c-8d17129a92b5","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-11-23 18:49:55.756728+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c6a9b1c9-fcf7-45bf-baff-7f5918b7b386', '{"action":"user_signedup","actor_id":"8960d5db-b666-4f93-b68c-8d17129a92b5","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}', '2025-11-23 18:50:04.072812+00', ''),
	('00000000-0000-0000-0000-000000000000', 'dcbd6183-bab7-4449-a7e0-36cdfa615633', '{"action":"logout","actor_id":"8960d5db-b666-4f93-b68c-8d17129a92b5","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-11-23 19:46:35.766407+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ad203900-8b2d-4247-a024-9e8696020e00', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-23 19:46:42.265373+00', ''),
	('00000000-0000-0000-0000-000000000000', '53069b8e-e562-4a17-b117-bc02e48ff54f', '{"action":"logout","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account"}', '2025-11-23 19:46:55.395872+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ef44e362-8d4b-4a75-829f-0decc7a97fb2', '{"action":"login","actor_id":"8960d5db-b666-4f93-b68c-8d17129a92b5","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-23 19:47:50.397417+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e38d57ab-54a3-464e-8471-1e06754a0af9', '{"action":"logout","actor_id":"8960d5db-b666-4f93-b68c-8d17129a92b5","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-11-23 19:47:59.952865+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cd0cdf99-0aa2-42ec-b5f6-1a30aec173fc', '{"action":"login","actor_id":"8960d5db-b666-4f93-b68c-8d17129a92b5","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-23 19:48:22.871502+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c3d8c09a-8748-41bf-bdc7-a676cf0543ca', '{"action":"login","actor_id":"8960d5db-b666-4f93-b68c-8d17129a92b5","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-23 19:49:15.723331+00', ''),
	('00000000-0000-0000-0000-000000000000', 'faeda301-791a-43e2-99a3-a1c383944b2e', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"runavii7@gmail.com","user_id":"8960d5db-b666-4f93-b68c-8d17129a92b5","user_phone":""}}', '2025-11-23 19:49:16.592963+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cb6f3783-cd2a-4c47-aaf4-3be5b010dfaa', '{"action":"user_confirmation_requested","actor_id":"7a0ffdc4-7ad4-4415-bb1c-aae1d3522010","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-11-23 19:50:42.008082+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e0384b1b-82a5-46cb-9bee-f0c40ea9a787', '{"action":"user_signedup","actor_id":"7a0ffdc4-7ad4-4415-bb1c-aae1d3522010","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}', '2025-11-23 19:50:52.707178+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f97946d3-18f7-4e5c-b82a-d6cdb66bdcd2', '{"action":"login","actor_id":"7a0ffdc4-7ad4-4415-bb1c-aae1d3522010","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-23 19:51:24.86344+00', ''),
	('00000000-0000-0000-0000-000000000000', '2cdaf5bb-e9ac-4e3b-a0bf-11766b6e2564', '{"action":"logout","actor_id":"7a0ffdc4-7ad4-4415-bb1c-aae1d3522010","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-11-23 19:56:50.248444+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd3fd898a-7ac0-48f2-839b-2853c492c95d', '{"action":"login","actor_id":"7a0ffdc4-7ad4-4415-bb1c-aae1d3522010","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-23 19:57:05.968613+00', ''),
	('00000000-0000-0000-0000-000000000000', '610313ab-8549-4600-a033-07421e0bb7a6', '{"action":"logout","actor_id":"7a0ffdc4-7ad4-4415-bb1c-aae1d3522010","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-11-23 19:57:12.674408+00', ''),
	('00000000-0000-0000-0000-000000000000', 'dc5b171a-e8ba-408d-99f7-e0564ad6d853', '{"action":"login","actor_id":"7a0ffdc4-7ad4-4415-bb1c-aae1d3522010","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-23 19:57:33.926978+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ecdf1a1f-cc1c-4775-ba60-ed84ee2bb813', '{"action":"logout","actor_id":"7a0ffdc4-7ad4-4415-bb1c-aae1d3522010","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-11-23 20:03:02.507789+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bfc36b40-4bb1-465b-98b9-3ce74990cf47', '{"action":"login","actor_id":"7a0ffdc4-7ad4-4415-bb1c-aae1d3522010","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-23 20:03:21.98964+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bfc22716-8aa1-4b6d-9726-7a3eb005903d', '{"action":"login","actor_id":"7a0ffdc4-7ad4-4415-bb1c-aae1d3522010","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-23 20:03:55.123387+00', ''),
	('00000000-0000-0000-0000-000000000000', '84f59a29-bab5-4acf-8647-55dc788c4a90', '{"action":"login","actor_id":"7a0ffdc4-7ad4-4415-bb1c-aae1d3522010","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-23 20:04:55.037039+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c5cc137f-01c1-416c-9fab-4a06278081ca', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"runavii7@gmail.com","user_id":"7a0ffdc4-7ad4-4415-bb1c-aae1d3522010","user_phone":""}}', '2025-11-23 20:07:27.523351+00', ''),
	('00000000-0000-0000-0000-000000000000', '4377be73-9d62-4fc8-91a9-2e225de0d353', '{"action":"user_confirmation_requested","actor_id":"bd8c8cc4-b62f-4540-bc81-546907f6f9b1","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-11-23 20:10:38.552412+00', ''),
	('00000000-0000-0000-0000-000000000000', '9334ff22-a8a4-464d-a001-0c6c44216c29', '{"action":"user_signedup","actor_id":"bd8c8cc4-b62f-4540-bc81-546907f6f9b1","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}', '2025-11-23 20:10:49.894077+00', ''),
	('00000000-0000-0000-0000-000000000000', '812f1a21-8ea1-423d-9707-3130ed7d4234', '{"action":"login","actor_id":"bd8c8cc4-b62f-4540-bc81-546907f6f9b1","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-23 20:10:57.813028+00', ''),
	('00000000-0000-0000-0000-000000000000', '809aa6cc-eacb-4dc5-8c6d-1d4e6abaa2c7', '{"action":"logout","actor_id":"bd8c8cc4-b62f-4540-bc81-546907f6f9b1","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-11-23 20:17:58.67901+00', ''),
	('00000000-0000-0000-0000-000000000000', '3d7fe9d1-cd04-4921-9414-557f66e2ca1a', '{"action":"login","actor_id":"bd8c8cc4-b62f-4540-bc81-546907f6f9b1","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-23 20:28:31.294762+00', ''),
	('00000000-0000-0000-0000-000000000000', 'af9398d5-b763-4767-8eef-dbf5785ae9b0', '{"action":"login","actor_id":"bd8c8cc4-b62f-4540-bc81-546907f6f9b1","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-23 20:45:12.247784+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e6aa5fc3-02a3-4d56-ab82-9549e41f929c', '{"action":"logout","actor_id":"bd8c8cc4-b62f-4540-bc81-546907f6f9b1","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-11-23 21:20:42.972451+00', ''),
	('00000000-0000-0000-0000-000000000000', '6a9aca4c-6327-4bef-ad9a-b010927d6197', '{"action":"login","actor_id":"bd8c8cc4-b62f-4540-bc81-546907f6f9b1","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-23 21:21:02.979531+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ff827c9d-50db-4502-96cb-aabff666cd2f', '{"action":"login","actor_id":"bd8c8cc4-b62f-4540-bc81-546907f6f9b1","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-23 21:21:32.729643+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b8b72960-2250-4bc9-bdcf-e7fb72aaa968', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"runavii7@gmail.com","user_id":"bd8c8cc4-b62f-4540-bc81-546907f6f9b1","user_phone":""}}', '2025-11-23 21:21:33.669338+00', ''),
	('00000000-0000-0000-0000-000000000000', '8dbee8c9-27ee-42fd-9db2-7ce18a82827a', '{"action":"user_confirmation_requested","actor_id":"a5d2d7f2-a4f8-4b9e-95f7-e602423aa29c","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-11-23 21:24:58.578841+00', ''),
	('00000000-0000-0000-0000-000000000000', '839fa3d9-a85a-45fe-80d8-a7b6f44b85f9', '{"action":"user_signedup","actor_id":"a5d2d7f2-a4f8-4b9e-95f7-e602423aa29c","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}', '2025-11-23 21:25:11.487556+00', ''),
	('00000000-0000-0000-0000-000000000000', '22abd43f-7566-4882-b824-36878ef68b86', '{"action":"login","actor_id":"a5d2d7f2-a4f8-4b9e-95f7-e602423aa29c","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-23 21:44:22.876162+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ae951f40-1fdb-41f7-8f08-b9236e0c134f', '{"action":"login","actor_id":"a5d2d7f2-a4f8-4b9e-95f7-e602423aa29c","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-23 21:44:46.336224+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a5d61097-558e-45d7-9d98-a1de96bd6eb7', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"runavii7@gmail.com","user_id":"a5d2d7f2-a4f8-4b9e-95f7-e602423aa29c","user_phone":""}}', '2025-11-23 21:44:47.15714+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f9ea9731-efa1-43cf-93f2-3dc9584a3c6c', '{"action":"user_confirmation_requested","actor_id":"ffc0645b-be00-4e2e-81b0-e9514b3fe691","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-11-23 21:53:40.054802+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e6501733-3e59-4971-b227-b27835a2f0de', '{"action":"user_signedup","actor_id":"ffc0645b-be00-4e2e-81b0-e9514b3fe691","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}', '2025-11-23 21:53:57.25783+00', ''),
	('00000000-0000-0000-0000-000000000000', '5bfd99cb-4e23-422a-8d8a-d97aae5cccad', '{"action":"login","actor_id":"ffc0645b-be00-4e2e-81b0-e9514b3fe691","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-23 21:55:01.485579+00', ''),
	('00000000-0000-0000-0000-000000000000', '26f754db-bb01-416d-a7d8-59d5fa90aa8e', '{"action":"login","actor_id":"ffc0645b-be00-4e2e-81b0-e9514b3fe691","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-23 22:03:17.704091+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e9fe0626-9632-41cd-b0d9-568c4b357467', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"runavii7@gmail.com","user_id":"ffc0645b-be00-4e2e-81b0-e9514b3fe691","user_phone":""}}', '2025-11-23 22:03:18.595605+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c033e0d1-ce58-4fad-b1d7-466133ea5042', '{"action":"user_confirmation_requested","actor_id":"8a233ec1-9d01-47d9-9f2e-a40814138c44","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-11-23 22:04:31.039186+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e3909bb6-dd1d-4b17-85c2-10ac9107551c', '{"action":"user_signedup","actor_id":"8a233ec1-9d01-47d9-9f2e-a40814138c44","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}', '2025-11-23 22:04:44.01714+00', ''),
	('00000000-0000-0000-0000-000000000000', '61ca0a8f-859b-4353-a569-de83869bed89', '{"action":"login","actor_id":"8a233ec1-9d01-47d9-9f2e-a40814138c44","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-23 22:04:53.151494+00', ''),
	('00000000-0000-0000-0000-000000000000', '15eb2653-961d-4e43-8e98-c1b5dbd4d074', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-23 22:11:03.518848+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b7427507-d550-44b9-ab73-a13f0db15aed', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-23 22:12:35.090955+00', ''),
	('00000000-0000-0000-0000-000000000000', '5520d492-7f47-4e40-ac47-0dcfbc43a4e2', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-23 22:12:55.769942+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fe0fcdff-ff64-4bd5-be44-82482e24ac93', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-23 23:11:03.57418+00', ''),
	('00000000-0000-0000-0000-000000000000', '72003f44-468e-4ef2-ac9a-0e0281c03bb3', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-23 23:11:03.587691+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c44d3165-6b92-4e4d-bb4a-746bba5c24dc', '{"action":"token_refreshed","actor_id":"8a233ec1-9d01-47d9-9f2e-a40814138c44","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-11-23 23:51:35.674491+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b8e32a92-da36-435a-8419-9112b85e404c', '{"action":"token_revoked","actor_id":"8a233ec1-9d01-47d9-9f2e-a40814138c44","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-11-23 23:51:35.686886+00', ''),
	('00000000-0000-0000-0000-000000000000', '74d0fddd-8c0e-40a0-a767-0097e40425da', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-24 00:49:13.015414+00', ''),
	('00000000-0000-0000-0000-000000000000', '2e9a07ac-1e4b-4ebc-ba0b-ab7868df7e71', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-24 00:49:13.034727+00', ''),
	('00000000-0000-0000-0000-000000000000', '40868e6c-dfe8-4732-8294-39f08f32bab8', '{"action":"logout","actor_id":"8a233ec1-9d01-47d9-9f2e-a40814138c44","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-11-24 00:49:34.602033+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ff93622d-dd98-42fd-b394-f71d2ebb7a43', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-24 00:49:57.604489+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ba31f749-c173-4dfe-9c57-27c35b5a53c2', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-24 01:47:18.028585+00', ''),
	('00000000-0000-0000-0000-000000000000', '433c5202-e5c8-4819-a1d9-5f2f44d98f89', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-24 01:47:18.049178+00', ''),
	('00000000-0000-0000-0000-000000000000', 'abcd3850-909f-43c2-b40a-fd0f59cd3493', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-24 01:48:51.7286+00', ''),
	('00000000-0000-0000-0000-000000000000', '819685bc-f350-41a4-bd44-27c8687e8b02', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-24 01:48:51.732248+00', ''),
	('00000000-0000-0000-0000-000000000000', '82cc5bb0-f196-48a0-a113-c615210592a1', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-24 11:04:10.684244+00', ''),
	('00000000-0000-0000-0000-000000000000', '70bcf23b-8af7-4813-b232-39692f35a333', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-24 11:04:10.701453+00', ''),
	('00000000-0000-0000-0000-000000000000', '91d14a4b-bb53-4abc-9729-d4f693530130', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-24 12:04:55.293677+00', ''),
	('00000000-0000-0000-0000-000000000000', '6ff3234b-03a2-461a-acfb-0ac8e58f061e', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-24 12:16:25.891635+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a6593a5e-7e7e-414f-91fa-5fae0dada616', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-24 13:42:36.530656+00', ''),
	('00000000-0000-0000-0000-000000000000', '4a30b990-61be-4537-97dd-16175bc909cb', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-24 13:42:36.548399+00', ''),
	('00000000-0000-0000-0000-000000000000', '23bdfa02-e4aa-4f87-b8de-dc64b5ba23fc', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-24 15:27:28.0684+00', ''),
	('00000000-0000-0000-0000-000000000000', '990aa00a-9093-4526-872b-78bac18aa061', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-24 15:27:28.084587+00', ''),
	('00000000-0000-0000-0000-000000000000', '553d0038-ea9f-4d38-b3b2-fb6bde4aac82', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-24 20:04:39.212621+00', ''),
	('00000000-0000-0000-0000-000000000000', '57b8a94b-c769-4785-8c1d-ae58378f18c0', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-24 20:04:39.233254+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ed003a9a-f938-42fb-bc7c-d8c4f376f9f5', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-24 21:22:39.911903+00', ''),
	('00000000-0000-0000-0000-000000000000', 'db09e5cd-56ff-44dc-8103-351d916a2b8d', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-24 21:22:39.926661+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd9b39be6-e6d9-4f64-bcdb-2698bc673125', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-24 21:27:08.290785+00', ''),
	('00000000-0000-0000-0000-000000000000', '515d59ba-8fdf-42e6-8bdb-08b83e3b691a', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-24 21:27:08.299689+00', ''),
	('00000000-0000-0000-0000-000000000000', '064f9092-dd6f-497f-b8f2-77acaa9c3ebc', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-24 21:35:59.792344+00', ''),
	('00000000-0000-0000-0000-000000000000', '2d6f8972-d637-4e0e-ac3e-6789109c7ada', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-24 21:35:59.805693+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd88a9e82-f104-43a8-849c-fd0da050e1b1', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-24 21:40:45.474835+00', ''),
	('00000000-0000-0000-0000-000000000000', '9022dc00-1d4a-4cb6-a227-6fb5c1bff4ff', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-24 21:40:45.476981+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bf2c6c88-81fb-4986-aedb-156400e88792', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-25 10:58:21.950761+00', ''),
	('00000000-0000-0000-0000-000000000000', '04461cb9-19ec-4504-9633-1d9a21dca8c6', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-25 10:58:21.968733+00', ''),
	('00000000-0000-0000-0000-000000000000', '09e1f761-6de5-4b6d-bdb5-5211360cf2ff', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-25 12:26:07.620631+00', ''),
	('00000000-0000-0000-0000-000000000000', '40f2b6ae-da31-4b46-b63b-b0d79eb65ef0', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-25 12:27:13.395915+00', ''),
	('00000000-0000-0000-0000-000000000000', '28b6018b-172a-4289-8731-1810ad02d76e', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-25 12:30:01.245101+00', ''),
	('00000000-0000-0000-0000-000000000000', '4e1d372f-6239-4ffb-91d1-38bb77354423', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-25 12:30:01.249027+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fba801ff-601e-4040-b889-b8d58a2240dc', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-25 12:45:09.884788+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ed7603c7-a0a8-479d-8ec6-ca99f8c22f19', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-25 12:45:09.898879+00', ''),
	('00000000-0000-0000-0000-000000000000', '46660e33-e814-4db2-ac45-983a25d363e8', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-25 13:32:58.49814+00', ''),
	('00000000-0000-0000-0000-000000000000', '12858715-5530-4669-8b95-1cc231d4c766', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-25 13:32:58.512128+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a67aa942-6c40-468e-8a6b-dc88995dad8a', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-25 13:42:55.507119+00', ''),
	('00000000-0000-0000-0000-000000000000', '2e2c97d4-8ee7-4918-b710-dd2140f3272b', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-25 13:42:55.523061+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd86b6ff1-0d13-42be-913b-b922b651528b', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-25 13:46:54.050406+00', ''),
	('00000000-0000-0000-0000-000000000000', '97e89dfc-b7f7-40b8-85e6-71e671a676e7', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-25 13:46:54.052372+00', ''),
	('00000000-0000-0000-0000-000000000000', '9ac53fc7-417c-4d8e-8423-a45229b06f87', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-25 13:59:52.707101+00', ''),
	('00000000-0000-0000-0000-000000000000', '1c9a5e6e-fdb2-4c47-b742-3da87b7cb82d', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-25 13:59:52.712479+00', ''),
	('00000000-0000-0000-0000-000000000000', '6c77f547-8a9f-44ae-bced-30af9c8ed17c', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-25 14:43:31.596019+00', ''),
	('00000000-0000-0000-0000-000000000000', '3d351022-af09-4fdc-b988-f76c4b880cf1', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-25 14:43:31.618437+00', ''),
	('00000000-0000-0000-0000-000000000000', '57b24dd4-6083-442d-a082-f2a645fbf5f9', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-25 14:49:28.285176+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cec3dd1f-13bb-46ea-8591-a56cefebd03d', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-25 14:49:28.287698+00', ''),
	('00000000-0000-0000-0000-000000000000', '28d06959-787c-4450-b6d9-3ae2517574cd', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-25 14:49:28.393768+00', ''),
	('00000000-0000-0000-0000-000000000000', '8f0262f3-1ba4-4590-ae51-4980f343acb2', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-25 14:49:28.395689+00', ''),
	('00000000-0000-0000-0000-000000000000', '8bd3e362-5088-406f-8089-53c2acca6e60', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-25 15:45:20.450437+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fc8767c3-4a94-48d2-9cfb-6ae7aab23f8e', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-25 15:45:20.471968+00', ''),
	('00000000-0000-0000-0000-000000000000', '97e28c43-32d2-4530-bcd7-e316da1794f1', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-25 15:54:31.383596+00', ''),
	('00000000-0000-0000-0000-000000000000', '677f719e-fb47-430c-a67a-a42cb0b524f6', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-25 15:54:31.409667+00', ''),
	('00000000-0000-0000-0000-000000000000', '7e2b0784-c892-49f0-b117-a923b01067bd', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-25 16:30:21.072795+00', ''),
	('00000000-0000-0000-0000-000000000000', '644fb40f-e4fd-4ae8-9123-ab5bc329a1bb', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-25 16:30:21.09556+00', ''),
	('00000000-0000-0000-0000-000000000000', '09b64b1a-937d-413d-85bf-a041d2c046e0', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-25 16:44:08.925096+00', ''),
	('00000000-0000-0000-0000-000000000000', '9ee84877-6562-4d24-b3df-58b8085156fb', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-25 16:44:08.942607+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a186460c-1eb6-4061-b300-d8be6e33a6c9', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-25 17:00:28.030093+00', ''),
	('00000000-0000-0000-0000-000000000000', 'faa3bc04-a222-4045-ab55-247c5f602b6d', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-25 17:00:28.044259+00', ''),
	('00000000-0000-0000-0000-000000000000', 'efd4e946-f5fd-46e9-8575-4f280633dde1', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-25 17:27:16.327142+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ef638e80-7317-4c15-8451-9c766d883a6a', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-25 18:24:31.88045+00', ''),
	('00000000-0000-0000-0000-000000000000', '2d0f0019-662e-47f6-9ae1-b6b84e9786e9', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-25 18:24:31.898543+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b1ebbd81-4951-4840-a620-fdd3853df415', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-25 19:28:16.659646+00', ''),
	('00000000-0000-0000-0000-000000000000', '8ce908b6-85ef-43c0-88dd-c2efd3d7cf20', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-25 19:28:16.675348+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e9aa2d6e-387f-42ca-b147-3ffd6703c303', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-25 19:36:15.929495+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e0501503-a395-4027-a8fc-f637147f9ca5', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-25 19:36:15.941493+00', ''),
	('00000000-0000-0000-0000-000000000000', '3d89c376-2eb7-4bfb-901f-3fdb0af3d92c', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-25 19:50:57.025405+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a10c28c5-1b7a-4a2d-87ac-9fc61453138d', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-25 19:50:57.043755+00', ''),
	('00000000-0000-0000-0000-000000000000', '47faa991-e9d3-4608-8746-a3db63278f23', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-25 19:50:57.490841+00', ''),
	('00000000-0000-0000-0000-000000000000', '93963e46-e3a3-47db-8e1a-4a2826715028', '{"action":"logout","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account"}', '2025-11-25 19:53:32.497244+00', ''),
	('00000000-0000-0000-0000-000000000000', '27dc10f1-9f11-411d-85c6-e203811c6390', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-25 19:54:23.110058+00', ''),
	('00000000-0000-0000-0000-000000000000', '492cbabd-b1f9-4ba0-ac4d-fff5c37f07de', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-25 21:22:10.954615+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c586fb66-572d-438f-83d9-359bac16354f', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-25 21:22:10.972366+00', ''),
	('00000000-0000-0000-0000-000000000000', '108be8fe-93e2-4a6d-9700-800f39b1f43f', '{"action":"user_recovery_requested","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"user"}', '2025-11-26 10:47:35.085065+00', ''),
	('00000000-0000-0000-0000-000000000000', '7a40fbbe-0214-40f1-b49c-36048ab9f3e2', '{"action":"login","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"account"}', '2025-11-26 10:47:51.341225+00', ''),
	('00000000-0000-0000-0000-000000000000', '0fdbdfe8-19b1-4940-8f9a-468e9e56f3fd', '{"action":"user_updated_password","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"user"}', '2025-11-26 10:48:17.875902+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f63a1b02-0991-4353-b3b8-7a545bff9cae', '{"action":"user_modified","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"user"}', '2025-11-26 10:48:17.878286+00', ''),
	('00000000-0000-0000-0000-000000000000', '6124b8f5-6637-4ff8-870b-512ca08adf27', '{"action":"user_recovery_requested","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"user"}', '2025-11-26 10:50:00.217056+00', ''),
	('00000000-0000-0000-0000-000000000000', '63379b78-e8fa-4667-a987-508ef7ab8d56', '{"action":"login","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"account"}', '2025-11-26 10:50:29.848679+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c61eebbb-7987-42a0-ab78-4a8386a4a497', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-26 14:42:17.860985+00', ''),
	('00000000-0000-0000-0000-000000000000', '6b9a7818-fcfa-4ee9-af9f-1a45aba1dc2e', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-26 14:42:17.875878+00', ''),
	('00000000-0000-0000-0000-000000000000', '34ed1662-7864-4af9-ab55-c8bb2818ca06', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-26 18:14:35.133503+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a8549071-ec6c-4958-af7a-27b20ab3af1e', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-26 21:17:45.80133+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ebd7e2b4-fd91-405d-be9e-4aec6439ba65', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-26 21:17:45.817035+00', ''),
	('00000000-0000-0000-0000-000000000000', '344566e3-efbb-4528-bc2e-4596dc7d501b', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-26 22:00:20.635626+00', ''),
	('00000000-0000-0000-0000-000000000000', 'df5cb05d-03b8-4658-bffe-ec6d749abcf2', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-26 22:00:20.652992+00', ''),
	('00000000-0000-0000-0000-000000000000', '5db47a1b-7a6a-42cf-b2dc-09fde271b0a9', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-27 00:40:14.634332+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cef8155c-6abc-405a-8e80-47a4662779a8', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-27 00:40:14.651428+00', ''),
	('00000000-0000-0000-0000-000000000000', '31bf7a9f-c0fa-498b-a412-72a431739b54', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-27 00:46:22.855877+00', ''),
	('00000000-0000-0000-0000-000000000000', '15e76337-eba8-43ff-800a-22a420e8e5d5', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-27 01:45:05.984125+00', ''),
	('00000000-0000-0000-0000-000000000000', '1b7f5bdc-9376-452b-b689-e59ddc33c842', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-27 01:45:05.998322+00', ''),
	('00000000-0000-0000-0000-000000000000', '53983b21-7429-4a45-9243-0514215eda13', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-27 01:48:51.297468+00', ''),
	('00000000-0000-0000-0000-000000000000', '5c1d2720-ac82-414f-b388-5f204b38a584', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-27 01:48:51.305411+00', ''),
	('00000000-0000-0000-0000-000000000000', '0ffc0bf2-5082-40d5-8514-45cd25774a4a', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-27 02:45:08.760231+00', ''),
	('00000000-0000-0000-0000-000000000000', '602b578f-9b03-4902-8d10-1fdb9998a7d6', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-27 02:45:08.776874+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd53d156d-9dab-4d20-b647-7279762c6920', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-27 02:47:26.550348+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e8ea43b1-985e-4772-ab3b-61a21cb5c836', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-27 02:47:26.553018+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd85e2212-5153-4930-86d7-3fce8949f36a', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-27 04:01:33.971936+00', ''),
	('00000000-0000-0000-0000-000000000000', '32730dec-609b-48f1-adcc-7f585e38d248', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-27 04:01:33.99364+00', ''),
	('00000000-0000-0000-0000-000000000000', '1f538df3-55f9-4b4a-9a49-80ad814a5a13', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-27 04:03:17.810108+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c667de6d-86fd-476c-a7ed-dea3bb5fb084', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-27 04:03:17.811598+00', ''),
	('00000000-0000-0000-0000-000000000000', '5f85339e-a64f-40cb-8313-d03d4ec0db36', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-27 05:00:24.275477+00', ''),
	('00000000-0000-0000-0000-000000000000', '7623065d-b954-4345-9369-1f625a6d55cf', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-27 05:00:24.289536+00', ''),
	('00000000-0000-0000-0000-000000000000', '6920e2c0-9053-4844-84c9-14ebf89c8e7c', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-27 05:05:05.796029+00', ''),
	('00000000-0000-0000-0000-000000000000', '2cc8a675-0ffc-4bf0-bf16-c8e6646ba58a', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-27 05:05:05.80317+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a18aa3fd-f611-4a45-a374-9f604cbb7b57', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-27 06:00:04.715713+00', ''),
	('00000000-0000-0000-0000-000000000000', '85490e5e-bafb-406b-bc1d-2fdb31dd4f1e', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-27 06:00:04.737382+00', ''),
	('00000000-0000-0000-0000-000000000000', '85cb14cc-3970-4378-8a78-26a95d772116', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-27 06:10:49.163166+00', ''),
	('00000000-0000-0000-0000-000000000000', '486fa521-f9ef-4916-a9fc-a9ff0aafb9d5', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-27 06:10:49.177077+00', ''),
	('00000000-0000-0000-0000-000000000000', '3e26eaab-1f9f-45a4-9e63-a1db3149848b', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-27 06:31:17.12662+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b9dcc57b-697f-49bd-a91c-0456b13040bd', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-27 12:49:01.086182+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b75c929b-7799-4b07-aff1-ea27a3974041', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-27 12:49:01.106075+00', ''),
	('00000000-0000-0000-0000-000000000000', '663da93a-859b-442a-8dad-b05fdc073a5e', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-27 16:30:49.978003+00', ''),
	('00000000-0000-0000-0000-000000000000', '28ee3ab7-6c56-4652-82d9-9671ea6107df', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-27 16:30:49.996228+00', ''),
	('00000000-0000-0000-0000-000000000000', '2fa75310-2f2f-4fea-bab9-96ef5b16c09c', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-27 17:01:48.521626+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fc941a8f-3f5b-4413-8fd2-96d1e222753d', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-27 17:01:48.540408+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a3c4bf64-1b97-4263-86e9-5fc8e8d093bf', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-27 18:05:21.762943+00', ''),
	('00000000-0000-0000-0000-000000000000', '63d57838-45f0-413d-8446-09c24e87f979', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-27 18:05:21.782523+00', ''),
	('00000000-0000-0000-0000-000000000000', '03f0a5e3-19b4-4998-a8ca-74c8720e355b', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-27 19:01:25.013307+00', ''),
	('00000000-0000-0000-0000-000000000000', '2a0d594d-f2ad-4492-8262-71817593dcb2', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-27 19:01:25.029338+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b9d60acd-efec-40eb-b7b9-473b1f89ba89', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-27 19:09:13.704509+00', ''),
	('00000000-0000-0000-0000-000000000000', '79c22d11-a18d-46a7-983c-09c1912ad8b9', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-27 19:11:26.047769+00', ''),
	('00000000-0000-0000-0000-000000000000', '41213c1a-0ec2-4871-a44a-94199ff172e4', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-27 19:11:26.06451+00', ''),
	('00000000-0000-0000-0000-000000000000', '9a9456f3-51d4-4866-9bc1-5a70d5dfe3a9', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-27 20:07:26.761935+00', ''),
	('00000000-0000-0000-0000-000000000000', '36d72a07-4036-411e-b5ab-cfe45868eb9b', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-27 20:07:26.773649+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c04a2b81-0242-4141-9644-b7358f8a97dd', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-27 20:30:32.131346+00', ''),
	('00000000-0000-0000-0000-000000000000', '9c15b608-23af-494c-9f0a-4341a72eba37', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-27 20:30:32.144622+00', ''),
	('00000000-0000-0000-0000-000000000000', '5a10e8fc-f443-4e7c-816a-a592e09bc8ac', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-27 20:54:55.919945+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a56fba00-ee0a-4017-9021-1d77392e9a74', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-27 20:54:55.940546+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c4041abe-3c1e-417e-8fbb-5e34e9a46f27', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-27 21:59:19.869574+00', ''),
	('00000000-0000-0000-0000-000000000000', '8294847e-ce8c-4492-80b2-cc5b0e83bd36', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-27 21:59:19.881831+00', ''),
	('00000000-0000-0000-0000-000000000000', '27c385db-abac-41a9-9c0e-503da62c73f6', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-27 23:23:46.920609+00', ''),
	('00000000-0000-0000-0000-000000000000', '2879df97-15bf-4c03-91c3-350d9e743700', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-27 23:23:46.943457+00', ''),
	('00000000-0000-0000-0000-000000000000', '7504aad1-a8a1-4f69-8de7-114024d0c382', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-28 00:49:07.583459+00', ''),
	('00000000-0000-0000-0000-000000000000', '8c7e4b40-ec8f-422f-adc1-a105de0fb1a0', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-28 00:49:07.598589+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ec01a919-8ee7-403f-8c2a-75c9162f07a2', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-29 15:44:26.88771+00', ''),
	('00000000-0000-0000-0000-000000000000', '796427a4-320d-4719-81ef-bd8dcf6d4b97', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-29 15:44:26.907872+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd68a7f48-4e52-442a-beb6-1b1fb6289b57', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-11-29 15:56:45.651543+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b26bb848-5974-46a8-96d2-e4c9b3134f98', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-29 21:34:07.490968+00', ''),
	('00000000-0000-0000-0000-000000000000', '011284a5-5302-4de6-8705-74cb30dc70f6', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-29 21:34:07.510596+00', ''),
	('00000000-0000-0000-0000-000000000000', '38b3998a-40e4-405d-9cd7-a0f31ce48af1', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-29 22:10:36.177501+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a3924726-4f8b-41eb-a8b2-24f22de02e2c', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-29 22:10:36.192317+00', ''),
	('00000000-0000-0000-0000-000000000000', 'dddbd311-b7ed-4bb6-8be5-9c6ebec3750e', '{"action":"user_recovery_requested","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"user"}', '2025-11-29 23:58:40.093871+00', ''),
	('00000000-0000-0000-0000-000000000000', '0e8b4452-7127-4b81-9f03-d7f87ae8726d', '{"action":"login","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"account"}', '2025-11-29 23:58:51.724127+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cbdb6c57-3b20-4d12-84a7-ad0a69bbae0f', '{"action":"user_updated_password","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"user"}', '2025-11-29 23:59:32.274378+00', ''),
	('00000000-0000-0000-0000-000000000000', '7d6e79e0-4b62-4df6-b32b-05b2ffea7471', '{"action":"user_modified","actor_id":"7b4b20cc-a236-4766-9680-59d917b8f5eb","actor_username":"alediporto18@icloud.com","actor_via_sso":false,"log_type":"user"}', '2025-11-29 23:59:32.276886+00', ''),
	('00000000-0000-0000-0000-000000000000', '66ba62a3-657c-4901-b51e-3af07547ffb0', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-30 10:49:57.899251+00', ''),
	('00000000-0000-0000-0000-000000000000', '9c45e256-1011-48ad-97ff-a35d2116161f', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-30 10:49:57.913844+00', ''),
	('00000000-0000-0000-0000-000000000000', '6d09b77d-86ee-4f32-bd5a-bdf3d2dbb016', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-30 11:04:53.778398+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b57ef34e-0603-4330-9c86-923861072aee', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-30 11:04:53.796959+00', ''),
	('00000000-0000-0000-0000-000000000000', '57b59151-dc5f-4653-8b18-5de91c847443', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-30 14:13:35.368112+00', ''),
	('00000000-0000-0000-0000-000000000000', '081c9d34-d358-47b2-9ef7-398e873df5aa', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-30 14:13:35.385841+00', ''),
	('00000000-0000-0000-0000-000000000000', '31548970-c3c3-49b7-a410-a6812e0a3707', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-30 16:02:27.250755+00', ''),
	('00000000-0000-0000-0000-000000000000', '52add026-3ac8-4f9a-af06-48b2745121f8', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-30 16:02:27.267121+00', ''),
	('00000000-0000-0000-0000-000000000000', '4f68c110-03d1-4a59-9898-9da04d77d591', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-30 18:10:03.116267+00', ''),
	('00000000-0000-0000-0000-000000000000', '91e1fea5-726d-48ac-a59f-e811e5cfc2a2', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-30 18:10:03.13029+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ba6415af-ef4d-4a46-8b12-7fc2fa82154e', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-30 20:58:36.620454+00', ''),
	('00000000-0000-0000-0000-000000000000', '3db7cb43-cc75-497c-ac7a-30e3e9b03904', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-30 20:58:36.635026+00', ''),
	('00000000-0000-0000-0000-000000000000', '66bc19b8-b2e0-43a8-aaa6-efa189407fa9', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-30 21:09:46.382679+00', ''),
	('00000000-0000-0000-0000-000000000000', '6907fcf6-c301-4eab-bdf0-dcf63d917582', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-30 21:09:46.388861+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b767601e-972f-46c7-b448-be306ea77093', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-30 23:08:46.416623+00', ''),
	('00000000-0000-0000-0000-000000000000', '153f807b-7d3e-4332-bfea-e2bed32c4128', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-11-30 23:08:46.43266+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f922a2ec-d92e-4206-91df-742934134215', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-12-01 01:11:01.20498+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e3eafeba-9ef4-4f2e-985e-07d3e33d23a1', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-12-01 01:11:01.217612+00', ''),
	('00000000-0000-0000-0000-000000000000', '936b5891-3fa5-4451-93e3-2aaf0a6a31e4', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-12-01 12:56:21.488387+00', ''),
	('00000000-0000-0000-0000-000000000000', '07c4984d-bb38-4fff-b140-0783586cf6b4', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-12-01 12:56:21.506864+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cdff54b6-2264-4192-a198-915091808723', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-12-01 14:06:20.845032+00', ''),
	('00000000-0000-0000-0000-000000000000', '8b9fd9ce-052d-49de-aae9-560822348ac9', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-12-01 14:06:20.855168+00', ''),
	('00000000-0000-0000-0000-000000000000', '52792326-9169-4268-b529-8cea7e15c2a3', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-12-01 14:08:31.568668+00', ''),
	('00000000-0000-0000-0000-000000000000', '7d072cdf-aa0f-4a2c-8782-cfc330424d9f', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-12-01 14:11:30.85905+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a6292f8b-e26a-4687-8ff8-9ef08a60403c', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-12-01 15:55:52.474681+00', ''),
	('00000000-0000-0000-0000-000000000000', '5649da49-9dad-4e28-83d4-2bb40d115817', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-12-01 15:55:52.485206+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f826051f-61cc-4ae3-8d3b-6062740f7155', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-12-01 15:56:22.622827+00', ''),
	('00000000-0000-0000-0000-000000000000', '862c9684-61ee-43b5-8e89-9e2ff0149d92', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-12-01 15:56:22.626947+00', ''),
	('00000000-0000-0000-0000-000000000000', '1eadba8c-36d6-4e42-86ca-43564e800ecd', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-12-01 21:42:54.811872+00', ''),
	('00000000-0000-0000-0000-000000000000', 'dc970a20-8f64-4737-9865-92b0776e7264', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-12-01 21:42:54.825439+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b4190b52-377c-421c-a81a-81ab2a91df4f', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-12-01 22:53:18.964717+00', ''),
	('00000000-0000-0000-0000-000000000000', '27f39c05-f708-4cd4-9a52-8a3c45ed2023', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-12-01 22:53:18.979669+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd8b26507-4947-4758-a3b2-73244bb57721', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-12-02 00:05:08.162871+00', ''),
	('00000000-0000-0000-0000-000000000000', '86807f81-170d-4e93-be3d-be0fb76750d6', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-12-02 00:05:08.179412+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e7b8825d-19f5-4cfb-8600-13fdb0202268', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-12-02 00:06:32.747595+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c4f78d02-853c-41eb-815f-97a4df7b6a31', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-12-02 00:06:32.749499+00', ''),
	('00000000-0000-0000-0000-000000000000', '07938cd8-3811-4f02-8f92-419445e8ff40', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-12-02 01:42:10.694259+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cf8b6a9a-a621-49a6-838a-d7bd39ebc197', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-12-02 01:42:10.713067+00', ''),
	('00000000-0000-0000-0000-000000000000', '76285d1e-6f0c-455d-9f9c-21aca98b361b', '{"action":"token_refreshed","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-12-02 15:43:58.272169+00', ''),
	('00000000-0000-0000-0000-000000000000', '2606a36d-8d64-4b29-bd55-ba9dbd1191ba', '{"action":"token_revoked","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"token"}', '2025-12-02 15:43:58.292723+00', ''),
	('00000000-0000-0000-0000-000000000000', '12bd0b35-4a52-4a19-b67c-122d1f3ca4db', '{"action":"logout","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account"}', '2025-12-02 16:41:43.738818+00', ''),
	('00000000-0000-0000-0000-000000000000', '3e88fe1a-6516-42ad-aad1-a9ea4ee5545c', '{"action":"user_repeated_signup","actor_id":"8a233ec1-9d01-47d9-9f2e-a40814138c44","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-12-02 16:46:30.891417+00', ''),
	('00000000-0000-0000-0000-000000000000', '0bf7a7db-d8b9-4b0d-a74e-b346d5bef038', '{"action":"user_repeated_signup","actor_id":"8a233ec1-9d01-47d9-9f2e-a40814138c44","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-12-02 16:48:21.532222+00', ''),
	('00000000-0000-0000-0000-000000000000', '5606c19a-4567-450d-8c3a-de20b98834c0', '{"action":"user_repeated_signup","actor_id":"8a233ec1-9d01-47d9-9f2e-a40814138c44","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-12-02 16:49:04.387672+00', ''),
	('00000000-0000-0000-0000-000000000000', '66c93b10-fce4-4fa6-8a61-a7e0d3a49194', '{"action":"user_repeated_signup","actor_id":"8a233ec1-9d01-47d9-9f2e-a40814138c44","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-12-02 16:50:07.24786+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b9f7b206-b039-474d-bcd1-f847a2112384', '{"action":"user_repeated_signup","actor_id":"8a233ec1-9d01-47d9-9f2e-a40814138c44","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-12-02 16:59:52.877958+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c3f6f55c-508a-4f51-a19d-ef28d4cd1e11', '{"action":"user_repeated_signup","actor_id":"8a233ec1-9d01-47d9-9f2e-a40814138c44","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-12-02 17:00:57.555039+00', ''),
	('00000000-0000-0000-0000-000000000000', '838c9948-2d76-4219-8aeb-f4b1db80185f', '{"action":"login","actor_id":"8a233ec1-9d01-47d9-9f2e-a40814138c44","actor_username":"runavii7@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-12-02 17:02:56.432577+00', ''),
	('00000000-0000-0000-0000-000000000000', '6fef5d5a-3545-4cdb-9bc9-3c55cba1735c', '{"action":"login","actor_id":"c23a8c58-925a-47ce-9491-9e0db8b5c16a","actor_username":"ouazanaruben@icloud.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-12-02 18:36:06.77728+00', '');


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."users" ("instance_id", "id", "aud", "role", "email", "encrypted_password", "email_confirmed_at", "invited_at", "confirmation_token", "confirmation_sent_at", "recovery_token", "recovery_sent_at", "email_change_token_new", "email_change", "email_change_sent_at", "last_sign_in_at", "raw_app_meta_data", "raw_user_meta_data", "is_super_admin", "created_at", "updated_at", "phone", "phone_confirmed_at", "phone_change", "phone_change_token", "phone_change_sent_at", "email_change_token_current", "email_change_confirm_status", "banned_until", "reauthentication_token", "reauthentication_sent_at", "is_sso_user", "deleted_at", "is_anonymous") VALUES
	('00000000-0000-0000-0000-000000000000', '8a233ec1-9d01-47d9-9f2e-a40814138c44', 'authenticated', 'authenticated', 'runavii7@gmail.com', '$2a$10$aJw072eqW284qDUtBO/EauvsY5Fyhmte6x2Bg2GFwcqq.Tr.Q8lQu', '2025-11-23 22:04:44.019453+00', NULL, '', '2025-11-23 22:04:31.053324+00', '', NULL, '', '', NULL, '2025-12-02 17:02:56.435692+00', '{"provider": "email", "providers": ["email"]}', '{"sub": "8a233ec1-9d01-47d9-9f2e-a40814138c44", "role": "Proprietario", "email": "runavii7@gmail.com", "last_name": "Ouazana", "first_name": "Alberto", "company_name": "Samuel srl", "company_vat_id": "11941901008", "email_verified": true, "phone_verified": false, "headquarters_name": "Bellacarne Kosher Restaurant", "headquarters_address": "Via del Portico d''Ottavia 51"}', NULL, '2025-11-23 22:04:30.917598+00', '2025-12-02 17:02:56.453345+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '7c263c3e-11b2-468e-a74d-98910c429842', 'authenticated', 'authenticated', 'aledip06@gmail.com', '$2a$10$FV.YwJfvZG1930zjwcT9/OVSMg3ojdIKD9ZodWDh4aG5uzqlwDCyG', '2025-09-25 14:53:06.959369+00', NULL, '', '2025-09-25 14:52:43.109716+00', '', NULL, '', '', NULL, '2025-10-16 12:30:24.82103+00', '{"provider": "email", "providers": ["email"]}', '{"sub": "7c263c3e-11b2-468e-a74d-98910c429842", "email": "aledip06@gmail.com", "email_verified": true, "phone_verified": false}', NULL, '2025-09-25 14:52:43.048689+00', '2025-11-20 10:13:22.496499+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'authenticated', 'authenticated', 'ouazanaruben@icloud.com', '$2a$10$/w3FeN/9TGkeNpfwnEnbVefdB73Bv7BLwFEonmLEjm0taWvZl1YDa', '2025-09-22 12:17:18.378675+00', NULL, '', '2025-09-22 12:17:07.184443+00', 'de8b4b89907ccf4b9ec8d13beb94f3c9e9b2c19a794d8eb33761d601', '2025-11-10 16:55:01.053839+00', '', '', NULL, '2025-12-02 18:36:06.794262+00', '{"provider": "email", "providers": ["email"]}', '{"sub": "c23a8c58-925a-47ce-9491-9e0db8b5c16a", "email": "ouazanaruben@icloud.com", "email_verified": true, "phone_verified": false}', NULL, '2025-09-22 12:17:07.141226+00', '2025-12-02 18:36:06.843997+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '7b4b20cc-a236-4766-9680-59d917b8f5eb', 'authenticated', 'authenticated', 'alediporto18@icloud.com', '$2a$10$oXfedaoXLLHa1htBWrRzTOwudTdwGLHMY4iGNZc2y2nKsfyXSJXS2', '2025-09-25 14:53:13.015903+00', NULL, '', NULL, '', NULL, '', '', NULL, '2025-11-29 23:58:51.734343+00', '{"provider": "email", "providers": ["email"]}', '{"sub": "7b4b20cc-a236-4766-9680-59d917b8f5eb", "email": "alediporto18@icloud.com", "email_verified": true, "phone_verified": false}', NULL, '2025-09-25 14:49:42.707115+00', '2025-11-29 23:59:32.267851+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', 'b0dfdcee-ff52-4efd-9ed5-6452f98945fe', 'authenticated', 'authenticated', 'pinatolaura@gmail.com', '$2a$10$C/7sF2ZcVnFuKIQyhcEeWuVg9042049z9Ct5cpVOYoeD6Iq2oj3ZG', '2025-10-13 18:28:52.381368+00', NULL, '', '2025-10-13 18:28:06.828015+00', '', NULL, '', '', NULL, '2025-11-05 18:02:02.450865+00', '{"provider": "email", "providers": ["email"]}', '{"sub": "b0dfdcee-ff52-4efd-9ed5-6452f98945fe", "email": "pinatolaura@gmail.com", "email_verified": true, "phone_verified": false}', NULL, '2025-10-13 18:28:06.791153+00', '2025-11-05 19:41:34.868419+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false);


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."identities" ("provider_id", "user_id", "identity_data", "provider", "last_sign_in_at", "created_at", "updated_at", "id") VALUES
	('c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '{"sub": "c23a8c58-925a-47ce-9491-9e0db8b5c16a", "email": "ouazanaruben@icloud.com", "email_verified": true, "phone_verified": false}', 'email', '2025-09-22 12:17:07.173287+00', '2025-09-22 12:17:07.173959+00', '2025-09-22 12:17:07.173959+00', '0170a5bb-b92b-4af1-bd56-f00f03b8f47c'),
	('7c263c3e-11b2-468e-a74d-98910c429842', '7c263c3e-11b2-468e-a74d-98910c429842', '{"sub": "7c263c3e-11b2-468e-a74d-98910c429842", "email": "aledip06@gmail.com", "email_verified": true, "phone_verified": false}', 'email', '2025-09-25 14:52:43.090788+00', '2025-09-25 14:52:43.090849+00', '2025-09-25 14:52:43.090849+00', '6cfa1fc8-42d6-4757-9774-b37f3f695ee1'),
	('7b4b20cc-a236-4766-9680-59d917b8f5eb', '7b4b20cc-a236-4766-9680-59d917b8f5eb', '{"sub": "7b4b20cc-a236-4766-9680-59d917b8f5eb", "email": "alediporto18@icloud.com", "email_verified": true, "phone_verified": false}', 'email', '2025-09-25 14:49:42.733815+00', '2025-09-25 14:49:42.733867+00', '2025-09-25 14:49:42.733867+00', '1b975c37-e90e-4e89-acd1-e5ac1e329f00'),
	('b0dfdcee-ff52-4efd-9ed5-6452f98945fe', 'b0dfdcee-ff52-4efd-9ed5-6452f98945fe', '{"sub": "b0dfdcee-ff52-4efd-9ed5-6452f98945fe", "email": "pinatolaura@gmail.com", "email_verified": true, "phone_verified": false}', 'email', '2025-10-13 18:28:06.818757+00', '2025-10-13 18:28:06.81881+00', '2025-10-13 18:28:06.81881+00', 'a09abea0-94d0-4f17-9428-bc6f0ff8cf06'),
	('8a233ec1-9d01-47d9-9f2e-a40814138c44', '8a233ec1-9d01-47d9-9f2e-a40814138c44', '{"sub": "8a233ec1-9d01-47d9-9f2e-a40814138c44", "role": "Proprietario", "email": "runavii7@gmail.com", "last_name": "Ouazana", "first_name": "Alberto", "company_name": "Samuel srl", "company_vat_id": "11941901008", "email_verified": true, "phone_verified": false, "headquarters_name": "Bellacarne Kosher Restaurant", "headquarters_address": "Via del Portico d''Ottavia 51"}', 'email', '2025-11-23 22:04:31.030184+00', '2025-11-23 22:04:31.03144+00', '2025-11-23 22:04:31.03144+00', '41a46ded-41bc-40de-bb09-af3bd73222b2');


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."sessions" ("id", "user_id", "created_at", "updated_at", "factor_id", "aal", "not_after", "refreshed_at", "user_agent", "ip", "tag", "oauth_client_id", "refresh_token_hmac_key", "refresh_token_counter", "scopes") VALUES
	('4583ea81-bc4a-4877-b803-8cd11e7893cc', 'b0dfdcee-ff52-4efd-9ed5-6452f98945fe', '2025-11-05 18:02:02.450961+00', '2025-11-05 18:02:02.450961+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1', '78.209.192.101', NULL, NULL, NULL, NULL, NULL),
	('fd1db27a-542c-4682-80f5-ff1be72333a3', 'b0dfdcee-ff52-4efd-9ed5-6452f98945fe', '2025-10-13 18:28:52.384779+00', '2025-11-05 19:41:34.880717+00', NULL, 'aal1', NULL, '2025-11-05 19:41:34.879966', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/138.0.7204.119 Mobile/15E148 Safari/604.1', '78.209.192.101', NULL, NULL, NULL, NULL, NULL),
	('633e30db-08b9-419b-9d45-1f99fc207fe7', '7b4b20cc-a236-4766-9680-59d917b8f5eb', '2025-11-29 23:58:51.735559+00', '2025-11-29 23:58:51.735559+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '147.235.201.33', NULL, NULL, NULL, NULL, NULL),
	('18e052d4-2853-4108-b6c9-9f03865e35c0', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '2025-12-02 18:36:06.795076+00', '2025-12-02 18:36:06.795076+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '2.44.239.73', NULL, NULL, NULL, NULL, NULL),
	('bd89ffd8-2244-49a3-83c8-bd54c2e9324c', '8a233ec1-9d01-47d9-9f2e-a40814138c44', '2025-12-02 17:02:56.436717+00', '2025-12-02 17:02:56.436717+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '2.44.239.73', NULL, NULL, NULL, NULL, NULL),
	('dd710504-a215-437c-97b9-96122691c95e', 'b0dfdcee-ff52-4efd-9ed5-6452f98945fe', '2025-10-16 10:09:32.489599+00', '2025-10-16 10:09:32.489599+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1', '37.161.252.39', NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."mfa_amr_claims" ("session_id", "created_at", "updated_at", "authentication_method", "id") VALUES
	('18e052d4-2853-4108-b6c9-9f03865e35c0', '2025-12-02 18:36:06.851841+00', '2025-12-02 18:36:06.851841+00', 'password', 'd379a252-9089-4939-a578-d8e7bc4bff99'),
	('4583ea81-bc4a-4877-b803-8cd11e7893cc', '2025-11-05 18:02:02.462731+00', '2025-11-05 18:02:02.462731+00', 'password', '4cadadcc-7d25-41fc-9585-d7cfce6aac63'),
	('fd1db27a-542c-4682-80f5-ff1be72333a3', '2025-10-13 18:28:52.396046+00', '2025-10-13 18:28:52.396046+00', 'otp', '9760d099-4b55-4c29-a45a-4a31eb340cf9'),
	('dd710504-a215-437c-97b9-96122691c95e', '2025-10-16 10:09:32.494787+00', '2025-10-16 10:09:32.494787+00', 'password', '06049efd-59b5-4d7e-947f-1b7a34733c9b'),
	('633e30db-08b9-419b-9d45-1f99fc207fe7', '2025-11-29 23:58:51.783812+00', '2025-11-29 23:58:51.783812+00', 'otp', '28ff2b38-9e5f-4eb5-bcac-b0c1dc92a643'),
	('bd89ffd8-2244-49a3-83c8-bd54c2e9324c', '2025-12-02 17:02:56.45543+00', '2025-12-02 17:02:56.45543+00', 'password', '0c234d14-0d71-4349-af35-a9c7c79024fe');


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: oauth_authorizations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: oauth_consents; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."one_time_tokens" ("id", "user_id", "token_type", "token_hash", "relates_to", "created_at", "updated_at") VALUES
	('e2ea7e68-da07-4715-a1a0-7f60d7867cd4', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'recovery_token', 'de8b4b89907ccf4b9ec8d13beb94f3c9e9b2c19a794d8eb33761d601', 'ouazanaruben@icloud.com', '2025-11-10 16:55:01.665767', '2025-11-10 16:55:01.665767');


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."refresh_tokens" ("instance_id", "id", "token", "user_id", "revoked", "created_at", "updated_at", "parent", "session_id") VALUES
	('00000000-0000-0000-0000-000000000000', 878, 'ef465qbegixg', '8a233ec1-9d01-47d9-9f2e-a40814138c44', false, '2025-12-02 17:02:56.449308+00', '2025-12-02 17:02:56.449308+00', NULL, 'bd89ffd8-2244-49a3-83c8-bd54c2e9324c'),
	('00000000-0000-0000-0000-000000000000', 856, 'cxeawmsyv3xx', '7b4b20cc-a236-4766-9680-59d917b8f5eb', false, '2025-11-29 23:58:51.760548+00', '2025-11-29 23:58:51.760548+00', NULL, '633e30db-08b9-419b-9d45-1f99fc207fe7'),
	('00000000-0000-0000-0000-000000000000', 879, 'urloni6qui66', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', false, '2025-12-02 18:36:06.817642+00', '2025-12-02 18:36:06.817642+00', NULL, '18e052d4-2853-4108-b6c9-9f03865e35c0'),
	('00000000-0000-0000-0000-000000000000', 151, 'rlsj3c3fv2gt', 'b0dfdcee-ff52-4efd-9ed5-6452f98945fe', true, '2025-10-14 11:32:47.839681+00', '2025-11-05 18:01:26.325252+00', 'wtrtpkgyk5pp', 'fd1db27a-542c-4682-80f5-ff1be72333a3'),
	('00000000-0000-0000-0000-000000000000', 508, 'i5zr3rwh344s', 'b0dfdcee-ff52-4efd-9ed5-6452f98945fe', false, '2025-11-05 18:02:02.460621+00', '2025-11-05 18:02:02.460621+00', NULL, '4583ea81-bc4a-4877-b803-8cd11e7893cc'),
	('00000000-0000-0000-0000-000000000000', 507, 'loupb72gzdga', 'b0dfdcee-ff52-4efd-9ed5-6452f98945fe', true, '2025-11-05 18:01:26.341827+00', '2025-11-05 19:41:34.839512+00', 'rlsj3c3fv2gt', 'fd1db27a-542c-4682-80f5-ff1be72333a3'),
	('00000000-0000-0000-0000-000000000000', 137, 'wtrtpkgyk5pp', 'b0dfdcee-ff52-4efd-9ed5-6452f98945fe', true, '2025-10-13 18:28:52.39418+00', '2025-10-14 11:32:47.833215+00', NULL, 'fd1db27a-542c-4682-80f5-ff1be72333a3'),
	('00000000-0000-0000-0000-000000000000', 509, 'fydg7acq37np', 'b0dfdcee-ff52-4efd-9ed5-6452f98945fe', false, '2025-11-05 19:41:34.85971+00', '2025-11-05 19:41:34.85971+00', 'loupb72gzdga', 'fd1db27a-542c-4682-80f5-ff1be72333a3'),
	('00000000-0000-0000-0000-000000000000', 247, '5u7qf63cdzg2', 'b0dfdcee-ff52-4efd-9ed5-6452f98945fe', false, '2025-10-16 10:09:32.49298+00', '2025-10-16 10:09:32.49298+00', NULL, 'dd710504-a215-437c-97b9-96122691c95e');


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."companies" ("id", "owner_id", "name", "vat_id", "address", "created_at", "subscription_tier", "trial_start_date", "trial_end_date") VALUES
	('9effd27d-2c09-4cf8-8f75-1be4e706b568', 'b0dfdcee-ff52-4efd-9ed5-6452f98945fe', NULL, NULL, NULL, '2025-11-04 22:49:27.929317+00', 'base', NULL, NULL),
	('fca229ba-bd84-466f-a75b-e229c81cf177', '7c263c3e-11b2-468e-a74d-98910c429842', NULL, NULL, NULL, '2025-11-04 22:49:27.929317+00', 'base', NULL, NULL),
	('b4e74a2c-ad72-4635-a77c-c4a8cd0f57ec', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'Ruben SRL', '17711311005', 'Via del Portico d''Ottavia 14', '2025-11-04 22:49:27.929317+00', 'pro', NULL, NULL),
	('03d15439-51ea-4166-8e85-2c84fd16080d', '7b4b20cc-a236-4766-9680-59d917b8f5eb', '', '', '', '2025-11-04 22:49:27.929317+00', 'base', NULL, NULL),
	('ae85980a-571a-4a63-8039-387d55fbd3fd', '8a233ec1-9d01-47d9-9f2e-a40814138c44', 'Samuel srl', '11941901008', 'Via del Portico d''Ottavia 51', '2025-11-23 22:04:30.914652+00', 'demo', '2025-11-23 22:04:30.914652+00', '2025-12-23 22:04:30.914652+00');


--
-- Data for Name: in_app_profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."in_app_profiles" ("id", "user_id", "profile_name", "pin_hash", "created_at", "pin_salt", "position", "company_id") VALUES
	('147715a0-d234-459a-933a-483244a26776', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'Ruben Ouazana', '7eaf12586cf18fb11716bd5019ed684c:9e49732187712e704f923ceb06e93b5edc7f50380c728f88d3e1a550e0aa3bc5', '2025-11-03 11:36:14.356443+00', NULL, 'Proprietario', 'b4e74a2c-ad72-4635-a77c-c4a8cd0f57ec'),
	('3b9a2f1f-2754-4925-b188-feff643bd8e0', '7b4b20cc-a236-4766-9680-59d917b8f5eb', 'Alessandro Di Porto', NULL, '2025-11-03 11:36:14.356443+00', NULL, NULL, '03d15439-51ea-4166-8e85-2c84fd16080d'),
	('7aa3e75d-8fe4-49a4-974d-20f673621606', 'b0dfdcee-ff52-4efd-9ed5-6452f98945fe', 'pinatolaura@gmail.com', NULL, '2025-11-03 11:36:14.356443+00', NULL, NULL, '9effd27d-2c09-4cf8-8f75-1be4e706b568'),
	('0d3e180a-8a01-4ec8-9941-5f92bb162103', '7c263c3e-11b2-468e-a74d-98910c429842', 'aledip06@gmail.com', NULL, '2025-11-03 11:36:14.356443+00', NULL, NULL, 'fca229ba-bd84-466f-a75b-e229c81cf177'),
	('dbe57273-b05b-4486-8991-0563bb2e602e', '8a233ec1-9d01-47d9-9f2e-a40814138c44', 'Alberto Ouazana', NULL, '2025-11-23 22:04:30.914652+00', NULL, 'Proprietario', 'ae85980a-571a-4a63-8039-387d55fbd3fd'),
	('53ee25b9-c461-4ab4-893b-fb3a4e4dd1b8', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'Street', '821ce8b90a3c6ec0487a8be3bfe14f1c:16fc5f3aacb2f5cb2ec91f68762d7126608b3bea4355f890c2162a69884e1281', '2025-11-12 14:08:07.342822+00', NULL, 'Banchista', 'b4e74a2c-ad72-4635-a77c-c4a8cd0f57ec');


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: ordini_multipli; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: suppliers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."suppliers" ("id", "name", "contact_method", "contact", "message_template", "created_at", "updated_at", "email_subject", "user_id", "products", "preferred_email_client") VALUES
	('c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'Carlo BC-SF', 'whatsapp', '+39 3396011644', 'X SF:', '2025-09-24 13:13:23.437778+00', '2025-11-13 10:32:48.585191+00', '', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '[]', 'default'),
	('5778f4ad-dc14-4318-b283-5fc6bfd7a258', 'SIGNORA BC-SF', 'whatsapp', '+393396202599', 'X SF:', '2025-09-25 14:41:17.056865+00', '2025-11-13 10:34:31.051924+00', '', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '[]', 'default'),
	('df99037c-1085-4760-bbbf-cac576ba9e6f', 'Fruttivendolo BC-SF', 'whatsapp_group', 'Ordini Frutteria RUBEN SRL', 'Per Ruben SRL:', '2025-09-24 13:22:40.155946+00', '2025-11-23 23:33:50.116789+00', '', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '[]', 'default'),
	('f5304bc9-32bf-486e-8d34-d719028d51f4', 'Faic BC-SF', 'email', 'info@faic.it', '', '2025-09-24 13:19:45.697043+00', '2025-11-30 21:10:17.684442+00', 'Per Ruben Srl entro le 10: ', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '[]', 'gmail'),
	('377eb876-bdd8-417e-b7c4-c473371e9edf', 'Magazzino BC-SF', 'whatsapp', '+39 3336625987', 'X SF:', '2025-09-25 21:31:45.812902+00', '2025-11-30 21:10:39.923122+00', '', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '[]', 'default'),
	('a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Marco Fornaio', 'whatsapp', '+39 3382475125', 'Ciao Marco per domani ', '2025-09-25 21:34:08.77967+00', '2025-10-26 19:03:02.238805+00', NULL, 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '[]', 'default'),
	('9567d72a-7060-4a1d-b913-7d342aa2b352', 'ruben merda', 'whatsapp', '3347812355', 'Buongiorno, vorremmo ordinare i seguenti prodotti:', '2025-09-25 14:59:18.219475+00', '2025-10-26 19:23:47.970726+00', NULL, '7b4b20cc-a236-4766-9680-59d917b8f5eb', '[]', 'default'),
	('a0fd8b52-6014-4920-9409-2abb93ca0f3a', 'jojojoj', 'whatsapp', '3347812355', 'Buongiorno, vorremmo ordinare i seguenti prodotti:', '2025-10-20 15:35:19.108305+00', '2025-10-26 19:23:56.397171+00', NULL, '7b4b20cc-a236-4766-9680-59d917b8f5eb', '[]', 'default'),
	('1f5a15dc-43a6-4985-a9b4-8f73997d4443', 'samuel merda', 'whatsapp', '+39 327 477 7190', 'Buongiorno, vorremmo ordinare i seguenti prodotti:', '2025-09-29 14:47:10.45837+00', '2025-10-26 19:24:14.402927+00', NULL, '7b4b20cc-a236-4766-9680-59d917b8f5eb', '[]', 'default'),
	('cd0d2dd8-82b6-48f4-9620-fb4129d3bf40', 'ioioi', 'whatsapp', '3460258498', 'Buongiorno, vorremmo ordinare i seguenti prodotti:', '2025-10-20 15:35:36.634984+00', '2025-10-26 19:24:24.423317+00', NULL, '7b4b20cc-a236-4766-9680-59d917b8f5eb', '[]', 'default');


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."orders" ("id", "user_id", "supplier_id", "order_message", "additional_items", "status", "scheduled_date", "sent_at", "created_at", "ordine_multiplo_id") VALUES
	('67036b64-132c-44bf-bad0-fca26c1c2699', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Per Ruben Srl entro le 10: 


• Sale Bustine: 3
• Songino: 6

Grazie!', NULL, 'sent', NULL, '2025-09-24 13:20:06.064723+00', '2025-09-24 13:20:06.064723+00', NULL),
	('860d8c10-6948-4cd8-903d-0fedbdacef4e', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'df99037c-1085-4760-bbbf-cac576ba9e6f', '

• Cetrioli: 8

Grazie!', NULL, 'sent', NULL, '2025-09-24 16:01:01.420377+00', '2025-09-24 16:01:01.420377+00', NULL),
	('0c7ec916-534c-4319-86a9-3c3ae2451cc2', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'df99037c-1085-4760-bbbf-cac576ba9e6f', '

• Grappolo: u
• Cetrioli: 6

Grazie!', NULL, 'sent', NULL, '2025-09-24 16:29:18.439003+00', '2025-09-24 16:29:18.439003+00', NULL),
	('4db4fa5c-6478-41f8-9f19-81a058f8cc1c', '7b4b20cc-a236-4766-9680-59d917b8f5eb', '9567d72a-7060-4a1d-b913-7d342aa2b352', 'Buongiorno, vorremmo ordinare i seguenti prodotti:

• glock: 10
• colpi: 10 scatole
• lancia granate: 3
• carri armate: 4

Prodotti aggiuntivi:
m4 6
colpi 223 6 scatole

Grazie!', 'm4 6
colpi 223 6 scatole', 'sent', NULL, '2025-09-25 15:01:55.578051+00', '2025-09-25 15:01:55.578051+00', NULL),
	('21036cbc-039d-4cb1-9e61-9f3a8e026980', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Per Ruben Srl entro le 10: 


• Rucola: 2
• Quasar Vetri: 1 C
• Semola Rimacinata: 2
• Rotoli carta: 2

Grazie!', NULL, 'sent', NULL, '2025-09-25 21:35:37.996406+00', '2025-09-25 21:35:37.996406+00', NULL),
	('9a08fded-ee34-4aa4-bd4d-998eea493797', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', 'X SF:

• Asado: 1

Grazie!', NULL, 'sent', NULL, '2025-09-25 21:38:18.493823+00', '2025-09-25 21:38:18.493823+00', NULL),
	('f3eeb6f9-bc34-4a3f-a74f-8427935297f8', '7b4b20cc-a236-4766-9680-59d917b8f5eb', '9567d72a-7060-4a1d-b913-7d342aa2b352', 'Buongiorno, vorremmo ordinare i seguenti prodotti:

• glock: 2
• colpi: 3

Grazie!', NULL, 'sent', NULL, '2025-09-25 21:41:55.347129+00', '2025-09-25 21:41:55.347129+00', NULL),
	('bb7488b2-6fb9-424a-8684-f215fd7894ac', '7b4b20cc-a236-4766-9680-59d917b8f5eb', '9567d72a-7060-4a1d-b913-7d342aa2b352', 'Buongiorno, vorremmo ordinare i seguenti prodotti:

• glock: 1
• colpi: 2

Grazie!', NULL, 'sent', NULL, '2025-09-25 21:42:18.473026+00', '2025-09-25 21:42:18.473026+00', NULL),
	('e6b4ca5f-4614-4bcf-b06c-2034a260eabc', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1

Grazie!', NULL, 'sent', NULL, '2025-09-25 21:43:26.13019+00', '2025-09-25 21:43:26.13019+00', NULL),
	('706cef70-cf36-4dce-a3e4-34749742c111', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1

Grazie!', NULL, 'sent', NULL, '2025-09-26 10:24:34.439354+00', '2025-09-26 10:24:34.439354+00', NULL),
	('f0635167-20ce-4c59-8ed2-63ee79116621', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1

Grazie!', NULL, 'sent', NULL, '2025-09-26 10:25:09.135419+00', '2025-09-26 10:25:09.135419+00', NULL),
	('1cdd11d5-29b5-4750-af16-1cc967537edb', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1

Grazie!', NULL, 'sent', NULL, '2025-09-26 10:26:04.64231+00', '2025-09-26 10:26:04.64231+00', NULL),
	('387e5523-7e6a-4db1-ad3d-339652e1abde', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', 'X SF:

• Carne secca: 1

Grazie!', NULL, 'sent', NULL, '2025-09-26 10:26:35.25641+00', '2025-09-26 10:26:35.25641+00', NULL),
	('9c275e83-5588-4d51-80aa-4efe65f2d93f', '7b4b20cc-a236-4766-9680-59d917b8f5eb', '1f5a15dc-43a6-4985-a9b4-8f73997d4443', 'Buongiorno, vorremmo ordinare i seguenti prodotti:

• glock: 1
• colpi: 1
• lancia granate: 1
• carri armate: troppi
• bistecche: 2
• pollo: 3
• nuggets: 2
• sefarimmi: 2

Grazie!', NULL, 'sent', NULL, '2025-09-29 14:47:40.927005+00', '2025-09-29 14:47:40.927005+00', NULL),
	('637d521c-79a8-4101-8451-a7332e95153c', '7b4b20cc-a236-4766-9680-59d917b8f5eb', '9567d72a-7060-4a1d-b913-7d342aa2b352', 'Buongiorno, vorremmo ordinare i seguenti prodotti:

• glock: w

Grazie!', NULL, 'sent', NULL, '2025-09-29 14:48:00.51473+00', '2025-09-29 14:48:00.51473+00', NULL),
	('83f2d9ce-60ae-405b-bb7f-7e3af3aea2b6', '7b4b20cc-a236-4766-9680-59d917b8f5eb', '9567d72a-7060-4a1d-b913-7d342aa2b352', 'Buongiorno, vorremmo ordinare i seguenti prodotti:

• bistecche: e
• glock: e

Grazie!', NULL, 'sent', NULL, '2025-09-29 14:48:24.631982+00', '2025-09-29 14:48:24.631982+00', NULL),
	('230971fd-1ed3-43ed-8aa5-44494c4dddf6', '7b4b20cc-a236-4766-9680-59d917b8f5eb', '1f5a15dc-43a6-4985-a9b4-8f73997d4443', 'Buongiorno, vorremmo ordinare i seguenti prodotti:

• glock: 1
• bistecche: 1

Grazie!', NULL, 'sent', NULL, '2025-09-29 14:49:06.838604+00', '2025-09-29 14:49:06.838604+00', NULL),
	('6e5563f3-c3a1-4a85-99c8-4838f2ea224e', '7b4b20cc-a236-4766-9680-59d917b8f5eb', '9567d72a-7060-4a1d-b913-7d342aa2b352', 'Buongiorno, vorremmo ordinare i seguenti prodotti:

• glock: 1

Grazie!', NULL, 'sent', NULL, '2025-09-30 09:12:22.464765+00', '2025-09-30 09:12:22.464765+00', NULL),
	('fea917df-c79c-468a-86da-cc7be576c734', '7b4b20cc-a236-4766-9680-59d917b8f5eb', '9567d72a-7060-4a1d-b913-7d342aa2b352', 'Buongiorno, vorremmo ordinare i seguenti prodotti:

• glock: 10 pz

Grazie!', NULL, 'sent', NULL, '2025-10-10 10:04:12.159346+00', '2025-10-10 10:04:12.159346+00', NULL),
	('3ac5918a-8fd6-41dc-8e8d-89a8cba2e09d', '7b4b20cc-a236-4766-9680-59d917b8f5eb', '9567d72a-7060-4a1d-b913-7d342aa2b352', 'Buongiorno, vorremmo ordinare i seguenti prodotti:

• glock: 10 pz

Grazie!', NULL, 'sent', NULL, '2025-10-10 10:04:26.762992+00', '2025-10-10 10:04:26.762992+00', NULL),
	('d6dba468-cdb7-45c4-a23a-223fdff757a6', '7b4b20cc-a236-4766-9680-59d917b8f5eb', '9567d72a-7060-4a1d-b913-7d342aa2b352', 'Buongiorno, vorremmo ordinare i seguenti prodotti:

• glock: 10 pz

Grazie!', NULL, 'sent', NULL, '2025-10-10 10:04:48.098257+00', '2025-10-10 10:04:48.098257+00', NULL),
	('80314d52-7449-4bde-a16f-8c2e43f89398', '7b4b20cc-a236-4766-9680-59d917b8f5eb', '9567d72a-7060-4a1d-b913-7d342aa2b352', 'Buongiorno, vorremmo ordinare i seguenti prodotti:

• glock: 4

Grazie!', NULL, 'sent', NULL, '2025-10-10 10:05:31.041484+00', '2025-10-10 10:05:31.041484+00', NULL),
	('7de230b4-fc01-4c34-be60-e51bb09cccdf', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 4

Grazie!', NULL, 'sent', NULL, '2025-10-10 10:05:32.873411+00', '2025-10-10 10:05:32.873411+00', NULL),
	('caaec1bf-17f2-48c7-9906-b2faf56d437c', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Bomba Piccante: 1

Grazie!', NULL, 'sent', NULL, '2025-10-10 10:05:53.867619+00', '2025-10-10 10:05:53.867619+00', NULL),
	('fa7c5dc2-5669-464c-b8da-636471168d59', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Per Ruben Srl entro le 10: 


• Sale Bustine: 1

Grazie!', NULL, 'sent', NULL, '2025-10-10 10:06:33.260437+00', '2025-10-10 10:06:33.260437+00', NULL),
	('916335ae-e32b-44f9-b6ae-b20e79e1692c', '7b4b20cc-a236-4766-9680-59d917b8f5eb', '9567d72a-7060-4a1d-b913-7d342aa2b352', 'Buongiorno, vorremmo ordinare i seguenti prodotti:

• glock: 2

Grazie!', NULL, 'sent', NULL, '2025-10-10 10:06:34.928191+00', '2025-10-10 10:06:34.928191+00', NULL),
	('b9f13435-0326-4283-ac21-2e8ef41ee692', '7b4b20cc-a236-4766-9680-59d917b8f5eb', '9567d72a-7060-4a1d-b913-7d342aa2b352', 'Buongiorno, vorremmo ordinare i seguenti prodotti:

• glock: 2

Grazie!', NULL, 'sent', NULL, '2025-10-10 10:07:05.116363+00', '2025-10-10 10:07:05.116363+00', NULL),
	('daff61f5-4fc9-4b17-ba0e-3bad1e6431bf', '7b4b20cc-a236-4766-9680-59d917b8f5eb', '9567d72a-7060-4a1d-b913-7d342aa2b352', 'Buongiorno, vorremmo ordinare i seguenti prodotti:

• glock: 2

Grazie!', NULL, 'sent', NULL, '2025-10-10 10:08:11.842429+00', '2025-10-10 10:08:11.842429+00', NULL),
	('590ce01e-779c-4f0e-bbbf-d9d41570fb8c', '7b4b20cc-a236-4766-9680-59d917b8f5eb', '9567d72a-7060-4a1d-b913-7d342aa2b352', 'Buongiorno, vorremmo ordinare i seguenti prodotti:

• glock: 10

Grazie!', NULL, 'sent', NULL, '2025-10-10 10:47:03.060961+00', '2025-10-10 10:47:03.060961+00', NULL),
	('659cc5fe-03c4-4b2e-b03b-53d6c12bb17e', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', 'X SF:

• Carne secca: 10

Grazie!', NULL, 'sent', NULL, '2025-10-10 10:48:32.880904+00', '2025-10-10 10:48:32.880904+00', NULL),
	('369dad56-8f47-42ac-b9ac-6d53d4024e4c', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Crema tartufo: 1

Grazie!', NULL, 'sent', NULL, '2025-10-10 17:18:56.980516+00', '2025-10-10 17:18:56.980516+00', NULL),
	('1add250d-de7b-4590-9c82-6b2a7ca8319b', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1

Grazie!', NULL, 'sent', NULL, '2025-10-10 18:41:29.410637+00', '2025-10-10 18:41:29.410637+00', NULL),
	('df38ca3b-665c-43ff-9e9f-fa098bae37b7', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Per Ruben Srl entro le 10: 


• Sale Bustine: 2

Grazie!', NULL, 'sent', NULL, '2025-10-10 18:42:00.34132+00', '2025-10-10 18:42:00.34132+00', NULL),
	('5544bba0-7eb5-467f-94be-9a23ce5beced', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1

Grazie!', NULL, 'sent', NULL, '2025-10-10 18:42:30.089728+00', '2025-10-10 18:42:30.089728+00', NULL),
	('fb76bf28-4807-4000-aa71-d2c45ddb7bec', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1

Grazie!', NULL, 'sent', NULL, '2025-10-10 18:43:19.622708+00', '2025-10-10 18:43:19.622708+00', NULL),
	('da685386-bcb1-46bf-ad50-50f4d5056fcd', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Per Ruben Srl entro le 10: 


• Sale Bustine: 1

Grazie!', NULL, 'sent', NULL, '2025-10-10 18:45:32.044026+00', '2025-10-10 18:45:32.044026+00', NULL),
	('dd1e5c39-5cb3-4760-86fc-0849dc46fbaf', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 3

Grazie!', NULL, 'sent', NULL, '2025-10-10 18:49:31.782193+00', '2025-10-10 18:49:31.782193+00', NULL),
	('4c354869-2ee7-4890-a3e8-6f9f311a9eb6', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'X SF:



• Fuselli Panati: 5
• Shnitzel: 9

Grazie!', NULL, 'sent', NULL, '2025-10-12 18:19:47.974628+00', '2025-10-12 18:19:47.974628+00', NULL),
	('fe1f665a-2172-484a-bc2c-255ded4e1d85', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Per Ruben Srl entro le 10: 


• Pepe Bustine: 3

Grazie!', NULL, 'sent', NULL, '2025-10-12 18:49:48.478293+00', '2025-10-12 18:49:48.478293+00', NULL),
	('459b414e-6b43-4e02-967d-1db9b0ce0bd9', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 3

Grazie!', NULL, 'sent', NULL, '2025-10-12 18:50:02.232174+00', '2025-10-12 18:50:02.232174+00', NULL),
	('61b07494-34b7-4dd8-9c6d-48c563c87f38', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Bomba Piccante: 4

Grazie!', NULL, 'sent', NULL, '2025-10-12 18:52:11.278037+00', '2025-10-12 18:52:11.278037+00', NULL),
	('b9577e46-57a8-4be9-9543-26ebf990104f', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'X SF:



• Francesine: 3

Grazie!', NULL, 'sent', NULL, '2025-10-12 18:52:32.576757+00', '2025-10-12 18:52:32.576757+00', NULL),
	('8d450bbf-9f9f-4aea-9b1a-208ade88db8b', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Per Ruben Srl entro le 10: 


• Sale Bustine: 3

Grazie!', NULL, 'sent', NULL, '2025-10-12 18:53:30.145205+00', '2025-10-12 18:53:30.145205+00', NULL),
	('08100719-53c5-4b98-8c84-f0af95ad729b', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Per Ruben Srl entro le 10: 


• Pepe Bustine: 3

Grazie!', NULL, 'sent', NULL, '2025-10-12 18:54:06.143727+00', '2025-10-12 18:54:06.143727+00', NULL),
	('eecb57fa-ceee-4d9b-a6f7-50fea578eeba', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Per Ruben Srl entro le 10: 


• Pepe Bustine: 3

Grazie!', NULL, 'sent', NULL, '2025-10-12 18:55:02.821818+00', '2025-10-12 18:55:02.821818+00', NULL),
	('08a88ad2-5453-4214-9e69-f04e70791f09', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Per Ruben Srl entro le 10: 


• Pepe Bustine: 3

Grazie!', NULL, 'sent', NULL, '2025-10-12 18:55:42.141417+00', '2025-10-12 18:55:42.141417+00', NULL),
	('d1a4b372-f3dc-4bd9-ba60-88ffa87ce393', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'X SF:



• Fuselli Panati: 4

Grazie!', NULL, 'sent', NULL, '2025-10-12 18:56:10.991399+00', '2025-10-12 18:56:10.991399+00', NULL),
	('262c3a27-87a8-4d93-8679-817e023c637d', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 4

Grazie!', NULL, 'sent', NULL, '2025-10-12 18:56:28.398411+00', '2025-10-12 18:56:28.398411+00', NULL),
	('a1164786-55c2-4c89-9fa0-a6bebd67eaf0', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Per Ruben Srl entro le 10: 


• Sale Bustine: 3

Grazie!', NULL, 'sent', NULL, '2025-10-12 18:56:52.652196+00', '2025-10-12 18:56:52.652196+00', NULL),
	('8c3ade29-fd07-4881-84a4-1b326b58f73f', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 2

Grazie!', NULL, 'sent', NULL, '2025-10-12 18:57:30.472803+00', '2025-10-12 18:57:30.472803+00', NULL),
	('2de4624b-dc2b-44eb-a4db-e17064861ab5', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 2

Grazie!', NULL, 'sent', NULL, '2025-10-12 19:00:10.557738+00', '2025-10-12 19:00:10.557738+00', NULL),
	('597ba47d-bd26-4d0e-91e8-7133b102068e', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 2

Grazie!', NULL, 'sent', NULL, '2025-10-12 19:07:40.819065+00', '2025-10-12 19:07:40.819065+00', NULL),
	('7eee9bfb-4063-4b8e-9cf0-b0563537709d', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 2

Grazie!', NULL, 'sent', NULL, '2025-10-12 19:08:32.624769+00', '2025-10-12 19:08:32.624769+00', NULL),
	('a8c99e38-df8b-47db-9d83-3dc81a4658ff', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 2

Grazie!', NULL, 'sent', NULL, '2025-10-12 20:36:29.435092+00', '2025-10-12 20:36:29.435092+00', NULL),
	('dd522af2-1cf8-4796-b4c7-cb9c860664ed', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', 'X SF:

• Bresaola: 3

Grazie!', NULL, 'sent', NULL, '2025-10-12 20:36:44.713124+00', '2025-10-12 20:36:44.713124+00', NULL),
	('22c7d700-ef96-4dbd-ae22-da52dead7b72', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Per Ruben Srl entro le 10: 


• Rucola: 2
• Songino: 2
• Semola Rimacinata: 2

Prodotti aggiuntivi:
Patate 5 kg

Grazie!', 'Patate 5 kg', 'sent', NULL, '2025-10-12 21:00:15.296578+00', '2025-10-12 21:00:15.296578+00', NULL),
	('0dba9aa2-d76d-4642-9c40-e03b02859593', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', 'X SF:

• Carne secca: Serve
• Bresaola: Serve
• Shawarma: 5kg

Grazie!', NULL, 'sent', NULL, '2025-10-12 21:03:08.203231+00', '2025-10-12 21:03:08.203231+00', NULL),
	('7151cdac-0253-45bb-a5e1-5222415da7d6', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'df99037c-1085-4760-bbbf-cac576ba9e6f', '

• Lattuga: 1 cassa

Grazie!', NULL, 'sent', NULL, '2025-10-12 21:03:44.963617+00', '2025-10-12 21:03:44.963617+00', NULL),
	('facd6dff-4c36-412f-a6dd-6d930258f3c6', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• BBQ: Serve

Grazie!', NULL, 'sent', NULL, '2025-10-12 21:04:36.024257+00', '2025-10-12 21:04:36.024257+00', NULL),
	('331bdc24-d6aa-4d25-b870-d3c7a4a6c362', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'X SF:



• Shnitzel: 15
• Francesine: 3kg
• Fettine Panate: 10

Prodotti aggiuntivi:
roast-beef 
Pulled beef 5 kg

Grazie!', 'roast-beef 
Pulled beef 5 kg', 'sent', NULL, '2025-10-12 21:05:36.781061+00', '2025-10-12 21:05:36.781061+00', NULL),
	('707f4040-6422-4297-ae76-237c3c40a91e', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1 pala

Grazie!', NULL, 'sent', NULL, '2025-10-12 21:06:14.191084+00', '2025-10-12 21:06:14.191084+00', NULL),
	('1ddcc4f0-3658-4216-9f39-2ccfd5de2cbf', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1

Grazie!', NULL, 'sent', NULL, '2025-10-13 09:53:22.537641+00', '2025-10-13 09:53:22.537641+00', NULL),
	('30a5ccb6-9f1d-4f23-a33d-b2cda4fce9b1', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1

Grazie!', NULL, 'sent', NULL, '2025-10-13 16:29:05.9019+00', '2025-10-13 16:29:05.9019+00', NULL),
	('f1a203f2-fa5d-4a93-9703-96eb4790ad56', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 2

Grazie!', NULL, 'sent', NULL, '2025-10-13 16:29:24.351719+00', '2025-10-13 16:29:24.351719+00', NULL),
	('b68cfae2-25ec-462b-9236-f415d66a2963', '7b4b20cc-a236-4766-9680-59d917b8f5eb', '9567d72a-7060-4a1d-b913-7d342aa2b352', 'Buongiorno, vorremmo ordinare i seguenti prodotti:

• glock: 10

Grazie!', NULL, 'sent', NULL, '2025-10-13 17:03:40.73423+00', '2025-10-13 17:03:40.73423+00', NULL),
	('5d21dc9f-609a-437b-a138-05a16a280d79', '7b4b20cc-a236-4766-9680-59d917b8f5eb', '1f5a15dc-43a6-4985-a9b4-8f73997d4443', 'Buongiorno, vorremmo ordinare i seguenti prodotti:

• bistecche: 9

Grazie!', NULL, 'sent', NULL, '2025-10-13 17:23:52.831282+00', '2025-10-13 17:23:52.831282+00', NULL),
	('ce3e806e-ddbd-4cf2-89a6-77dcdaac583b', '7b4b20cc-a236-4766-9680-59d917b8f5eb', '9567d72a-7060-4a1d-b913-7d342aa2b352', 'Buongiorno, vorremmo ordinare i seguenti prodotti:

• bistecche: 9
• glock: 5
• lancia granate: 8
• carri armate: 8

Grazie!', NULL, 'sent', NULL, '2025-10-13 17:24:44.703889+00', '2025-10-13 17:24:44.703889+00', NULL),
	('da597509-4777-4d81-8ffd-f5bb0e32e340', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Per Ruben Srl entro le 10: 


• Songino: 10

Grazie!', NULL, 'sent', NULL, '2025-10-14 12:58:38.67132+00', '2025-10-14 12:58:38.67132+00', NULL),
	('14bd57f6-567b-4476-815a-2a0832a24504', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 2

Grazie!', NULL, 'sent', NULL, '2025-10-14 17:40:49.512095+00', '2025-10-14 17:40:49.512095+00', NULL),
	('73c9e995-d63b-4a40-b55f-7153cfa56588', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Per Ruben Srl entro le 10: 


• Rucola: 2
• Cavolo Rosso: 2
• Songino: 2
• Rotoli carta: 2

Prodotti aggiuntivi:
Patate 5 kg

Grazie!', 'Patate 5 kg', 'sent', NULL, '2025-10-15 18:08:07.395098+00', '2025-10-15 18:08:07.395098+00', NULL),
	('208fef9b-30a1-4181-b8fe-d743551d9b2c', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'df99037c-1085-4760-bbbf-cac576ba9e6f', '

• Grappolo: 1 c

Grazie!', NULL, 'sent', NULL, '2025-10-15 18:08:55.124278+00', '2025-10-15 18:08:55.124278+00', NULL),
	('9ffdc49d-7ffa-4068-9a35-28a90edd9a43', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', 'X SF:

• Sfoglia: 1 kg
• Asado: 1

Grazie!', NULL, 'sent', NULL, '2025-10-15 18:10:41.923152+00', '2025-10-15 18:10:41.923152+00', NULL),
	('6ec3892c-b564-4b09-8aa1-2879f2153281', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1 pala e mezza

Grazie!', NULL, 'sent', NULL, '2025-10-15 18:11:42.304374+00', '2025-10-15 18:11:42.304374+00', NULL),
	('59c5be78-b93e-49e3-a38c-5d83c0718cfb', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'X SF:



• Fuselli Panati: 6
• Shnitzel: 10
• Bocconcini di Pollo: 2 kg
• Straccetti: 1 kg

Prodotti aggiuntivi:
Pulled beef 5 kg
Petti di pollo 1 kg

Grazie!', 'Pulled beef 5 kg
Petti di pollo 1 kg', 'sent', NULL, '2025-10-15 18:14:52.543446+00', '2025-10-15 18:14:52.543446+00', NULL),
	('79b34477-57fa-4a47-ae83-167283fa9d70', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'df99037c-1085-4760-bbbf-cac576ba9e6f', '

• Prezzemolo: 3 mazzi 

Grazie!', NULL, 'sent', NULL, '2025-10-16 10:59:23.96426+00', '2025-10-16 10:59:23.96426+00', NULL),
	('2db665d6-b5f2-40b1-aaeb-8a477ce707c6', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Per Ruben Srl entro le 10: 


• Sale Bustine: 2

Grazie!', NULL, 'sent', NULL, '2025-10-16 12:09:40.498811+00', '2025-10-16 12:09:40.498811+00', NULL),
	('be2aa15c-3d39-4626-8217-c9daee86f600', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 3

Grazie!', NULL, 'sent', NULL, '2025-10-16 12:12:36.517267+00', '2025-10-16 12:12:36.517267+00', NULL),
	('a17801c3-7a91-4e8f-be41-170a6098baca', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Per Ruben Srl entro le 10: 


• Sale Bustine: 2

Grazie!', NULL, 'sent', NULL, '2025-10-16 12:18:32.01752+00', '2025-10-16 12:18:32.01752+00', NULL),
	('d1ef13d5-7418-4acb-9e03-eb33937495cc', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Per Ruben Srl entro le 10: 


• Sale Bustine: 2

Grazie!', NULL, 'sent', NULL, '2025-10-16 12:18:57.555654+00', '2025-10-16 12:18:57.555654+00', NULL),
	('7bdfb673-ce05-45d6-ba51-4fa02be4af45', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Per Ruben Srl entro le 10: 


• Sale Bustine: 2

Grazie!', NULL, 'sent', NULL, '2025-10-16 12:34:29.791405+00', '2025-10-16 12:34:29.791405+00', NULL),
	('579633ed-0fcf-4161-ba60-63c61fd36d66', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Per Ruben Srl entro le 10: 


• Pepe Bustine: 3

Grazie!', NULL, 'sent', NULL, '2025-10-16 12:38:18.090294+00', '2025-10-16 12:38:18.090294+00', NULL),
	('fe27d3a5-534e-4723-b008-55d937e35ded', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Per Ruben Srl entro le 10: 


• Rucola: 2

Grazie!', NULL, 'sent', NULL, '2025-10-16 12:38:57.902575+00', '2025-10-16 12:38:57.902575+00', NULL),
	('a97c9a47-dd86-4729-b8a6-70dec90d78d0', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Per Ruben Srl entro le 10: 


• Pepe Bustine: 4

Grazie!', NULL, 'sent', NULL, '2025-10-16 12:43:15.930945+00', '2025-10-16 12:43:15.930945+00', NULL),
	('f075b55b-b36c-49b0-90fc-8587ae9b56ec', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Per Ruben Srl entro le 10: 


• Pepe Bustine: 2

Grazie!', NULL, 'sent', NULL, '2025-10-16 12:43:44.955531+00', '2025-10-16 12:43:44.955531+00', NULL),
	('5f94ac71-a86d-436b-ad5b-b912efe7d22e', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Per Ruben Srl entro le 10: 


• Songino: 3

Grazie!', NULL, 'sent', NULL, '2025-10-16 12:44:19.577891+00', '2025-10-16 12:44:19.577891+00', NULL),
	('5e2b16e3-2a94-4880-b704-b45ec7f45333', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Per Ruben Srl entro le 10: 


• Sale Bustine: 2

Grazie!', NULL, 'sent', NULL, '2025-10-16 12:48:12.204651+00', '2025-10-16 12:48:12.204651+00', NULL),
	('55dfc36a-5237-4af6-b1a3-c1c3157c947d', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Per Ruben Srl entro le 10: 


• Sale Bustine: 1

Grazie!', NULL, 'sent', NULL, '2025-10-16 12:48:25.551808+00', '2025-10-16 12:48:25.551808+00', NULL),
	('84346671-b36e-4605-9a21-75933ca9b3fe', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Per Ruben Srl entro le 10: 


• Olio Bustine: 3

Grazie!', NULL, 'sent', NULL, '2025-10-16 12:57:26.545998+00', '2025-10-16 12:57:26.545998+00', NULL),
	('5daa9e1a-3d41-4938-b939-eb792dde90a0', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Per Ruben Srl entro le 10: 


• Cipolla Rossa: 1kg
• Tris Posate Monouso: 1 c
• Guanti L: 2

Prodotti aggiuntivi:
Patate 5 kg
Bicchiere crystal 200 pz
Sacchi neri condominio 1 c

Grazie!', 'Patate 5 kg
Bicchiere crystal 200 pz
Sacchi neri condominio 1 c', 'sent', NULL, '2025-10-16 21:06:36.263175+00', '2025-10-16 21:06:36.263175+00', NULL),
	('a594b139-f446-4f98-9a4e-29c40f471f8d', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'df99037c-1085-4760-bbbf-cac576ba9e6f', '

• Cetrioli: 1 c
• Cipolla Bianca: 1 c

Grazie!', NULL, 'sent', NULL, '2025-10-16 21:07:37.189337+00', '2025-10-16 21:07:37.189337+00', NULL),
	('0ae42cd1-8e63-422d-b76d-cccf21cac27b', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Maionese BG: Serve
• Porchetta: Serve
• Cheddar: 2
• Salsa Chilly: 1

Grazie!', NULL, 'sent', NULL, '2025-10-16 21:10:04.583448+00', '2025-10-16 21:10:04.583448+00', NULL),
	('cecb5081-917f-4a36-92ae-255be6efdc3d', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'X SF:



• Fuselli Panati: 6
• Bocconcini di Pollo: 2 kg

Grazie!', NULL, 'sent', NULL, '2025-10-16 21:11:21.502322+00', '2025-10-16 21:11:21.502322+00', NULL),
	('510744a6-b3ac-494b-8458-7bf987a4eec9', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', 'X SF:


Prodotti aggiuntivi:
Salame

Grazie!', 'Salame', 'sent', NULL, '2025-10-16 21:12:11.099409+00', '2025-10-16 21:12:11.099409+00', NULL),
	('973716b2-cb9d-48ec-aaf2-2ecc78c45e0d', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 2

Grazie!', NULL, 'sent', NULL, '2025-10-16 21:13:25.585175+00', '2025-10-16 21:13:25.585175+00', NULL),
	('72edea07-663d-4d20-800c-a4ead4a07a4e', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 3

Grazie!', NULL, 'sent', NULL, '2025-10-17 19:51:19.88181+00', '2025-10-17 19:51:19.88181+00', NULL),
	('f0b00a19-60ee-498b-acff-053be165fa4a', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 7

Grazie!', NULL, 'sent', NULL, '2025-10-17 20:10:53.81417+00', '2025-10-17 20:10:53.81417+00', NULL),
	('74aafa9f-474c-4926-a7c6-9fe93275b5fc', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Ketchup: 4

Grazie!', NULL, 'sent', NULL, '2025-10-17 20:19:42.885912+00', '2025-10-17 20:19:42.885912+00', NULL),
	('de06558c-67d8-4de8-ac94-a7980e115f55', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 2

Grazie!', NULL, 'sent', NULL, '2025-10-17 20:33:01.880886+00', '2025-10-17 20:33:01.880886+00', NULL),
	('73142fec-befe-460d-9bfe-5b63a0d6856d', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 2

Grazie!', NULL, 'sent', NULL, '2025-10-17 20:33:08.370381+00', '2025-10-17 20:33:08.370381+00', NULL),
	('f523afd8-e417-4568-8088-93ec26688761', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 2

Grazie!', NULL, 'sent', NULL, '2025-10-17 20:33:16.249299+00', '2025-10-17 20:33:16.249299+00', NULL),
	('edebf13b-a8cc-4e99-a6ca-d3c71365c082', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 2

Grazie!', NULL, 'sent', NULL, '2025-10-17 20:37:49.908906+00', '2025-10-17 20:37:49.908906+00', NULL),
	('d28bdccc-27d2-49ef-8b18-c885f7e83dfb', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 2

Grazie!', NULL, 'sent', NULL, '2025-10-17 20:39:44.308464+00', '2025-10-17 20:39:44.308464+00', NULL),
	('154eb466-3d26-49b3-9188-c52145395516', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 2

Grazie!', NULL, 'sent', NULL, '2025-10-17 20:40:22.819004+00', '2025-10-17 20:40:22.819004+00', NULL),
	('b995b2d0-b63a-4e43-ae16-4f13a50e6698', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 2

Grazie!', NULL, 'sent', NULL, '2025-10-17 20:40:27.052804+00', '2025-10-17 20:40:27.052804+00', NULL),
	('ef2f8409-10b5-42ce-ac7c-d211c1a69889', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 6

Grazie!', NULL, 'sent', NULL, '2025-10-17 20:42:13.187309+00', '2025-10-17 20:42:13.187309+00', NULL),
	('3ee82a7c-9485-4cdd-81fd-cdcddf265968', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 6

Grazie!', NULL, 'sent', NULL, '2025-10-17 20:42:21.425418+00', '2025-10-17 20:42:21.425418+00', NULL),
	('a5a6a905-0a25-4615-bf50-9833fe51c17b', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 6

Grazie!', NULL, 'sent', NULL, '2025-10-17 20:42:32.272806+00', '2025-10-17 20:42:32.272806+00', NULL),
	('4464da75-b97f-4690-b13f-21e2071875fb', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 7

Grazie!', NULL, 'sent', NULL, '2025-10-17 20:44:50.101841+00', '2025-10-17 20:44:50.101841+00', NULL),
	('4a1d14f6-3d80-478d-9db1-623bc75b094d', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 7

Grazie!', NULL, 'sent', NULL, '2025-10-17 20:44:56.317323+00', '2025-10-17 20:44:56.317323+00', NULL),
	('53a2944a-f824-4ae2-b941-2ada65d95307', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 2

Grazie!', NULL, 'sent', NULL, '2025-10-18 14:33:17.932309+00', '2025-10-18 14:33:17.932309+00', NULL),
	('e0ec2f2b-627d-46f6-b892-e760d2804d35', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Peperoncino olio: 2

Grazie!', NULL, 'sent', NULL, '2025-10-18 14:33:18.420421+00', '2025-10-18 14:33:18.420421+00', NULL),
	('27cf6ab5-3ca2-40db-b293-cca1bba501d0', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', 'X SF:

• Bresaola: 4

Grazie!', NULL, 'sent', NULL, '2025-10-18 14:33:18.668398+00', '2025-10-18 14:33:18.668398+00', NULL),
	('120eea29-2959-4c0a-8934-5bfcb4a97b55', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 8

Grazie!', NULL, 'sent', NULL, '2025-10-18 16:39:45.975636+00', '2025-10-18 16:39:45.975636+00', NULL),
	('d8f59bdb-ae4a-4f31-8e1e-9167042c032a', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 8

Grazie!', NULL, 'sent', NULL, '2025-10-18 16:40:36.824146+00', '2025-10-18 16:40:36.824146+00', NULL),
	('d7b99aaf-8287-472f-ba0a-4f8efb95b26a', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 2

Grazie!', NULL, 'sent', NULL, '2025-10-18 16:46:14.332458+00', '2025-10-18 16:46:14.332458+00', NULL),
	('fba1d382-a22b-4d69-8af7-806f9636d443', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Bomba Piccante: 5

Grazie!', NULL, 'sent', NULL, '2025-10-18 16:50:38.157322+00', '2025-10-18 16:50:38.157322+00', NULL),
	('e2fe3546-a0d5-42c0-8092-53a4322d25f9', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 3

Grazie!', NULL, 'sent', NULL, '2025-10-18 17:00:03.255872+00', '2025-10-18 17:00:03.255872+00', NULL),
	('acf547cc-2ece-47af-a630-ff1b3537971c', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 3

Grazie!', NULL, 'sent', NULL, '2025-10-18 17:01:21.545908+00', '2025-10-18 17:01:21.545908+00', NULL),
	('26b6639e-71ea-4142-bfc4-384e2c5a693b', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Peperoncino olio: 5

Grazie!', NULL, 'sent', NULL, '2025-10-18 17:01:24.364757+00', '2025-10-18 17:01:24.364757+00', NULL),
	('d181465a-387d-4687-9616-1a04c86232cc', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 3

Grazie!', NULL, 'sent', NULL, '2025-10-18 17:05:04.65496+00', '2025-10-18 17:05:04.65496+00', NULL),
	('7b4c00ab-f1b3-4304-8a5c-7cf04393389a', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', 'X SF:

• Carne secca: 2

Grazie!', NULL, 'sent', NULL, '2025-10-18 17:05:10.52865+00', '2025-10-18 17:05:10.52865+00', NULL),
	('08e7ccf0-6ae2-4794-8e1f-40b7c4856156', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 2

Grazie!', NULL, 'sent', NULL, '2025-10-18 17:08:01.325525+00', '2025-10-18 17:08:01.325525+00', NULL),
	('eb5174db-4cbe-4b22-b3e9-75a29b4a19af', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'df99037c-1085-4760-bbbf-cac576ba9e6f', '

• Lattuga: 1

Grazie!', NULL, 'sent', NULL, '2025-10-18 17:08:12.460248+00', '2025-10-18 17:08:12.460248+00', NULL),
	('7357ac7b-e2e7-42fa-beb3-467cb55685d5', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Per Ruben Srl entro le 10: 


• Manitoba: 25

Grazie!', NULL, 'sent', NULL, '2025-10-18 17:08:19.342534+00', '2025-10-18 17:08:19.342534+00', NULL),
	('3e3c41b3-b8dc-47fd-be0f-41bd68267c94', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1.5

Grazie!', NULL, 'sent', NULL, '2025-10-18 21:23:06.356134+00', '2025-10-18 21:23:06.356134+00', NULL),
	('cf763093-8213-4ff0-ae62-794b11d6f314', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '', 'Lievito 1 c
Patate 5kg', 'sent', NULL, '2025-10-18 21:33:55.780116+00', '2025-10-18 21:33:55.780116+00', NULL),
	('9b419248-1ae1-4050-9907-9d7f24b4b47b', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Bomba Piccante: 2

Grazie!', NULL, 'sent', NULL, '2025-10-18 21:57:29.734035+00', '2025-10-18 21:57:29.734035+00', NULL),
	('1c1d09d0-77e9-4744-9293-824671e12ee0', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 6

Grazie!', NULL, 'sent', NULL, '2025-10-19 14:59:27.219681+00', '2025-10-19 14:59:27.219681+00', NULL),
	('bcaf7160-6506-42c3-bb40-4af5d05deec0', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 3

Grazie!', NULL, 'sent', NULL, '2025-10-19 17:51:47.625401+00', '2025-10-19 17:51:47.625401+00', NULL),
	('da5631e0-eafc-4b5e-8f91-abfac7ed185c', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Chocolla: 3

Grazie!', NULL, 'sent', NULL, '2025-10-19 17:51:53.383986+00', '2025-10-19 17:51:53.383986+00', NULL),
	('a264a653-75d2-4bc8-8788-8147a0f08a45', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 7

Grazie!', NULL, 'sent', NULL, '2025-10-19 18:48:09.894783+00', '2025-10-19 18:48:09.894783+00', NULL),
	('f911c65c-7978-4212-8189-1a1518183d60', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Cetriolini: 7

Grazie!', NULL, 'sent', NULL, '2025-10-19 18:48:14.533057+00', '2025-10-19 18:48:14.533057+00', NULL),
	('ab4b49d1-e48f-483c-92ff-db37500f2f0c', '7c263c3e-11b2-468e-a74d-98910c429842', 'cd0d2dd8-82b6-48f4-9620-fb4129d3bf40', '', NULL, 'sent', NULL, '2025-10-20 15:36:27.259734+00', '2025-10-20 15:36:27.259734+00', NULL),
	('478b2560-c516-425d-9c8a-b25832d41898', '7c263c3e-11b2-468e-a74d-98910c429842', 'a0fd8b52-6014-4920-9409-2abb93ca0f3a', 'Buongiorno, vorremmo ordinare i seguenti prodotti:

• po: 8

Grazie!', NULL, 'sent', NULL, '2025-10-20 15:37:11.938233+00', '2025-10-20 15:37:11.938233+00', NULL),
	('8933a7f4-eeec-4431-9643-b899323b4880', '7c263c3e-11b2-468e-a74d-98910c429842', 'a0fd8b52-6014-4920-9409-2abb93ca0f3a', 'Buongiorno, vorremmo ordinare i seguenti prodotti:

• po: 8

Grazie!', NULL, 'sent', NULL, '2025-10-20 15:37:36.622851+00', '2025-10-20 15:37:36.622851+00', NULL),
	('e3634386-9d3a-4101-8737-b1f378757755', '7c263c3e-11b2-468e-a74d-98910c429842', 'cd0d2dd8-82b6-48f4-9620-fb4129d3bf40', 'Buongiorno, vorremmo ordinare i seguenti prodotti:

• l: 9

Grazie!', NULL, 'sent', NULL, '2025-10-20 15:37:45.149226+00', '2025-10-20 15:37:45.149226+00', NULL),
	('75bb527d-65e1-4754-80ba-95bbb0817693', '7c263c3e-11b2-468e-a74d-98910c429842', 'cd0d2dd8-82b6-48f4-9620-fb4129d3bf40', 'Buongiorno, vorremmo ordinare i seguenti prodotti:

• l: 9

Grazie!', NULL, 'sent', NULL, '2025-10-20 15:38:48.754965+00', '2025-10-20 15:38:48.754965+00', NULL),
	('3cc39b99-0cd9-4a9c-9a36-3a05f5b1c0c5', '7c263c3e-11b2-468e-a74d-98910c429842', 'a0fd8b52-6014-4920-9409-2abb93ca0f3a', 'Buongiorno, vorremmo ordinare i seguenti prodotti:

• po: 8

Grazie!', NULL, 'sent', NULL, '2025-10-20 15:38:59.900422+00', '2025-10-20 15:38:59.900422+00', NULL),
	('543304f7-fbaa-4cd2-a6b4-2f08cf7baeaf', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'X SF:



• Fuselli Panati: 5
• Shnitzel: 10
• Bocconcini di Pollo: 2kg
• Straccetti: 1Kg

Grazie!', NULL, 'sent', NULL, '2025-10-20 21:34:23.440425+00', '2025-10-20 21:34:23.440425+00', NULL),
	('7eb925ad-90dd-429a-a69a-a9a5b0338649', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1.5

Grazie!', NULL, 'sent', NULL, '2025-10-20 21:34:37.99417+00', '2025-10-20 21:34:37.99417+00', NULL),
	('8c82d7ee-b93c-4e7a-a912-3e3d0e57c03f', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', 'X SF:

• Shawarma: 5kg

Prodotti aggiuntivi:
Roast-beef 1

Grazie!', 'Roast-beef 1', 'sent', NULL, '2025-10-20 21:34:47.75347+00', '2025-10-20 21:34:47.75347+00', NULL),
	('b93d64c7-169e-44eb-a333-0c22b2f6f7ef', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Per Ruben Srl entro le 10: 


• Rucola: 2
• Tovaglioli neri 24x24: 1 C
• Manitoba: 25 kg

Grazie!', NULL, 'sent', NULL, '2025-10-20 21:44:28.458672+00', '2025-10-20 21:44:28.458672+00', NULL),
	('6dbed8f2-bfe2-47da-8e09-6aac3b02091c', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Goldstar: Serve
• Cheddar: Serve

Grazie!', NULL, 'sent', NULL, '2025-10-22 00:25:22.202378+00', '2025-10-22 00:25:22.202378+00', NULL),
	('e69c1264-b370-4fc4-8d2d-581b19a14d1e', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Goldstar: Serve
• Cheddar: Serve

Grazie!', NULL, 'sent', NULL, '2025-10-22 00:25:40.274853+00', '2025-10-22 00:25:40.274853+00', NULL),
	('a3ae23be-01b5-4b23-939c-05df8447f2f7', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'X SF:



• Shnitzel: 10

Prodotti aggiuntivi:
Petti di pollo 1 kg
Pulled beef 5kg

Grazie!', 'Petti di pollo 1 kg
Pulled beef 5kg', 'sent', NULL, '2025-10-22 00:26:18.005746+00', '2025-10-22 00:26:18.005746+00', NULL),
	('3c609a27-f425-4458-af05-ca8c7c5d2fef', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1.5

Grazie!', NULL, 'sent', NULL, '2025-10-22 00:27:11.393578+00', '2025-10-22 00:27:11.393578+00', NULL),
	('54257d00-0d5d-4f26-9220-9033847c1f5c', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Per Ruben Srl entro le 10: 


• Rucola: 2
• Sapone Piatti: 2
• Manitoba: 25kg

Prodotti aggiuntivi:
Patate 5kg

Grazie!', 'Patate 5kg', 'sent', NULL, '2025-10-22 21:20:53.886039+00', '2025-10-22 21:20:53.886039+00', NULL),
	('e821403d-4ee0-498a-bb48-ded609e5bc1a', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'df99037c-1085-4760-bbbf-cac576ba9e6f', '

• Grappolo: 1 C

Grazie!', NULL, 'sent', NULL, '2025-10-22 21:21:24.757925+00', '2025-10-22 21:21:24.757925+00', NULL),
	('e988423b-5a6d-43bf-8e8c-8e278b925385', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', 'X SF:

• Sfoglia: 1Kg
• Asado: 1
• Shawarma: 5kg

Grazie!', NULL, 'sent', NULL, '2025-10-22 21:21:37.603635+00', '2025-10-22 21:21:37.603635+00', NULL),
	('c33354a9-21d2-49f9-9acb-29ff5c486e4e', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1.5

Grazie!', NULL, 'sent', NULL, '2025-10-22 21:21:50.712692+00', '2025-10-22 21:21:50.712692+00', NULL),
	('df53913e-2560-4537-b644-bbab3a0e8a3c', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'X SF:



• Shnitzel: 10
• Francesine: 3kg
• Bocconcini di Pollo: 2kg

Prodotti aggiuntivi:
Petti di pollo 1kg

Grazie!', 'Petti di pollo 1kg', 'sent', NULL, '2025-10-22 21:21:59.411804+00', '2025-10-22 21:21:59.411804+00', NULL),
	('cfaf9d91-6d01-4742-91c7-c5431130384a', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Scatola panino: Serve
• Poké e coperchio: Serve

Grazie!', NULL, 'sent', NULL, '2025-10-22 21:22:30.569686+00', '2025-10-22 21:22:30.569686+00', NULL),
	('cb326dc8-44f9-415d-bbde-b8052f3d6cc7', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Maionese BG: 1
• Cetriolini: 1
• Pastrami: 1

Grazie!', NULL, 'sent', NULL, '2025-10-23 22:13:21.463538+00', '2025-10-23 22:13:21.463538+00', NULL),
	('fcccb9a7-53b6-4221-9111-c9dc0cf9d6d3', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Maionese BG: 1
• Cetriolini: 1
• Pastrami: 1

Grazie!', NULL, 'sent', NULL, '2025-10-23 22:13:21.663626+00', '2025-10-23 22:13:21.663626+00', NULL),
	('b789d3da-e094-4115-99ab-ca9ac9af3aaa', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'X SF:



• Fuselli Panati: 10
• Shnitzel: 10
• Bocconcini di Pollo: 2
• Fettine Panate: 10

Grazie!', NULL, 'sent', NULL, '2025-10-23 22:13:43.256428+00', '2025-10-23 22:13:43.256428+00', NULL),
	('afb0605d-25c3-44f2-83f8-3b871b6a6942', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1,5

Grazie!', NULL, 'sent', NULL, '2025-10-23 22:14:01.249412+00', '2025-10-23 22:14:01.249412+00', NULL),
	('4702c44f-3d9b-4680-a2d4-28ec1428bf8b', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', 'X SF:

• Carne secca: 1
Serve

Grazie!', 'Serve', 'sent', NULL, '2025-10-23 22:14:11.900192+00', '2025-10-23 22:14:11.900192+00', NULL),
	('a5c13b0c-5432-45c6-aa8d-1c567a0049b8', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'df99037c-1085-4760-bbbf-cac576ba9e6f', '

• Lattuga: 1

Grazie!', NULL, 'sent', NULL, '2025-10-23 22:14:29.251279+00', '2025-10-23 22:14:29.251279+00', NULL),
	('264e487f-96d3-4a9c-92d4-7902ecf373f9', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '

• Rucola: 2
• Rotoli carta: 2
Patate 5kg

Grazie!', 'Patate 5kg', 'sent', NULL, '2025-10-23 22:17:34.634156+00', '2025-10-23 22:17:34.634156+00', NULL),
	('5fad9ff7-647e-48b0-a3d6-43ad627be01a', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '', NULL, 'sent', NULL, '2025-10-24 16:53:50.704528+00', '2025-10-24 16:53:50.704528+00', NULL),
	('731ba64f-92d2-4261-b627-b7d19e4728bb', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Pastrami: Serve
Pomodoro semplice 6

Grazie!', 'Pomodoro semplice 6', 'sent', NULL, '2025-10-26 21:42:45.544355+00', '2025-10-26 21:42:45.544355+00', NULL),
	('0212267b-bb3f-40a7-bd94-3d235e0d0ab7', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'X SF:



• Fuselli Panati: 10
• Shnitzel: 15
• Bocconcini di Pollo: 2 kg
• Fettine Panate: 10

Grazie!', NULL, 'sent', NULL, '2025-10-26 21:43:03.493684+00', '2025-10-26 21:43:03.493684+00', NULL),
	('b9d2d151-8e67-4eae-a5a9-1298a33c1146', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1

Grazie!', NULL, 'sent', NULL, '2025-10-26 21:43:16.801142+00', '2025-10-26 21:43:16.801142+00', NULL),
	('4ed54302-17a3-4cb8-a591-ed951a4ef818', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', 'X SF:

• Carne secca: Serve
• Shawarma: 5 kg
• Asado: 1
Salame

Grazie!', 'Salame', 'sent', NULL, '2025-10-26 21:43:33.17193+00', '2025-10-26 21:43:33.17193+00', NULL),
	('cf3e6d14-5ffa-471c-a0c6-03cd41867e3d', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'df99037c-1085-4760-bbbf-cac576ba9e6f', '

• Grappolo: 1

Grazie!', NULL, 'sent', NULL, '2025-10-26 21:43:46.728513+00', '2025-10-26 21:43:46.728513+00', NULL),
	('db26911c-fc76-47ce-b692-7d3739e026dd', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '

• Olio Bustine: 1 c
• Songino: 2
• Guanti L: 2
Patate 5kg

Grazie!', 'Patate 5kg', 'sent', NULL, '2025-10-26 21:44:08.094039+00', '2025-10-26 21:44:08.094039+00', NULL),
	('2b5f1259-fe61-4204-8c43-2ff9c05cc588', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '

• Sale Bustine: 2

Grazie!', NULL, 'sent', NULL, '2025-10-27 19:48:02.669325+00', '2025-10-27 19:48:02.669325+00', NULL),
	('a807049d-66ef-402f-b58f-82628341b51e', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Cheddar: Serve

Grazie!', NULL, 'sent', NULL, '2025-10-27 22:14:09.774555+00', '2025-10-27 22:14:09.774555+00', NULL),
	('1350ee27-c9ce-4bb9-9437-27cdfadad3f2', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'X SF:



• Shnitzel: 20
• Fettine Panate: 10
• Straccetti: 1 kg

Grazie!', NULL, 'sent', NULL, '2025-10-27 22:14:20.379839+00', '2025-10-27 22:14:20.379839+00', NULL),
	('d5750fd3-7536-4380-acd4-733952c81d5e', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1.5

Grazie!', NULL, 'sent', NULL, '2025-10-27 22:14:30.961443+00', '2025-10-27 22:14:30.961443+00', NULL),
	('5e2531c5-2a18-4604-9165-d23ad3f0576e', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '

• Cipolla Rossa: 2 kg
Patate 5 kg

Grazie!', 'Patate 5 kg', 'sent', NULL, '2025-10-27 22:14:37.797236+00', '2025-10-27 22:14:37.797236+00', NULL),
	('345d084b-8060-4d31-9ad2-0dea296735b3', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'df99037c-1085-4760-bbbf-cac576ba9e6f', '

• Cipolla Bianca: 1 c

Grazie!', NULL, 'sent', NULL, '2025-10-27 22:14:46.244828+00', '2025-10-27 22:14:46.244828+00', NULL),
	('6d319171-1b85-4e01-9b47-bc1a9fb2b32c', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', 'X SF:

• Carne secca: 3

Grazie!', NULL, 'sent', NULL, '2025-10-29 15:37:47.087697+00', '2025-10-29 15:37:47.087697+00', NULL),
	('7929f1f3-25d1-4de1-bb57-a86336f54a37', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '

• Cipolla Rossa: 3 kg

Grazie!', NULL, 'sent', NULL, '2025-10-29 15:38:06.363695+00', '2025-10-29 15:38:06.363695+00', NULL),
	('0271bc90-4fd9-42a4-8506-ed5f84d8b506', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'X SF:



• Shnitzel: 5

Grazie!', NULL, 'sent', NULL, '2025-10-29 17:46:15.282591+00', '2025-10-29 17:46:15.282591+00', NULL),
	('dbea8090-b36a-4b12-864c-db00a64ef6e0', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Pastrami: Serve
spezia Shawarma 

Grazie!', 'spezia Shawarma ', 'sent', NULL, '2025-10-29 23:54:10.302396+00', '2025-10-29 23:54:10.302396+00', NULL),
	('bdfedb36-5e93-4bc1-8020-8e507470f130', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Pastrami: Serve
spezia Shawarma 

Grazie!', 'spezia Shawarma ', 'sent', NULL, '2025-10-29 23:54:10.809636+00', '2025-10-29 23:54:10.809636+00', NULL),
	('00353b82-a8ee-40d0-b0bd-406a3fdcc4f0', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'X SF:



• Shnitzel: 15
• Francesine: 3 kg
Petti di pollo 1 kg

Grazie!', 'Petti di pollo 1 kg', 'sent', NULL, '2025-10-29 23:54:21.616055+00', '2025-10-29 23:54:21.616055+00', NULL),
	('c5a43b9c-b154-4e4f-86bb-d62075812196', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1.5

Grazie!', NULL, 'sent', NULL, '2025-10-29 23:54:30.285113+00', '2025-10-29 23:54:30.285113+00', NULL),
	('c6ac6ae2-bd11-40a6-b54e-5f42cc23cbd7', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '

• Rucola: 2
• Guanti L: 2
• Manitoba: 25 kg
patate 5 kg
Lievito 1 c

Grazie!', 'patate 5 kg
Lievito 1 c', 'sent', NULL, '2025-10-29 23:54:38.22176+00', '2025-10-29 23:54:38.22176+00', NULL),
	('844ccf2a-ff82-4287-9b3b-c2dc464c3e0b', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', 'X SF:

• Carne secca: Serve
• Bresaola: serve 
• Sfoglia: 1 kg

Grazie!', NULL, 'sent', NULL, '2025-10-29 23:54:57.47486+00', '2025-10-29 23:54:57.47486+00', NULL),
	('b1180973-d55b-4ec9-a987-9b8a912cddbf', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '

• Songino: 2
• Rucola: 2
• Cavolo Rosso: 2
tovaglioli bianco 24x24
Patate 10 kg

Grazie!', 'tovaglioli bianco 24x24
Patate 10 kg', 'sent', NULL, '2025-10-30 22:12:52.884018+00', '2025-10-30 22:12:52.884018+00', NULL),
	('73dc6cb4-5b9b-4623-906a-5dcf4810c015', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'df99037c-1085-4760-bbbf-cac576ba9e6f', '

• Cetrioli: 1 c
• Grappolo: 1 c
• Lattuga: 1 c

Grazie!', NULL, 'sent', NULL, '2025-10-30 22:13:11.158807+00', '2025-10-30 22:13:11.158807+00', NULL),
	('fa6e8fd3-0a13-4ae7-bb71-8486563a0c0f', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', 'X SF:

• Asado: 1

Grazie!', NULL, 'sent', NULL, '2025-10-30 22:13:22.230698+00', '2025-10-30 22:13:22.230698+00', NULL),
	('7f1fc213-030b-451d-843e-464759af019c', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Maionese BG: Serve
• Pastrami: Serve
• Scatola panino: Serve
• Poké e coperchio: Serve

Grazie!', NULL, 'sent', NULL, '2025-10-30 22:13:29.428158+00', '2025-10-30 22:13:29.428158+00', NULL),
	('5f1cae9e-d074-4007-8cb0-af135f71dbc4', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'X SF:



• Fuselli Panati: 10
• Shnitzel: 20
• Bocconcini di Pollo: 3 kg
Petti di pollo 1 kg


Grazie!', 'Petti di pollo 1 kg
', 'sent', NULL, '2025-10-30 22:13:40.625421+00', '2025-10-30 22:13:40.625421+00', NULL),
	('7bf74c68-e753-4b1c-a39e-052e4993abb5', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 2

Grazie!', NULL, 'sent', NULL, '2025-10-30 22:13:52.786507+00', '2025-10-30 22:13:52.786507+00', NULL),
	('8f4eace5-ac02-4ef1-9a0f-d5ef8ec44afa', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1.5

Grazie!', NULL, 'sent', NULL, '2025-11-01 23:17:22.00018+00', '2025-11-01 23:17:22.00018+00', NULL),
	('f892e81a-910c-4048-9cca-361a5df1bdf7', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Satola sfizi: Serve
• Poké e coperchio: Serve
• Cheddar: Serve
Pomodoro 3 barattoli

Grazie!', 'Pomodoro 3 barattoli', 'sent', NULL, '2025-11-02 22:08:12.973589+00', '2025-11-02 22:08:12.973589+00', NULL),
	('82d3e8b0-f7a2-457f-8284-542b33727f83', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'X SF:



• Shnitzel: 10
• Bocconcini di Pollo: 2kg

Grazie!', NULL, 'sent', NULL, '2025-11-02 22:08:22.024938+00', '2025-11-02 22:08:22.024938+00', NULL),
	('9502e299-6934-4a24-99cb-0f12353db295', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1,5

Grazie!', NULL, 'sent', NULL, '2025-11-02 22:08:34.539374+00', '2025-11-02 22:08:34.539374+00', NULL),
	('d1b5c6d6-b16f-4831-8cd8-c6b8f3486905', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '

• Songino: 2
• Rucola: 2

Grazie!', NULL, 'sent', NULL, '2025-11-02 22:08:44.848683+00', '2025-11-02 22:08:44.848683+00', NULL),
	('d3c783d0-4758-477a-bae5-8db0e8da6f34', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', 'X SF:

• Bresaola: Serve
• Asado: 1
roast-beef 
Salsiccia 6

Grazie!', 'roast-beef 
Salsiccia 6', 'sent', NULL, '2025-11-02 22:09:09.229118+00', '2025-11-02 22:09:09.229118+00', NULL),
	('1f3a27ac-4daa-428d-8c82-e20cd107fc26', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'df99037c-1085-4760-bbbf-cac576ba9e6f', '

• Grappolo: 1 c

Grazie!', NULL, 'sent', NULL, '2025-11-02 22:09:18.879973+00', '2025-11-02 22:09:18.879973+00', NULL),
	('703e5934-84d3-4eaa-a4b0-7efbc44a25f3', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1

Grazie!', NULL, 'sent', NULL, '2025-11-03 09:50:13.870408+00', '2025-11-03 09:50:13.870408+00', NULL),
	('5cb259a3-3a6d-4db9-8cf4-484b582b8183', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1.5

Grazie!', NULL, 'sent', NULL, '2025-11-03 22:00:43.795192+00', '2025-11-03 22:00:43.795192+00', NULL),
	('8cc928a7-5066-49e9-ac3d-53e2ecf88126', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'X SF:



• Bocconcini di Pollo: 2 kg
• Fettine Panate: 6
• Straccetti: 1 kg
petti di pollo 1 kg
Pulled beef 5 kg

Grazie!', 'petti di pollo 1 kg
Pulled beef 5 kg', 'sent', NULL, '2025-11-03 22:00:54.754739+00', '2025-11-03 22:00:54.754739+00', NULL),
	('2adc0644-7fde-4bfb-a472-de50ee8962d7', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '

• Songino: 2
• Rucola: 2
• Guanti L: 2
• Manitoba: 25kg
Patate 5kg

Grazie!', 'Patate 5kg', 'sent', NULL, '2025-11-03 22:01:05.198608+00', '2025-11-03 22:01:05.198608+00', NULL),
	('9b2c67b8-ddc8-4e2f-8cc0-89b2ad585194', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', 'X SF:

• Asado: 1
• Shawarma: 5kg

Grazie!', NULL, 'sent', NULL, '2025-11-03 22:01:26.721908+00', '2025-11-03 22:01:26.721908+00', NULL),
	('0c088159-fc23-46b0-ab79-07c5aa4fe614', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Pastrami: Serve
• Pita: Serve

Grazie!', NULL, 'sent', NULL, '2025-11-04 21:44:33.529843+00', '2025-11-04 21:44:33.529843+00', NULL),
	('ba14bc26-58ac-4d9c-aa7a-c707c4a32859', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'X SF:



• Shnitzel: 15
• Francesine: 3 kg
• Bocconcini di Pollo: 2 kg

Grazie!', NULL, 'sent', NULL, '2025-11-04 21:44:42.246301+00', '2025-11-04 21:44:42.246301+00', NULL),
	('7d5fcc7a-4cb0-4cf0-83a8-49040c525e63', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1.5

Grazie!', NULL, 'sent', NULL, '2025-11-04 21:44:50.348961+00', '2025-11-04 21:44:50.348961+00', NULL),
	('8c9e47bf-92c2-4715-a720-5ed66dbf0c12', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '

• Tris Posate Monouso: 1 c
• Rotoli carta: 2
Pellicola alimentare 2
Patate 5 kg

Grazie!', 'Pellicola alimentare 2
Patate 5 kg', 'sent', NULL, '2025-11-04 21:45:17.625349+00', '2025-11-04 21:45:17.625349+00', NULL),
	('b0a21730-12bf-4771-95ed-37c3a7d89131', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', 'X SF:

• Carne secca: Serve
• Shawarma: 10

Grazie!', NULL, 'sent', NULL, '2025-11-04 21:45:28.51693+00', '2025-11-04 21:45:28.51693+00', NULL),
	('685c6f90-4e77-4e8f-adbd-56f89a5fb405', '7b4b20cc-a236-4766-9680-59d917b8f5eb', '1f5a15dc-43a6-4985-a9b4-8f73997d4443', 'Buongiorno, vorremmo ordinare i seguenti prodotti:

• bistecche: 10

Grazie!', NULL, 'sent', NULL, '2025-11-05 09:07:53.244892+00', '2025-11-05 09:07:53.244892+00', NULL),
	('d69e917a-5003-4700-a954-af7bd097f18e', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Goldstar: 1 c

Grazie!', NULL, 'sent', NULL, '2025-11-05 22:15:03.80571+00', '2025-11-05 22:15:03.80571+00', NULL),
	('5de1e093-7e78-4e05-81db-2767024e03f5', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'X SF:



• Shnitzel: 15
• Bocconcini di Pollo: 2 kg
• Fettine Panate: 10
Pulled beef 5 kg
Petto di pollo a strisce panato 0.5 kg

Grazie!', 'Pulled beef 5 kg
Petto di pollo a strisce panato 0.5 kg', 'sent', NULL, '2025-11-05 22:15:13.290311+00', '2025-11-05 22:15:13.290311+00', NULL),
	('7c0d09df-5f23-4644-ab68-62c837511aba', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1.5

Grazie!', NULL, 'sent', NULL, '2025-11-05 22:16:05.773275+00', '2025-11-05 22:16:05.773275+00', NULL),
	('f1849a9e-174d-4744-bfc3-13898cb187cd', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Per Ruben Srl entro le 10

• Olio Bustine: 1 c
• Cavolo Rosso: 2
Patate 5 kg

Grazie!', 'Patate 5 kg', 'sent', NULL, '2025-11-05 22:16:14.103738+00', '2025-11-05 22:16:14.103738+00', NULL),
	('2f02d324-3752-4edd-ae05-906732fca33f', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', 'X SF:

• Sfoglia: 1kg
• Asado: 1

Grazie!', NULL, 'sent', NULL, '2025-11-05 22:16:24.64058+00', '2025-11-05 22:16:24.64058+00', NULL),
	('3412c5af-09cc-4483-9986-a8f5a57be368', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Cetriolini: Serve
• Senape: Serve

Grazie!', NULL, 'sent', NULL, '2025-11-06 22:18:57.911497+00', '2025-11-06 22:18:57.911497+00', NULL),
	('cea33f8d-138f-47e7-9807-971a866eb993', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'X SF:



• Fuselli Panati: 5
• Shnitzel: 15
• Fettine Panate: 10
• Straccetti: 1kg
Strip di pollo 1kg

Grazie!', 'Strip di pollo 1kg', 'sent', NULL, '2025-11-06 22:19:08.553884+00', '2025-11-06 22:19:08.553884+00', NULL),
	('b5619b2a-c460-4217-adb2-f1758d352179', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 2

Grazie!', NULL, 'sent', NULL, '2025-11-06 22:19:19.71651+00', '2025-11-06 22:19:19.71651+00', NULL),
	('326dae34-cb08-4c89-8217-7a8ca0226441', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Per Ruben Srl entro le 10

• Rotoli carta: 3
• Manitoba: 25kg

Grazie!', NULL, 'sent', NULL, '2025-11-06 22:19:26.961633+00', '2025-11-06 22:19:26.961633+00', NULL),
	('2d969d0c-2bbd-4827-bf6b-91423aa46abc', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'df99037c-1085-4760-bbbf-cac576ba9e6f', '

• Grappolo: 1 c

Grazie!', NULL, 'sent', NULL, '2025-11-06 22:19:38.483945+00', '2025-11-06 22:19:38.483945+00', NULL),
	('5b0e490f-6b4a-4e10-be9e-28eb68a90c9c', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1.5

Grazie!', NULL, 'sent', NULL, '2025-11-08 22:11:32.568306+00', '2025-11-08 22:11:32.568306+00', NULL),
	('1402d60a-60ef-4985-a897-cb7e83eabc14', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Per Ruben Srl entro le 10

• Guanti L: 2
patate 5kg
Lattuga 4 piante
Bicchiere crystal 250 ml 200

Grazie!', 'patate 5kg
Lattuga 4 piante
Bicchiere crystal 250 ml 200', 'sent', NULL, '2025-11-08 22:11:40.447501+00', '2025-11-08 22:11:40.447501+00', NULL),
	('1bf789a9-da0d-4dc9-98fd-321425ed18fd', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Senape: Serve
• Porchetta: Serve
Falafel

Grazie!', 'Falafel', 'sent', NULL, '2025-11-09 22:11:33.787735+00', '2025-11-09 22:11:33.787735+00', NULL),
	('b0bf7868-adec-4b18-8269-253d9a05d1b2', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'X SF:



• Fuselli Panati: 6
• Shnitzel: 10
• Francesine: 3kg
• Bocconcini di Pollo: 2 kg
• Fettine Panate: 10
• Petti di Pollo: 1 kg
Pulled beef 3 kg

Grazie!', 'Pulled beef 3 kg', 'sent', NULL, '2025-11-09 22:11:44.092342+00', '2025-11-09 22:11:44.092342+00', NULL),
	('d25c037a-0363-4c25-9528-256efaf7c1dc', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1.5

Grazie!', NULL, 'sent', NULL, '2025-11-09 22:11:52.331687+00', '2025-11-09 22:11:52.331687+00', NULL),
	('56ff10af-b3ed-4559-84cd-a774f8e0c5e8', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Per Ruben Srl entro le 10

• Songino: 2
• Rucola: 2
Patate 10 kg
Lievito 1 c

Grazie!', 'Patate 10 kg
Lievito 1 c', 'sent', NULL, '2025-11-09 22:12:00.023116+00', '2025-11-09 22:12:00.023116+00', NULL),
	('8214dcba-be4c-48bc-a3a2-3351cc343055', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', 'X SF:

• Carne secca: Serve
• Bresaola: Serve
• Asado: 1
• Shawarma: 5 kg
roast-beef 

Grazie!', 'roast-beef ', 'sent', NULL, '2025-11-09 22:12:14.737747+00', '2025-11-09 22:12:14.737747+00', NULL),
	('d96556ef-b675-46a0-96e6-a515d2fcee50', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 78

Grazie!', NULL, 'sent', NULL, '2025-11-10 16:15:50.013201+00', '2025-11-10 16:15:50.013201+00', NULL),
	('8d5a7f18-fd17-427e-a192-f2f050577cc4', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 78

Grazie!', NULL, 'sent', NULL, '2025-11-10 16:19:27.908578+00', '2025-11-10 16:19:27.908578+00', NULL),
	('1aef089b-fec5-4b3d-977c-1295249cc112', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 78

Grazie!', NULL, 'sent', NULL, '2025-11-10 16:20:06.019739+00', '2025-11-10 16:20:06.019739+00', NULL),
	('5fd3d4e3-ec75-4a7a-a703-eab4b9f582c0', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Per Ruben Srl entro le 10

• Pepe Bustine: 5

Grazie!', NULL, 'sent', NULL, '2025-11-10 17:39:59.843741+00', '2025-11-10 17:39:59.843741+00', NULL),
	('e03a0a7e-2e5e-4a3b-add1-b25caa189f07', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Per Ruben Srl entro le 10

• Pepe Bustine: 4

Grazie!', NULL, 'sent', NULL, '2025-11-10 17:42:21.868755+00', '2025-11-10 17:42:21.868755+00', NULL),
	('07f516cf-81a7-41cc-8427-6f211adac54b', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Per Ruben Srl entro le 10

• Manitoba: 25 kg

Grazie!', NULL, 'sent', NULL, '2025-11-10 22:31:49.156457+00', '2025-11-10 22:31:49.156457+00', NULL),
	('06c14502-8dc8-4537-b439-b0ca785812a3', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'df99037c-1085-4760-bbbf-cac576ba9e6f', '

• Grappolo: 1 c
• Patate: 5 kg

Grazie!', NULL, 'sent', NULL, '2025-11-10 22:32:12.432297+00', '2025-11-10 22:32:12.432297+00', NULL),
	('937a584f-d757-4765-88af-880026710a5d', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Maionese BG: Serve
• Cheddar: Serve 

Grazie!', NULL, 'sent', NULL, '2025-11-10 22:32:26.41991+00', '2025-11-10 22:32:26.41991+00', NULL),
	('3abcf165-ec53-42dd-a521-506f75771988', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '', NULL, 'sent', NULL, '2025-11-19 17:35:01.774243+00', '2025-11-19 17:35:01.774243+00', NULL),
	('91db7573-1005-41d7-bc68-cf187e76bfd0', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'X SF:



• Shnitzel: 10
• Petti di Pollo: 1 kg
• Straccetti: 1 kg

Grazie!', NULL, 'sent', NULL, '2025-11-10 22:32:35.255309+00', '2025-11-10 22:32:35.255309+00', NULL),
	('b21b2fef-9fe4-42a7-93a2-52d8a46a8744', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1.5 

Grazie!', NULL, 'sent', NULL, '2025-11-10 22:32:49.991265+00', '2025-11-10 22:32:49.991265+00', NULL),
	('ccfce4b5-764c-4082-83e6-2adc9441054d', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Per Ruben Srl entro le 10

• Olio Bustine: 2

Grazie!', NULL, 'sent', NULL, '2025-11-11 16:05:01.741118+00', '2025-11-11 16:05:01.741118+00', NULL),
	('d7537698-f485-44e2-adc8-d5578c81ae89', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '

• Paprika Affumicata: 1

Grazie!', NULL, 'sent', NULL, '2025-11-11 16:06:41.417708+00', '2025-11-11 16:06:41.417708+00', NULL),
	('e712ceb5-0d35-45ac-b77e-5c8fc95db508', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '

• Olio Bustine: 1

Grazie!', NULL, 'sent', NULL, '2025-11-11 16:12:30.038386+00', '2025-11-11 16:12:30.038386+00', NULL),
	('19a2b830-f03e-4c0a-9ceb-383bd7e59e94', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '

• Pepe Bustine: 7

Grazie!', NULL, 'sent', NULL, '2025-11-11 16:32:58.257981+00', '2025-11-11 16:32:58.257981+00', NULL),
	('ab93d72a-0f6d-4153-be9f-0b44112b6d9a', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '

• Olio Bustine: 4

Grazie!', NULL, 'sent', NULL, '2025-11-11 17:11:01.609461+00', '2025-11-11 17:11:01.609461+00', NULL),
	('27de764f-a1e4-4060-9dbd-1693e97fe704', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1.5

Grazie!', NULL, 'sent', NULL, '2025-11-11 17:34:11.323417+00', '2025-11-11 17:34:11.323417+00', NULL),
	('3b3884d7-c3ba-4786-b055-d52b0e8af33f', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Satola sfizi: Serve
• Scatola panino: Serve
• Busta SF: Serve
Spezia Shawarma 

Grazie!', 'Spezia Shawarma ', 'sent', NULL, '2025-11-11 22:48:11.463965+00', '2025-11-11 22:48:11.463965+00', NULL),
	('78127a48-ce36-48f8-9490-0df6edd23c5c', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'X SF:

• Fuselli Panati: 6
• Shnitzel: 10
Pollo crispy 1kg

Grazie!', 'Pollo crispy 1kg', 'sent', NULL, '2025-11-11 22:48:19.87466+00', '2025-11-11 22:48:19.87466+00', NULL),
	('d8a8fba2-330e-4553-81db-0f4fe0bcbf2f', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1

Grazie!', NULL, 'sent', NULL, '2025-11-11 22:48:26.903886+00', '2025-11-11 22:48:26.903886+00', NULL),
	('a6444d79-3f9f-4d97-a8a5-1b681b08f71a', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '

• Tovaglioli neri 24x24: 1 c
• Rotoli carta: 2
• Cavolo Rosso: 2
Spray per moscerini 2

Grazie!', 'Spray per moscerini 2', 'sent', NULL, '2025-11-11 22:48:33.630908+00', '2025-11-11 22:48:33.630908+00', NULL),
	('d08acf5e-2aa9-4ccb-939a-32652669155c', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', 'X SF:

• Asado: 1

Grazie!', NULL, 'sent', NULL, '2025-11-11 22:49:05.241189+00', '2025-11-11 22:49:05.241189+00', NULL),
	('c45c446f-31cc-4f47-baaa-d51358f6de2b', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '

• Tovaglioli neri 24x24: 1 c
• Rotoli carta: 2
• Cavolo Rosso: 2
Spray moscerini 2

Grazie!', 'Spray moscerini 2', 'sent', NULL, '2025-11-11 22:50:51.570123+00', '2025-11-11 22:50:51.570123+00', NULL),
	('e963ce92-2914-4936-a97d-1e3db0a0b0a0', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1

Grazie!', NULL, 'sent', NULL, '2025-11-12 15:02:49.477858+00', '2025-11-12 15:02:49.477858+00', NULL),
	('e330c001-c6f2-4c39-adc1-4896cdee8cce', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '

• Pepe Bustine: 1

Grazie!', NULL, 'sent', NULL, '2025-11-12 16:20:45.570436+00', '2025-11-12 16:20:45.570436+00', NULL),
	('abe802dd-c60d-4028-9d66-9ca4a6f00148', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1

Grazie!', NULL, 'sent', NULL, '2025-11-12 17:40:34.851458+00', '2025-11-12 17:40:34.851458+00', NULL),
	('2deeef12-1333-4dd3-97eb-8475e96a4d81', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '

• Pepe Bustine: 1

Grazie!', NULL, 'sent', NULL, '2025-11-12 20:14:32.542204+00', '2025-11-12 20:14:32.542204+00', NULL),
	('e13e9d6a-83b9-4fd4-a9fd-a8b6230a94d0', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '

• Paprika Affumicata: 1

Grazie!', NULL, 'sent', NULL, '2025-11-12 20:14:54.174807+00', '2025-11-12 20:14:54.174807+00', NULL),
	('c8233e9c-1f13-41e6-95db-12a5dcf81553', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Peperoncino olio: 1
• Carta forno: Serve
• Senape: Serve
• Pita: 1 c
• Poké e coperchio: Serve

Grazie!', NULL, 'sent', NULL, '2025-11-13 00:33:11.378553+00', '2025-11-13 00:33:11.378553+00', NULL),
	('26d13db1-fb69-4a87-a203-1ddc7425a5b8', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'X SF:

• Shnitzel: 10
• Petti di Pollo: 1 kg
• Bocconcini di Pollo: 2 kg
• Fettine Panate: 10
• Straccetti: 1 kg
Pulled beef 5 kg

Grazie!', 'Pulled beef 5 kg', 'sent', NULL, '2025-11-13 00:33:20.59555+00', '2025-11-13 00:33:20.59555+00', NULL),
	('ec4b2baf-9005-43ce-af81-322cb6c72bb8', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1.5 

Grazie!', NULL, 'sent', NULL, '2025-11-13 00:33:29.052652+00', '2025-11-13 00:33:29.052652+00', NULL),
	('66f96c03-8bd2-40fa-ba94-75f2723c3f20', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '

• Rucola: 3
• Songino: 3
• Cipolla Rossa: 1kg
• Sapone Piatti: 2 tan
• Lavapavimenti: 2 tan
• Rotoli carta: 2
• Paprika Affumicata: 2

Grazie!', NULL, 'sent', NULL, '2025-11-13 00:33:38.029481+00', '2025-11-13 00:33:38.029481+00', NULL),
	('6227c768-91a4-43a6-a4a1-2dbaadf4494a', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'df99037c-1085-4760-bbbf-cac576ba9e6f', '

• Cetrioli: 1 c
• Patate: 5 kg
• Lattuga: 4
cicoria 1 c

Grazie!', 'cicoria 1 c', 'sent', NULL, '2025-11-13 00:33:50.642981+00', '2025-11-13 00:33:50.642981+00', NULL),
	('0b18abef-54eb-485a-b004-617174189dec', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 2

Grazie!', NULL, 'sent', NULL, '2025-11-13 22:16:57.044846+00', '2025-11-13 22:16:57.044846+00', NULL),
	('24e3b7b3-7971-4fde-afeb-868550acde16', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '

• Guanti L: Serve
• Sale Bustine: Serve
• Manitoba: 25kg

Prodotti aggiuntivi:
Pellicola 

Grazie!', 'Pellicola ', 'sent', NULL, '2025-11-13 22:17:18.248959+00', '2025-11-13 22:17:18.248959+00', NULL),
	('6b550d01-96ea-42ea-83dd-2e0f31c44764', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'df99037c-1085-4760-bbbf-cac576ba9e6f', 'Per Ruben SRL:

• Patate: Kg

Grazie!', NULL, 'sent', NULL, '2025-11-13 22:17:34.946915+00', '2025-11-13 22:17:34.946915+00', NULL),
	('e94faadb-5cec-4281-aeb2-d01b82755029', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'X SF:

• Shnitzel: 10
• Fuselli Panati: 10
• Bocconcini di Pollo: 2 kg

Prodotti aggiuntivi:
Salsiccia di Chianina Serve
Chicken Fries 2kg

Grazie!', 'Salsiccia di Chianina Serve
Chicken Fries 2kg', 'sent', NULL, '2025-11-13 22:17:57.729719+00', '2025-11-13 22:17:57.729719+00', NULL),
	('78602df0-7995-4548-a149-d284a058ce52', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '

• Guanti L: Serve
• Sale Bustine: Serve
• Manitoba: 25kg
Pellicola 

Grazie!', 'Pellicola ', 'sent', NULL, '2025-11-13 22:18:50.4897+00', '2025-11-13 22:18:50.4897+00', NULL),
	('20c72696-29dc-49c8-8569-bcae78153880', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1

Grazie!', NULL, 'sent', NULL, '2025-11-14 00:56:51.441287+00', '2025-11-14 00:56:51.441287+00', NULL),
	('a60105b6-2b48-4c74-91f3-3512958f6808', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1

Grazie!', NULL, 'sent', NULL, '2025-11-14 01:06:34.393744+00', '2025-11-14 01:06:34.393744+00', NULL),
	('d90366cc-2911-4a89-b149-2dbf36495360', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Bomba Piccante: 2

Grazie!', NULL, 'sent', NULL, '2025-11-14 01:06:40.111881+00', '2025-11-14 01:06:40.111881+00', NULL),
	('bfb55658-a9aa-44b2-a19b-0db38285c08e', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1

Grazie!', NULL, 'sent', NULL, '2025-11-14 01:11:46.13143+00', '2025-11-14 01:11:46.13143+00', NULL),
	('48337778-c028-49cb-b344-2c2ff07f43eb', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Bomba Piccante: 2

Grazie!', NULL, 'sent', NULL, '2025-11-14 01:11:49.960824+00', '2025-11-14 01:11:49.960824+00', NULL),
	('025a984c-a505-4630-813d-bfc780f16e85', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 4

Grazie!', NULL, 'sent', NULL, '2025-11-14 01:23:38.483693+00', '2025-11-14 01:23:38.483693+00', NULL),
	('f9d17746-18b7-42e7-bd53-6f6968755298', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'X SF:

• Bocconcini di Pollo: 5

Grazie!', NULL, 'sent', NULL, '2025-11-14 01:23:44.131865+00', '2025-11-14 01:23:44.131865+00', NULL),
	('09924428-7297-4bab-810e-bcfb757bfc3a', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', 'X SF:

• Sfoglia: 6

Grazie!', NULL, 'sent', NULL, '2025-11-14 01:23:47.26721+00', '2025-11-14 01:23:47.26721+00', NULL),
	('fcf3912c-c4eb-41e0-b500-0870f7a1148c', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 6

Grazie!', NULL, 'sent', NULL, '2025-11-14 01:29:26.077623+00', '2025-11-14 01:29:26.077623+00', NULL),
	('4961e6f3-c9ab-4412-8738-bd2dbb2aaffa', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'X SF:

• Macinato: 6

Grazie!', NULL, 'sent', NULL, '2025-11-14 01:29:29.931101+00', '2025-11-14 01:29:29.931101+00', NULL),
	('9aef50c3-6c94-4d01-ad62-30da32e05efe', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1

Grazie!', NULL, 'sent', NULL, '2025-11-14 01:31:45.939991+00', '2025-11-14 01:31:45.939991+00', NULL),
	('202f33c9-4926-4960-9c00-d3ae03e7a604', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'X SF:

• Francesine: 1

Grazie!', NULL, 'sent', NULL, '2025-11-14 01:31:50.122347+00', '2025-11-14 01:31:50.122347+00', NULL),
	('caa64b65-c749-4e8f-897e-d83dd3829315', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1

Grazie!', NULL, 'sent', NULL, '2025-11-14 01:32:54.69118+00', '2025-11-14 01:32:54.69118+00', NULL),
	('8ef229d6-97b5-4ddb-bbcd-37c9284c848d', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'X SF:

• Fettine Panate: 1

Grazie!', NULL, 'sent', NULL, '2025-11-14 01:32:57.922245+00', '2025-11-14 01:32:57.922245+00', NULL),
	('ea9dbb3a-927b-448a-8716-f7b912087f49', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1

Grazie!', NULL, 'sent', NULL, '2025-11-14 01:35:31.081855+00', '2025-11-14 01:35:31.081855+00', NULL),
	('b35a5357-a6d5-41d5-b2ad-e4e5859aa0e2', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'X SF:

• Shnitzel: 1

Grazie!', NULL, 'sent', NULL, '2025-11-14 01:35:43.199523+00', '2025-11-14 01:35:43.199523+00', NULL),
	('98fe2787-3c77-4c61-8768-2453820de3dd', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1

Grazie!', NULL, 'sent', NULL, '2025-11-14 02:25:28.339472+00', '2025-11-14 02:25:28.339472+00', NULL),
	('d5f48fca-e31c-487f-84d0-94852527abb9', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '

• Paprika Dolce: 2

Grazie!', NULL, 'sent', NULL, '2025-11-14 16:32:43.936419+00', '2025-11-14 16:32:43.936419+00', NULL),
	('5d7ef04e-99ba-4a9e-8835-ad7d8a8e309c', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '

• Songino: 2
• Rucola: 2
Patate 5kg
Lattuga 4 pezzi

Grazie!', 'Patate 5kg
Lattuga 4 pezzi', 'sent', NULL, '2025-11-15 22:34:33.942547+00', '2025-11-15 22:34:33.942547+00', NULL),
	('b244c00a-a636-4220-8f8c-c88de7de5404', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1.5

Grazie!', NULL, 'sent', NULL, '2025-11-15 22:34:40.314294+00', '2025-11-15 22:34:40.314294+00', NULL),
	('7cfbf3ca-3950-4103-af08-268e8ca6131e', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• BBQ: Serve
• Porchetta: Serve
• Pastrami: serve 
• Goldstar: Serve
• Satola sfizi: Serve
Pomodoro barattolo 3

Grazie!', 'Pomodoro barattolo 3', 'sent', NULL, '2025-11-16 22:13:27.519151+00', '2025-11-16 22:13:27.519151+00', NULL),
	('8dfaa9d7-69d4-4bc8-870e-ec08dbd89bc3', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'X SF:

• Fuselli Panati: 6
• Shnitzel: 10
• Petti di Pollo: 1 kg
• Pulled beef: 5 kg

Grazie!', NULL, 'sent', NULL, '2025-11-16 22:13:35.259815+00', '2025-11-16 22:13:35.259815+00', NULL),
	('946e2a4e-5f7e-482a-9c83-753f9350ce4f', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1.5

Grazie!', NULL, 'sent', NULL, '2025-11-16 22:13:44.862801+00', '2025-11-16 22:13:44.862801+00', NULL),
	('15ab20a9-ad39-48db-b493-991f1d794151', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '

• Rotoli carta: 2
• Guanti L: 2
Bicchiere crystal 250 ml 100

Grazie!', 'Bicchiere crystal 250 ml 100', 'sent', NULL, '2025-11-16 22:14:44.263119+00', '2025-11-16 22:14:44.263119+00', NULL),
	('b67d8c18-3a59-42c0-a9a5-21aafcb9517a', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', 'X SF:

• Sfoglia: 1 kg
• Asado: 1 kg
• Shawarma: 5 kg

Grazie!', NULL, 'sent', NULL, '2025-11-16 22:14:54.577604+00', '2025-11-16 22:14:54.577604+00', NULL),
	('afab1537-5327-4c77-834b-ac2b6ce7f9ea', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1

Grazie!', NULL, 'sent', NULL, '2025-11-17 00:23:49.464653+00', '2025-11-17 00:23:49.464653+00', NULL),
	('f709495a-e199-40c7-aea1-033c46a2338c', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'Peperoncino olio: Serve', '', 'sent', NULL, '2025-11-17 22:00:02.528441+00', '2025-11-17 22:00:02.528441+00', NULL),
	('7cabf187-0725-4e12-b46d-bad1e058b577', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'Peperoncino olio: Serve', '', 'sent', NULL, '2025-11-17 22:00:08.807664+00', '2025-11-17 22:00:08.807664+00', NULL),
	('78b39e2e-d7a2-47cc-b933-b9d23dcf475a', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'Peperoncino olio: Serve', '', 'sent', NULL, '2025-11-17 22:01:06.624757+00', '2025-11-17 22:01:06.624757+00', NULL),
	('aa74cc32-28e9-4a0c-b3f2-a2fcc28c238b', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'Peperoncino olio: Serve', '', 'sent', NULL, '2025-11-17 22:01:20.752119+00', '2025-11-17 22:01:20.752119+00', NULL),
	('993dd022-3e84-4e46-9f54-598defa8d2c6', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'Peperoncino olio: Serve', '', 'sent', NULL, '2025-11-17 22:03:33.465869+00', '2025-11-17 22:03:33.465869+00', NULL),
	('d04098a7-6110-466b-bd2c-836445e30ab6', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Peperoncino olio: serve

Grazie!', NULL, 'sent', NULL, '2025-11-17 22:45:47.679673+00', '2025-11-17 22:45:47.679673+00', NULL),
	('d63f829e-9b69-4428-979a-1a3df15f1b77', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'df99037c-1085-4760-bbbf-cac576ba9e6f', 'Per Ruben SRL:

• Cipolla Bianca: 1 c

Grazie!', NULL, 'sent', NULL, '2025-11-17 22:45:57.9844+00', '2025-11-17 22:45:57.9844+00', NULL),
	('3c163081-52d5-4c4b-9fc7-40099f601dd5', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '

• Cipolla Rossa: 1 kg

Grazie!', NULL, 'sent', NULL, '2025-11-17 22:46:13.415962+00', '2025-11-17 22:46:13.415962+00', NULL),
	('caaf39dc-c5d0-4ec5-97d5-4da03a045fad', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1

Grazie!', NULL, 'sent', NULL, '2025-11-18 01:09:07.968529+00', '2025-11-18 01:09:07.968529+00', NULL),
	('fb1858ef-7e32-4652-a3ec-0d08e44647e4', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1

Grazie!', NULL, 'sent', NULL, '2025-11-18 01:09:19.357028+00', '2025-11-18 01:09:19.357028+00', NULL),
	('b4c7a3ee-c88c-401f-9828-c88398765ccf', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1

Grazie!', NULL, 'sent', NULL, '2025-11-18 01:15:19.049011+00', '2025-11-18 01:15:19.049011+00', NULL),
	('29f00783-faee-456b-83ec-e222c56d04cf', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1

Grazie!', NULL, 'sent', NULL, '2025-11-18 01:15:48.395614+00', '2025-11-18 01:15:48.395614+00', NULL),
	('47baf313-f9ab-4d85-a7e2-cdc46dd1a1ca', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1

Grazie!', NULL, 'sent', NULL, '2025-11-18 01:23:44.30843+00', '2025-11-18 01:23:44.30843+00', NULL),
	('24c602ab-0aca-4208-8051-927552f3596b', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1

Grazie!', NULL, 'sent', NULL, '2025-11-18 01:24:17.849136+00', '2025-11-18 01:24:17.849136+00', NULL),
	('d62a87e4-5398-494e-8417-db58756957bf', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'X SF:

• Shnitzel: 1

Grazie!', NULL, 'sent', NULL, '2025-11-18 01:24:43.77361+00', '2025-11-18 01:24:43.77361+00', NULL),
	('e0545f26-50f8-4e69-85c0-bca478adc1bd', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 8

Grazie!', NULL, 'sent', NULL, '2025-11-18 01:37:44.482263+00', '2025-11-18 01:37:44.482263+00', NULL),
	('3bf9f78c-5164-4493-aa58-0be3d9a1dd6f', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 8

Grazie!', NULL, 'sent', NULL, '2025-11-18 01:37:55.692725+00', '2025-11-18 01:37:55.692725+00', NULL),
	('5ccce817-90eb-42d6-a714-661e7383f6ba', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 8

Grazie!', NULL, 'sent', NULL, '2025-11-18 01:55:42.553648+00', '2025-11-18 01:55:42.553648+00', NULL),
	('c1fe9f8d-8f7f-4481-979b-7db04b3265c7', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1

Grazie!', NULL, 'sent', NULL, '2025-11-18 01:57:51.520506+00', '2025-11-18 01:57:51.520506+00', NULL),
	('1fc3a41d-f8fd-405f-aa98-6bccc6b1dbc5', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1

Grazie!', NULL, 'sent', NULL, '2025-11-18 10:34:06.915964+00', '2025-11-18 10:34:06.915964+00', NULL),
	('78d2a548-da24-49ca-8d14-20a219331bcb', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1

Grazie!', NULL, 'sent', NULL, '2025-11-18 10:34:53.78105+00', '2025-11-18 10:34:53.78105+00', NULL),
	('0600a293-5497-491e-87e0-93e879f04cf2', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1

Grazie!', NULL, 'sent', NULL, '2025-11-18 12:54:45.059788+00', '2025-11-18 12:54:45.059788+00', NULL),
	('544e909a-a859-49dd-a28e-758c5499bded', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Peperoncino olio: 1

Grazie!', NULL, 'sent', NULL, '2025-11-18 13:47:10.581973+00', '2025-11-18 13:47:10.581973+00', NULL),
	('b921c62d-e130-42c5-8fd8-2ecdcaa3e9a3', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', 'X SF:

• Carne secca: 1

Grazie!', NULL, 'sent', NULL, '2025-11-18 16:33:30.241901+00', '2025-11-18 16:33:30.241901+00', NULL),
	('871297e3-d9f8-478b-b8e9-b8bde4d733d8', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1

Grazie!', NULL, 'sent', NULL, '2025-11-18 17:33:01.416957+00', '2025-11-18 17:33:01.416957+00', NULL),
	('ae7e4604-b092-4f7b-b0d6-42b321782c5b', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', '', NULL, 'sent', NULL, '2025-11-18 18:03:20.244+00', '2025-11-18 18:03:20.442637+00', NULL),
	('0a6ed695-e359-43af-9d05-b67d45f0c0fd', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Maionese BG: Serve
• Pita: 1
• Scatola panino: Serve

Grazie!', NULL, 'sent', NULL, '2025-11-18 21:58:26.15258+00', '2025-11-18 21:58:26.15258+00', NULL),
	('0af8b071-0d9f-407f-8abd-34d713ebc08d', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'X SF:

• Shnitzel: 15
• Petti di Pollo: 1 kg
• Bocconcini di Pollo: 1.5 kg
• Straccetti: 1 kg
• Pollo crispy: 1 kg

Grazie!', NULL, 'sent', NULL, '2025-11-18 21:58:33.468808+00', '2025-11-18 21:58:33.468808+00', NULL),
	('98770143-97e7-4f21-97d6-5a1cd6582334', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1.5

Grazie!', NULL, 'sent', NULL, '2025-11-18 21:58:39.916285+00', '2025-11-18 21:58:39.916285+00', NULL),
	('644576ea-addc-4006-8252-a2dac268f3a4', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '

• Semola Rimacinata: 2
• Rotoli carta: 2
Bicchiere crystal 250 ml 200

Grazie!', 'Bicchiere crystal 250 ml 200', 'sent', NULL, '2025-11-18 21:58:45.907533+00', '2025-11-18 21:58:45.907533+00', NULL),
	('5f9aa518-ade0-4221-97bd-bf18b7f5f073', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'df99037c-1085-4760-bbbf-cac576ba9e6f', 'Per Ruben SRL:

• Cetrioli: 1 c
• Patate: 5kg

Grazie!', NULL, 'sent', NULL, '2025-11-18 22:27:29.318489+00', '2025-11-18 22:27:29.318489+00', NULL),
	('6112fa5b-7a7b-492f-a4d6-b532e82fc24e', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', 'X SF:

• Asado: 1

Grazie!', NULL, 'sent', NULL, '2025-11-18 22:27:41.773032+00', '2025-11-18 22:27:41.773032+00', NULL),
	('7a007cde-08e7-4dae-8381-5b87c63b3a70', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Bomba Piccante: 1

Grazie!', NULL, 'sent', NULL, '2025-11-19 14:11:10.979102+00', '2025-11-19 14:11:10.979102+00', NULL),
	('d9cf3185-b6fa-40a3-88e6-86400b25b27f', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Bomba Piccante: 1

Grazie!', NULL, 'sent', NULL, '2025-11-19 14:11:25.196093+00', '2025-11-19 14:11:25.196093+00', NULL),
	('6836d021-3641-48d9-8dd9-6bee65f153f8', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1

Grazie!', NULL, 'sent', NULL, '2025-11-19 15:39:38.796813+00', '2025-11-19 15:39:38.796813+00', NULL),
	('2fd97f2f-4821-4f79-992f-1f03d7a9e1d6', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1

Grazie!', NULL, 'sent', NULL, '2025-11-19 17:05:40.56654+00', '2025-11-19 17:05:40.56654+00', NULL),
	('86bbbef8-ff15-40b9-b27e-c7c46124d85c', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1

Grazie!', NULL, 'sent', NULL, '2025-11-19 17:06:14.178444+00', '2025-11-19 17:06:14.178444+00', NULL),
	('5aa7f1d9-97a3-4164-916a-f18fd50c02b2', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'df99037c-1085-4760-bbbf-cac576ba9e6f', 'Per Ruben SRL:

• Cicoria: 1

Grazie!', NULL, 'sent', NULL, '2025-11-19 17:06:16.473823+00', '2025-11-19 17:06:16.473823+00', NULL),
	('bc8f025c-ebfb-47bd-be77-325931a5dc74', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Peperoncino olio: 2

Grazie!', NULL, 'sent', NULL, '2025-11-19 17:12:03.435832+00', '2025-11-19 17:12:03.435832+00', NULL),
	('28a651bb-15cd-4bc8-8275-2515e63da225', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', 'X SF:

• Bresaola: 2

Grazie!', NULL, 'sent', NULL, '2025-11-19 17:12:35.552791+00', '2025-11-19 17:12:35.552791+00', NULL),
	('2f2ac058-13a1-4ff5-86ee-a2e30a881aee', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Salsa Chilly: 2

Grazie!', NULL, 'sent', NULL, '2025-11-19 17:12:38.143763+00', '2025-11-19 17:12:38.143763+00', NULL),
	('2fc7695f-cf75-4260-8408-6cf9f2e5a4af', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 4

Grazie!', NULL, 'sent', NULL, '2025-11-19 17:34:56.48316+00', '2025-11-19 17:34:56.48316+00', NULL),
	('d5335181-9826-4336-93aa-36414a776596', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 4

Grazie!', NULL, 'sent', NULL, '2025-11-19 17:37:37.305141+00', '2025-11-19 17:37:37.305141+00', NULL),
	('69a5027a-c35d-4280-83d5-37567b9cbc5e', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'X SF:

• Macinato: 5

Grazie!', NULL, 'sent', NULL, '2025-11-19 17:37:41.901948+00', '2025-11-19 17:37:41.901948+00', NULL),
	('c336d186-0cd1-4a6f-8921-3ecda4aa01cf', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 4

Grazie!', NULL, 'sent', NULL, '2025-11-19 18:55:30.559529+00', '2025-11-19 18:55:30.559529+00', NULL),
	('2e8ab5b2-0b62-4328-b8e5-ea294c1ff230', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Senape: 5

Grazie!', NULL, 'sent', NULL, '2025-11-19 18:55:34.95619+00', '2025-11-19 18:55:34.95619+00', NULL),
	('9ed16e5e-f2f4-4c85-aec1-66588df09fc1', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Peperoncino olio: 4

Grazie!', NULL, 'sent', NULL, '2025-11-19 18:55:59.867935+00', '2025-11-19 18:55:59.867935+00', NULL),
	('832bd04e-42bd-4383-b2d3-41dddac82de9', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', 'X SF:

• Bresaola: 4

Grazie!', NULL, 'sent', NULL, '2025-11-19 18:56:03.930135+00', '2025-11-19 18:56:03.930135+00', NULL),
	('c6e13563-fc4a-4aac-a24a-dba3e639f606', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 5

Grazie!', NULL, 'sent', NULL, '2025-11-19 19:02:34.778548+00', '2025-11-19 19:02:34.778548+00', NULL),
	('0729479b-f624-4979-99f0-959f522059e9', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Crema tartufo: 4

Grazie!', NULL, 'sent', NULL, '2025-11-19 19:02:36.973512+00', '2025-11-19 19:02:36.973512+00', NULL),
	('f8ea7362-4f2d-4299-b521-2554902ab1bb', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 3

Grazie!', NULL, 'sent', NULL, '2025-11-19 20:17:13.793861+00', '2025-11-19 20:17:13.793861+00', NULL),
	('01442300-79d7-4f51-9780-d5be011b2b3a', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', 'X SF:

• Asado: 3

Grazie!', NULL, 'sent', NULL, '2025-11-19 20:17:16.386792+00', '2025-11-19 20:17:16.386792+00', NULL),
	('f5ce4266-c78e-4a45-b3c2-cf05bce4cf89', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '

• Songino: 2
• Rucola: 2
• Cavolo Rosso: 2
• Manitoba: 25 kg

Grazie!', NULL, 'sent', NULL, '2025-11-19 21:41:01.022473+00', '2025-11-19 21:41:01.022473+00', NULL),
	('9c57249e-eecb-42af-9249-fee6051f37b3', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'df99037c-1085-4760-bbbf-cac576ba9e6f', 'Per Ruben SRL:

• Patate: 5 kg
• Lattuga: 5 piante

Grazie!', NULL, 'sent', NULL, '2025-11-19 21:41:19.90392+00', '2025-11-19 21:41:19.90392+00', NULL),
	('c4ee7b2c-47db-4dcb-b9df-3dc01e01370f', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', 'X SF:

• Bresaola: Serve
• Shawarma: 5 kg
• Roast-beef: Serve

Grazie!', NULL, 'sent', NULL, '2025-11-19 21:41:32.074647+00', '2025-11-19 21:41:32.074647+00', NULL),
	('be765c70-2b80-4431-82d2-e85155e4b5f1', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'X SF:

• Fuselli Panati: 10
• Shnitzel: 15
• Francesine: 3 kg
• Bocconcini di Pollo: 3
• Fettine Panate: 10
• Pulled beef: 5 kg

Grazie!', NULL, 'sent', NULL, '2025-11-19 21:41:39.170882+00', '2025-11-19 21:41:39.170882+00', NULL),
	('871cdc4c-663f-4d61-a2aa-02dc2ffe8f14', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1.5

Grazie!', NULL, 'sent', NULL, '2025-11-19 21:41:46.910164+00', '2025-11-19 21:41:46.910164+00', NULL),
	('4381e8c9-39a7-4381-b8bc-9e6eebd38c33', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', 'X SF:

• Bresaola: 5

Grazie!', NULL, 'sent', NULL, '2025-11-19 22:44:42.779237+00', '2025-11-19 22:44:42.779237+00', NULL),
	('8a19b6e5-e1ee-48a9-a543-7a6669d91ce9', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '

• Sale Bustine: 5

Grazie!', NULL, 'sent', NULL, '2025-11-19 23:30:45.104913+00', '2025-11-19 23:30:45.104913+00', NULL),
	('cc0502fe-ea1b-4c58-b712-4fb2369c54f6', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1

Grazie!', NULL, 'sent', NULL, '2025-11-20 01:13:43.220765+00', '2025-11-20 01:13:43.220765+00', NULL),
	('5b1cd51d-5748-4638-a7b0-e08579533e13', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1

Grazie!', NULL, 'sent', NULL, '2025-11-20 02:36:47.875923+00', '2025-11-20 02:36:47.875923+00', NULL),
	('66eff3b5-3aae-417a-b695-a686f5e0b311', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '

• Sale Bustine: 3

Grazie!', NULL, 'sent', NULL, '2025-11-20 18:35:37.709506+00', '2025-11-20 18:35:37.709506+00', NULL),
	('9ba7cad7-dce0-4dbb-bc7a-aae74f8dd588', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Bomba Piccante: 2

Grazie!', NULL, 'sent', NULL, '2025-11-20 18:35:40.523455+00', '2025-11-20 18:35:40.523455+00', NULL),
	('934a9280-5cbb-4465-802b-211b1016ac96', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'df99037c-1085-4760-bbbf-cac576ba9e6f', 'Per Ruben SRL:

• Cicoria: 2 casse

Grazie!', NULL, 'sent', NULL, '2025-11-20 21:07:38.649177+00', '2025-11-20 21:07:38.649177+00', NULL),
	('2895553f-ba12-4db6-bdb6-a5df757a9c31', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', 'X SF:

• Asado: 1

Grazie!', NULL, 'sent', NULL, '2025-11-20 21:07:48.403672+00', '2025-11-20 21:07:48.403672+00', NULL),
	('01a8fc77-30dd-4e32-ab6b-24aade59ad6f', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 2

Grazie!', NULL, 'sent', NULL, '2025-11-20 21:07:55.18129+00', '2025-11-20 21:07:55.18129+00', NULL),
	('33477fce-e43d-4c99-ad9c-592f28aa5ae7', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'X SF:

• Fuselli Panati: 5
• Shnitzel: 15
• Fettine Panate: 5
• Straccetti: 1 kg
• Pollo crispy: 0.5 kg

Grazie!', NULL, 'sent', NULL, '2025-11-20 21:08:01.584889+00', '2025-11-20 21:08:01.584889+00', NULL),
	('244f253a-8945-46be-9083-f5eab929363f', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Bomba Piccante: Serve

Grazie!', NULL, 'sent', NULL, '2025-11-20 21:08:08.658391+00', '2025-11-20 21:08:08.658391+00', NULL),
	('2af5626c-5407-443e-a20e-4978431a431e', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 2

Grazie!', NULL, 'sent', NULL, '2025-11-21 17:39:16.690676+00', '2025-11-21 17:39:16.690676+00', NULL),
	('a2f2bd46-0926-4027-95b1-a02bdfdbd1b2', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'X SF:

• Fettine Panate: 6

Grazie!', NULL, 'sent', NULL, '2025-11-21 17:39:28.485789+00', '2025-11-21 17:39:28.485789+00', NULL),
	('815629f1-f929-4327-b0b0-135b2bd221bd', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '

• Pepe Bustine: 2

Grazie!', NULL, 'sent', NULL, '2025-11-21 17:39:41.192934+00', '2025-11-21 17:39:41.192934+00', NULL),
	('c56dbb16-556d-4008-930d-b5683a1bfbc1', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Maionese BG: 3

Grazie!', NULL, 'sent', NULL, '2025-11-21 18:07:00.629586+00', '2025-11-21 18:07:00.629586+00', NULL),
	('b5bdaacc-3497-45a0-8df0-2fb9d8226b52', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', 'X SF:

• Bresaola: 7

Grazie!', NULL, 'sent', NULL, '2025-11-21 18:07:09.971707+00', '2025-11-21 18:07:09.971707+00', NULL),
	('48a3779f-6816-407c-ac0c-91ae543a7a86', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'df99037c-1085-4760-bbbf-cac576ba9e6f', 'Per Ruben SRL:

• Grappolo: 3

Grazie!', NULL, 'sent', NULL, '2025-11-21 19:11:43.042812+00', '2025-11-21 19:11:43.042812+00', NULL),
	('3b6937f1-7c29-4a56-afa4-c9fb984e6a7f', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', 'X SF:

• Carne secca: 2

Grazie!', NULL, 'sent', NULL, '2025-11-21 19:11:56.350076+00', '2025-11-21 19:11:56.350076+00', NULL),
	('df84d05b-8039-4aaf-9d86-480506652f5a', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Pita: 1
• Cheddar: 2

Grazie!', NULL, 'sent', NULL, '2025-11-23 23:16:49.815003+00', '2025-11-23 23:16:49.815003+00', NULL),
	('aefed5cf-532a-475a-af4d-4adfab27ce84', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'X SF:

• Fuselli Panati: 6
• Fettine Panate: 10
• Pollo crispy: 1 kg
• Pulled beef: 5kg
Salsiccia 6

Grazie!', 'Salsiccia 6', 'sent', NULL, '2025-11-23 23:16:58.003394+00', '2025-11-23 23:16:58.003394+00', NULL),
	('1fe4e682-5d4e-400f-8076-d7a2dba32447', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1.5

Grazie!', NULL, 'sent', NULL, '2025-11-23 23:17:09.846626+00', '2025-11-23 23:17:09.846626+00', NULL),
	('4726311a-f1f6-46d1-b7fb-7eeab77c3cf3', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '

• Manitoba: 25 kg

Grazie!', NULL, 'sent', NULL, '2025-11-23 23:17:19.494641+00', '2025-11-23 23:17:19.494641+00', NULL),
	('126fb7e0-5eae-4525-a19d-2dafa6ef1cab', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'df99037c-1085-4760-bbbf-cac576ba9e6f', 'Per Ruben SRL:

• Grappolo: 1 c
• Patate: 5 kg

Grazie!', NULL, 'sent', NULL, '2025-11-23 23:17:40.791093+00', '2025-11-23 23:17:40.791093+00', NULL),
	('2e5fcd8c-f38c-4393-bb84-eb53c9330657', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', 'X SF:

• Shawarma: 5 kg

Grazie!', NULL, 'sent', NULL, '2025-11-23 23:17:50.44304+00', '2025-11-23 23:17:50.44304+00', NULL),
	('fc763b09-49f1-419f-8d63-0bbaa910830f', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Porchetta: 2

Grazie!', NULL, 'sent', NULL, '2025-11-24 01:50:14.959703+00', '2025-11-24 01:50:14.959703+00', NULL),
	('e8a32a79-0bdd-4eac-aa4f-45cadf5b4114', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 3

Grazie!', NULL, 'sent', NULL, '2025-11-24 01:50:18.930277+00', '2025-11-24 01:50:18.930277+00', NULL),
	('2a25833a-32ef-46ea-83b5-f22df6667de0', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Porchetta: 2

Grazie!', NULL, 'sent', NULL, '2025-11-24 01:56:20.414242+00', '2025-11-24 01:56:20.414242+00', NULL),
	('7cc3213b-52e5-45b5-9c16-d9ca234678ea', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 3

Grazie!', NULL, 'sent', NULL, '2025-11-24 01:56:25.674466+00', '2025-11-24 01:56:25.674466+00', NULL),
	('9e745ca5-0fce-4a7d-902e-c490f4960d59', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Pulled Beef: 1

Grazie!', NULL, 'sent', NULL, '2025-11-24 11:05:48.137961+00', '2025-11-24 11:05:48.137961+00', NULL),
	('e83fc2fa-2bbc-40bf-98fa-68ed48cd56dd', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 2

Grazie!', NULL, 'sent', NULL, '2025-11-24 11:05:57.736724+00', '2025-11-24 11:05:57.736724+00', NULL),
	('bd9f6df9-db7a-4352-a954-984225560996', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 4

Grazie!', NULL, 'sent', NULL, '2025-11-24 15:59:59.731907+00', '2025-11-24 15:59:59.731907+00', NULL),
	('e7dc77cd-c926-46e6-a902-5037bf2bfe11', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'X SF:

• Shnitzel: 1
• Macinato: 2

Grazie!', NULL, 'sent', NULL, '2025-11-24 16:00:03.860263+00', '2025-11-24 16:00:03.860263+00', NULL),
	('baebb9e2-2a94-4bc0-9778-b5d0f2789826', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Peperoncino olio: 4

Grazie!', NULL, 'sent', NULL, '2025-11-24 16:00:06.276551+00', '2025-11-24 16:00:06.276551+00', NULL),
	('e0de79b9-3eff-45a4-8f09-b19a753d32f5', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1.5

Grazie!', NULL, 'sent', NULL, '2025-11-24 21:43:30.126918+00', '2025-11-24 21:43:30.126918+00', NULL),
	('f57921e5-067f-4866-ba5c-00e138177405', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Goldstar: Serve
• Scatola panino: Serve
• Busta SF: Serve
Spezie shawarma

Grazie!', 'Spezie shawarma', 'sent', NULL, '2025-11-24 21:43:37.699864+00', '2025-11-24 21:43:37.699864+00', NULL),
	('f7b4c110-c57f-4981-8331-bac302a19d38', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'X SF:

• Francesine: 3kg
• Straccetti: 1 kg

Grazie!', NULL, 'sent', NULL, '2025-11-24 21:43:46.404093+00', '2025-11-24 21:43:46.404093+00', NULL),
	('bc2cae0c-1770-4a74-8e58-c385266b6222', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '

• Rucola: 2

Grazie!', NULL, 'sent', NULL, '2025-11-24 21:43:59.629088+00', '2025-11-24 21:43:59.629088+00', NULL),
	('45b440f2-6491-4375-9c59-b86569ca815e', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', 'X SF:

• Sfoglia: 1 kg

Grazie!', NULL, 'sent', NULL, '2025-11-24 21:44:07.959519+00', '2025-11-24 21:44:07.959519+00', NULL),
	('b9dd5122-9a99-48c3-ab67-236ae564003b', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'df99037c-1085-4760-bbbf-cac576ba9e6f', 'Per Ruben SRL:

• Lattuga: 4 piante

Grazie!', NULL, 'sent', NULL, '2025-11-24 21:44:14.937014+00', '2025-11-24 21:44:14.937014+00', NULL),
	('b65f83a6-664a-4a14-8e63-adaf750d1aa9', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1.5

Grazie!', NULL, 'sent', NULL, '2025-11-25 12:30:31.056707+00', '2025-11-25 12:30:31.056707+00', NULL),
	('38ab057a-b313-404c-a00e-66617b3ee891', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Pastrami: Serve
• BBQ: Serve

Grazie!', NULL, 'sent', NULL, '2025-11-25 21:32:39.286977+00', '2025-11-25 21:32:39.286977+00', NULL),
	('7a5eff14-1487-44d1-9325-896e75032fbf', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'X SF:

• Shnitzel: 10
• Fuselli Panati: 6

Grazie!', NULL, 'sent', NULL, '2025-11-25 21:32:46.713794+00', '2025-11-25 21:32:46.713794+00', NULL),
	('4305b9eb-d7e3-4d86-a05c-7f3ce5ba3089', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '

• Rotoli carta: 2

Grazie!', NULL, 'sent', NULL, '2025-11-25 21:32:53.594534+00', '2025-11-25 21:32:53.594534+00', NULL),
	('d4fea80d-b356-4d07-86c3-a6aa76fd495f', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1.5

Grazie!', NULL, 'sent', NULL, '2025-11-25 21:33:12.307267+00', '2025-11-25 21:33:12.307267+00', NULL),
	('aecb728c-0747-4103-9f45-b0c4a9536bfc', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• BBQ: Serve
• Bomba Piccante: Serve

Grazie!', NULL, 'sent', NULL, '2025-11-26 22:04:38.731832+00', '2025-11-26 22:04:38.731832+00', NULL),
	('c1553b67-3290-4cff-b6f2-731f32325a8b', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', 'X SF:

• Carne secca: Serve

Grazie!', NULL, 'sent', NULL, '2025-11-26 22:04:48.043492+00', '2025-11-26 22:04:48.043492+00', NULL),
	('9189bc23-25e1-4f87-a60f-86f89b3cee7c', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'X SF:

• Straccetti: 1 kg
• Petti di Pollo: 1 kg
• Pollo crispy: 0,5kg
Salsiccia 6

Grazie!', 'Salsiccia 6', 'sent', NULL, '2025-11-26 22:05:00.041449+00', '2025-11-26 22:05:00.041449+00', NULL),
	('c0b7acbd-34bb-4416-b8da-5ff4da2187f0', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1,5

Grazie!', NULL, 'sent', NULL, '2025-11-26 22:05:10.940069+00', '2025-11-26 22:05:10.940069+00', NULL),
	('c3b6e25e-d210-4a73-afb0-0c2a43e0ad56', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'df99037c-1085-4760-bbbf-cac576ba9e6f', 'Per Ruben SRL:

• Cicoria: 2 casse 

Grazie!', NULL, 'sent', NULL, '2025-11-26 22:05:17.856924+00', '2025-11-26 22:05:17.856924+00', NULL),
	('b20523a0-8b3b-412c-8e07-8995b1deef82', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '

• Guanti L: 2
• Rucola: 2
• Rotoli carta: 2
• Cipolla Rossa: 2kg
• Lavapavimenti: 2
• Sapone Piatti: 2

Grazie!', NULL, 'sent', NULL, '2025-11-26 22:05:30.344908+00', '2025-11-26 22:05:30.344908+00', NULL),
	('39b3a363-af9b-4243-96b5-08b795726a4a', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Maionese BG: 55

Grazie!', NULL, 'sent', NULL, '2025-11-27 02:05:42.780917+00', '2025-11-27 02:05:42.780917+00', NULL),
	('bb318d9a-8d11-4a0b-a810-a98b62a73cd0', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'X SF:

• Macinato: F

Grazie!', NULL, 'sent', NULL, '2025-11-27 04:25:35.36836+00', '2025-11-27 04:25:35.36836+00', NULL),
	('e63c4d25-c2d4-4082-8fc2-b00f89264853', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 7

Grazie!', NULL, 'sent', NULL, '2025-11-27 04:53:07.104977+00', '2025-11-27 04:53:07.104977+00', NULL),
	('5bc6385a-08b5-4431-83f7-dd18763f5d6d', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: i

Grazie!', NULL, 'sent', NULL, '2025-11-27 05:36:09.364344+00', '2025-11-27 05:36:09.364344+00', NULL),
	('ac873ff7-a5d4-4840-afbc-a39998ab77fa', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'X SF:

• Shnitzel: 15
• Fuselli Panati: 10
• Fettine Panate: 10
• Pollo crispy: 1kg
• Pulled beef: 5kg
• Bocconcini di Pollo: 2kg

Grazie!', NULL, 'sent', NULL, '2025-11-27 22:10:27.131807+00', '2025-11-27 22:10:27.131807+00', NULL),
	('09fd7137-cf70-4c47-a13d-d64374c6d546', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 2

Grazie!', NULL, 'sent', NULL, '2025-11-27 22:10:35.575957+00', '2025-11-27 22:10:35.575957+00', NULL),
	('1b3b5153-f098-4cf8-8de6-b7d0450fb6f0', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'df99037c-1085-4760-bbbf-cac576ba9e6f', 'Per Ruben SRL:

• Patate: 5kg

Grazie!', NULL, 'sent', NULL, '2025-11-27 22:10:42.332056+00', '2025-11-27 22:10:42.332056+00', NULL),
	('15240c47-9775-411b-a897-c3af8040f6a4', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1,5

Grazie!', NULL, 'sent', NULL, '2025-11-29 22:17:08.478985+00', '2025-11-29 22:17:08.478985+00', NULL),
	('c70a596f-af04-4262-94bc-e6519485baaf', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '

• Rotoli carta: 2
• Tovaglioli neri 24x24: 1 cartone 
• Manitoba: 25kg
• Semola Rimacinata: 4
• Songino: 2
• Rucola: 2
Sacchi nero 1 cartone
Cetrioli 1 cassa
Grappolo 1 c
Lattuga 4 piante

Grazie!', 'Sacchi nero 1 cartone
Cetrioli 1 cassa
Grappolo 1 c
Lattuga 4 piante', 'sent', NULL, '2025-11-29 22:17:16.292872+00', '2025-11-29 22:17:16.292872+00', NULL),
	('fb93783c-d0b1-450c-9eab-3840a578d57a', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

Piazza:
• Francesine: 3kg
• Shnitzel: 10

Grazie!', 'Piazza:
• Francesine: 3kg
• Shnitzel: 10', 'sent', NULL, '2025-11-29 22:17:39.709754+00', '2025-11-29 22:17:39.709754+00', NULL),
	('e319f972-3a6d-4634-b06c-4ef97357b68a', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 1,5

Grazie!', NULL, 'sent', NULL, '2025-11-30 23:09:10.217206+00', '2025-11-30 23:09:10.217206+00', NULL),
	('5fd1c0c1-417c-49ff-8de1-b56dae92a593', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'X SF:

• Scatola panino: Serve
• Satola sfizi: Serve
• Ketchup: Serv
• Maionese BG: Serve
• Pomodoro barattolo: Serve
• Goldstar: Serve
• Cetriolini: Serve
Maionese e limone serve

Grazie!', 'Maionese e limone serve', 'sent', NULL, '2025-11-30 23:09:18.295989+00', '2025-11-30 23:09:18.295989+00', NULL),
	('65b73ca8-677a-4ab8-bee3-09d9f8bc7d8a', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'X SF:

• Petti di Pollo: 1kg
• Fuselli Panati: 4
• Fettine Panate: 6

Grazie!', NULL, 'sent', NULL, '2025-11-30 23:09:26.838203+00', '2025-11-30 23:09:26.838203+00', NULL),
	('72b3275a-dbd3-4cd3-a175-1ae96944cd37', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '

• Guanti L: 2
• Cavolo Rosso: 2
Bicchiere grande 4

Grazie!', 'Bicchiere grande 4', 'sent', NULL, '2025-11-30 23:09:35.452464+00', '2025-11-30 23:09:35.452464+00', NULL),
	('ec195217-582a-4843-b7ad-b73443bf614b', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'df99037c-1085-4760-bbbf-cac576ba9e6f', 'Per Ruben SRL:

• Patate: 5kg

Grazie!', NULL, 'sent', NULL, '2025-11-30 23:10:00.847668+00', '2025-11-30 23:10:00.847668+00', NULL),
	('30011c3d-3d5e-45df-a55d-324b8a531b7a', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 5

Grazie!', NULL, 'sent', NULL, '2025-12-01 14:06:31.748216+00', '2025-12-01 14:06:31.748216+00', NULL),
	('5eecdd77-b692-4d20-a28d-dfed53f240ef', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'X SF:

• Shnitzel: 6

Grazie!', NULL, 'sent', NULL, '2025-12-01 14:06:54.458752+00', '2025-12-01 14:06:54.458752+00', NULL),
	('f9388d90-163e-4b7a-a650-8372cd14e73c', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 7

Grazie!', NULL, 'sent', NULL, '2025-12-01 14:08:08.329642+00', '2025-12-01 14:08:08.329642+00', NULL),
	('25976a97-4c4c-45d7-b521-839e8792d55a', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 8

Grazie!', NULL, 'sent', NULL, '2025-12-01 14:09:00.565144+00', '2025-12-01 14:09:00.565144+00', NULL),
	('77a1f859-1983-4ec6-8916-3ae1c7b34069', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 3

Grazie!', NULL, 'sent', NULL, '2025-12-01 14:12:09.229597+00', '2025-12-01 14:12:09.229597+00', NULL),
	('250eece7-078b-42f5-ab45-f201f447d72b', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 6

Grazie!', NULL, 'sent', NULL, '2025-12-01 14:14:21.429863+00', '2025-12-01 14:14:21.429863+00', NULL),
	('0296cba1-e0f7-4e38-bece-e64bbe356ca6', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Ciao Marco per domani 

• Pizza bianca: 8

Grazie!', NULL, 'sent', NULL, '2025-12-02 00:11:48.995083+00', '2025-12-02 00:11:48.995083+00', NULL),
	('0963d40c-53d9-47fe-96f8-1483b69b40a8', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', 'X SF:

• Sfoglia: 6

Grazie!', NULL, 'sent', NULL, '2025-12-02 00:11:52.115555+00', '2025-12-02 00:11:52.115555+00', NULL);


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."products" ("id", "supplier_id", "name", "unit", "created_at") VALUES
	('12590949-ec4c-4bce-b3cc-e2221437cf76', '9567d72a-7060-4a1d-b913-7d342aa2b352', 'glock', 'pz', '2025-09-25 14:59:18.330852+00'),
	('85f07869-bc84-4c95-8ef5-e97e9fe34450', '9567d72a-7060-4a1d-b913-7d342aa2b352', 'colpi', 'pz', '2025-09-25 14:59:18.330852+00'),
	('dff16d7b-c3e4-4137-895e-ee45ec95dcce', '9567d72a-7060-4a1d-b913-7d342aa2b352', 'lancia granate', 'pz', '2025-09-25 14:59:18.330852+00'),
	('ff6ccc68-6059-4bff-9fbf-fa267896795c', '9567d72a-7060-4a1d-b913-7d342aa2b352', 'carri armate', 'pz', '2025-09-25 14:59:18.330852+00'),
	('d23101ac-0b98-495b-b8c9-e85c9c8eb32f', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', 'Pizza bianca', 'pz', '2025-09-25 21:43:15.522628+00'),
	('a473b268-3220-4f4c-96bd-1e8a1a842bed', '1f5a15dc-43a6-4985-a9b4-8f73997d4443', 'bistecche', 'pz', '2025-09-29 14:47:10.593461+00'),
	('85218b64-69e1-4a24-a905-eabf12306e8d', '1f5a15dc-43a6-4985-a9b4-8f73997d4443', 'pollo', 'pz', '2025-09-29 14:47:10.593461+00'),
	('7486274c-ae3e-4d2b-b019-ccdeceb04669', '1f5a15dc-43a6-4985-a9b4-8f73997d4443', 'nuggets', 'pz', '2025-09-29 14:47:10.593461+00'),
	('e3473a39-97c4-43d7-a338-311d4bcfa390', '1f5a15dc-43a6-4985-a9b4-8f73997d4443', 'sefarimmi', 'pz', '2025-09-29 14:47:10.593461+00'),
	('98aaaa6b-e307-4f6f-91a0-2fd7dc9cef44', 'a0fd8b52-6014-4920-9409-2abb93ca0f3a', 'po', 'pz', '2025-10-20 15:35:19.272284+00'),
	('60c842a1-fc2e-42c4-b0b1-33cf1e9ea434', 'a0fd8b52-6014-4920-9409-2abb93ca0f3a', 'o', 'pz', '2025-10-20 15:35:19.272284+00'),
	('bada2f88-c8fe-4c9b-bc85-ab2680b4b11f', 'a0fd8b52-6014-4920-9409-2abb93ca0f3a', 'o', 'pz', '2025-10-20 15:35:19.272284+00'),
	('9a284632-f482-4055-9c54-3c073b4993ab', 'a0fd8b52-6014-4920-9409-2abb93ca0f3a', 'o', 'pz', '2025-10-20 15:35:19.272284+00'),
	('6de3649f-ea28-49bd-9ec1-bff638808548', 'a0fd8b52-6014-4920-9409-2abb93ca0f3a', 'o', 'pz', '2025-10-20 15:35:19.272284+00'),
	('9234b43a-28db-44b3-9e80-ee4c51f5878f', 'a0fd8b52-6014-4920-9409-2abb93ca0f3a', 'o', 'pz', '2025-10-20 15:35:19.272284+00'),
	('e354749e-e5dc-4cbc-8817-d1d8432baad8', 'cd0d2dd8-82b6-48f4-9620-fb4129d3bf40', 'l', 'pz', '2025-10-20 15:35:36.738459+00'),
	('09924250-63dc-461a-9f51-f3fb9f631656', 'cd0d2dd8-82b6-48f4-9620-fb4129d3bf40', 'l', 'pz', '2025-10-20 15:35:36.738459+00'),
	('244f5ead-0a49-4f36-a17a-abcc9588af19', 'cd0d2dd8-82b6-48f4-9620-fb4129d3bf40', 'l', 'pz', '2025-10-20 15:35:36.738459+00'),
	('7bc5c9e8-f206-473d-9961-2f72be4ee3bf', 'cd0d2dd8-82b6-48f4-9620-fb4129d3bf40', 'l', 'pz', '2025-10-20 15:35:36.738459+00'),
	('6ba1e0a2-aeb6-4f4a-a941-a76d0b0e4bcd', 'cd0d2dd8-82b6-48f4-9620-fb4129d3bf40', 'l', 'pz', '2025-10-20 15:35:36.738459+00'),
	('93073c45-5bf9-4142-bf59-c600b47da0a5', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'Fuselli Panati', 'pz', '2025-11-13 10:32:49.158253+00'),
	('981eaf22-9212-4904-8297-c801ecb01f4e', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'Shnitzel', 'pz', '2025-11-13 10:32:49.158253+00'),
	('70bdd82c-b693-4696-8e57-2bccf679e4b0', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'Francesine', 'pz', '2025-11-13 10:32:49.158253+00'),
	('a3fe7a82-9975-47e1-aaaa-1bd91c4a82e1', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'Macinato', 'pz', '2025-11-13 10:32:49.158253+00'),
	('35676d40-54a3-4006-ad1f-d5980c16c556', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'Bocconcini di Pollo', 'pz', '2025-11-13 10:32:49.158253+00'),
	('d923e4d7-d4fd-4ae9-8d24-8ec11f539b9f', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'Fettine Panate', 'pz', '2025-11-13 10:32:49.158253+00'),
	('75a8f46c-d626-4fcc-95c4-f8fce1e3703a', 'df99037c-1085-4760-bbbf-cac576ba9e6f', 'Cetrioli', 'pz', '2025-11-23 23:33:50.557797+00'),
	('3695cb69-e351-41bc-b946-99d0323db010', 'df99037c-1085-4760-bbbf-cac576ba9e6f', 'Grappolo', 'pz', '2025-11-23 23:33:50.557797+00'),
	('1987df54-1667-4d80-a8df-89a15f4f37e5', 'df99037c-1085-4760-bbbf-cac576ba9e6f', 'Prezzemolo', 'pz', '2025-11-23 23:33:50.557797+00'),
	('e7de988c-db24-4641-99e5-06f6226756db', 'df99037c-1085-4760-bbbf-cac576ba9e6f', 'Rosmarino', 'pz', '2025-11-23 23:33:50.557797+00'),
	('13e1cd75-eac1-454c-8cd1-bc6ce59471ae', 'df99037c-1085-4760-bbbf-cac576ba9e6f', 'Carote', 'pz', '2025-11-23 23:33:50.557797+00'),
	('564857d3-e1a0-4063-a917-237a34672801', 'df99037c-1085-4760-bbbf-cac576ba9e6f', 'Cipolla Bianca', 'pz', '2025-11-23 23:33:50.557797+00'),
	('005bb132-f793-4e5c-aee2-b31550c719f4', 'df99037c-1085-4760-bbbf-cac576ba9e6f', 'Patate', 'pz', '2025-11-23 23:33:50.557797+00'),
	('f541372d-f6e5-4e8b-bfdd-81cc4dbf7edb', 'df99037c-1085-4760-bbbf-cac576ba9e6f', 'Lattuga', 'pz', '2025-11-23 23:33:50.557797+00'),
	('db70a0d6-b508-45af-85f0-92a38b43213a', 'df99037c-1085-4760-bbbf-cac576ba9e6f', 'Cicoria', 'pz', '2025-11-23 23:33:50.557797+00'),
	('2b121afc-1ba1-4208-8a88-40e5905f6eb5', 'df99037c-1085-4760-bbbf-cac576ba9e6f', 'Zucchine', 'pz', '2025-11-23 23:33:50.557797+00'),
	('49a4b560-a9b3-48f4-9a51-ffdbfa441732', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Sale Bustine', 'pz', '2025-11-30 21:10:17.964856+00'),
	('f40c220d-f833-4825-b658-5a96657b421e', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Pepe Bustine', 'pz', '2025-11-30 21:10:17.964856+00'),
	('f354e6a9-0e83-4c7f-9abd-0f2e15e709cf', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'Straccetti', 'pz', '2025-11-13 10:32:49.158253+00'),
	('0e25750d-094a-43df-b876-a141a1f54327', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'Petti di Pollo', 'pz', '2025-11-13 10:32:49.158253+00'),
	('3763a0ec-37e2-4e19-8173-a4a7e969c324', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'Pollo crispy', 'pz', '2025-11-13 10:32:49.158253+00'),
	('cd4bdcdb-b55c-4bf4-aa0b-b8a84f59bde6', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', 'Pulled beef', 'pz', '2025-11-13 10:32:49.158253+00'),
	('dd64ae64-97f6-439d-83b3-575b097066a7', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Olio Bustine', 'pz', '2025-11-30 21:10:17.964856+00'),
	('0d30bbe1-86d0-41cc-bf3c-e8a0a47ebf81', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Songino', 'pz', '2025-11-30 21:10:17.964856+00'),
	('62934a78-998f-4a70-8534-d924c89c8d67', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Rucola', 'pz', '2025-11-30 21:10:17.964856+00'),
	('910f0430-a4df-4bd8-bbd9-daf48f077537', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Cavolo Rosso', 'pz', '2025-11-30 21:10:17.964856+00'),
	('8896502e-f852-4626-8de5-dab2748d0ff3', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Cipolla Rossa', 'pz', '2025-11-30 21:10:17.964856+00'),
	('eccf9e00-d0e8-4f27-a511-bcf8c488766e', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', 'Carne secca', 'pz', '2025-11-13 10:34:31.360696+00'),
	('a4367bb0-5611-4388-ad5f-b15672ca06be', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', 'Bresaola', 'pz', '2025-11-13 10:34:31.360696+00'),
	('1def6787-ed42-4488-ad04-934131eeeba3', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', 'Sfoglia', 'pz', '2025-11-13 10:34:31.360696+00'),
	('e1e22b9d-5a57-47a7-aa38-752d706e7470', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', 'Asado', 'pz', '2025-11-13 10:34:31.360696+00'),
	('d1924a8e-35f2-4b66-9270-49c8a432e46e', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', 'Shawarma', 'pz', '2025-11-13 10:34:31.360696+00'),
	('7409d80c-23ab-43f2-b7f2-83f5d8441aca', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', 'Roast-beef', 'pz', '2025-11-13 10:34:31.360696+00'),
	('c5eb4863-9d50-424e-95cf-e1e7b99dfa1a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Quasar Vetri', 'pz', '2025-11-30 21:10:17.964856+00'),
	('0217038f-7f70-4700-93b4-6587d5f46e08', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Sgrassatore Chanteclair', 'pz', '2025-11-30 21:10:17.964856+00'),
	('999c884e-53db-4141-a23b-c6b15df6cc7d', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Sapone Piatti', 'pz', '2025-11-30 21:10:17.964856+00'),
	('ef099f72-7d02-4a7e-b8c1-88770e9a1dae', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Lavapavimenti', 'pz', '2025-11-30 21:10:17.964856+00'),
	('b6156579-c876-472b-bc9d-4c580fea9667', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Tris Posate Monouso', 'pz', '2025-11-30 21:10:17.964856+00'),
	('74fc0350-d415-462e-afc0-78e8f2e52aa3', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Semola Rimacinata', 'pz', '2025-11-30 21:10:17.964856+00'),
	('a3513f2f-a113-4497-a455-c7eac4b69151', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Tovaglioli neri 24x24', 'pz', '2025-11-30 21:10:17.964856+00'),
	('1708bacf-ca0c-4f0a-b241-b76923744e5b', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Rotoli carta', 'pz', '2025-11-30 21:10:17.964856+00'),
	('27359d73-09ed-4c63-8c1f-64b81f0497ef', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Guanti L', 'pz', '2025-11-30 21:10:17.964856+00'),
	('0bfe1e2c-ef4a-4c3b-b5f2-8896ebecc875', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Manitoba', 'pz', '2025-11-30 21:10:17.964856+00'),
	('57a8f3a3-250c-4c6d-b2e5-f4c17cd2ac4c', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Paprika Dolce', 'pz', '2025-11-30 21:10:17.964856+00'),
	('ad60317b-4f49-4ca5-bb0d-2a6d0c2f2737', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Paprika Affumicata', 'pz', '2025-11-30 21:10:17.964856+00'),
	('158ce629-4346-4756-84c5-9ee1e80bd6e2', 'f5304bc9-32bf-486e-8d34-d719028d51f4', 'Bicchiere Crystal 250 ml', 'pz', '2025-11-30 21:10:17.964856+00'),
	('f8ce7715-0a90-4c43-83bc-4918817c4881', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'Bomba Piccante', 'pz', '2025-11-30 21:10:40.251031+00'),
	('2713e553-a7c7-4282-afcf-66375e13ac0a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'Peperoncino olio', 'pz', '2025-11-30 21:10:40.251031+00'),
	('bbf2f6d9-3c7c-4b50-b4a8-d27ef2dc0ba5', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'Olio oliva', 'pz', '2025-11-30 21:10:40.251031+00'),
	('6f8bf4a2-d094-47bb-a159-7feedbf67083', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'Maionese BG', 'pz', '2025-11-30 21:10:40.251031+00'),
	('a1e5996f-265c-424b-8545-36f367f7a774', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'Cetriolini', 'pz', '2025-11-30 21:10:40.251031+00'),
	('894eeaea-007a-469a-88a5-ba173a789880', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'Lavamani', 'pz', '2025-11-30 21:10:40.251031+00'),
	('1b8c3853-0ac4-4dd6-814c-f6f3bd5a17f7', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'Carta forno', 'pz', '2025-11-30 21:10:40.251031+00'),
	('fb7da9c7-8ddb-4628-8cb7-4aecf6ecb8a5', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'Crema tartufo', 'pz', '2025-11-30 21:10:40.251031+00'),
	('0bb13ea8-e063-4f47-9a18-a925a2f1d866', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'Senape', 'pz', '2025-11-30 21:10:40.251031+00'),
	('3ea16dbf-4ee5-4a31-8e7e-a1e8262e37d3', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'BBQ', 'pz', '2025-11-30 21:10:40.251031+00'),
	('6e241cec-92cb-4da7-9e89-de79d5853cf3', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'Maccabi', 'pz', '2025-11-30 21:10:40.251031+00'),
	('578fc05d-a6f3-4e74-824c-23b0bea89d94', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'Porchetta', 'pz', '2025-11-30 21:10:40.251031+00'),
	('303054e5-63c6-4985-812f-95a68d471a3a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'Chocolla', 'pz', '2025-11-30 21:10:40.251031+00'),
	('7e0a426d-3460-411e-be8b-ea102bbb2980', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'Pastrami', 'pz', '2025-11-30 21:10:40.251031+00'),
	('ca8d4b19-9901-4255-aeab-85a120963c00', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'Goldstar', 'pz', '2025-11-30 21:10:40.251031+00'),
	('5341db09-2bf0-4a99-9416-8fe6bbc60d5d', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'Rotoli Carta', 'pz', '2025-11-30 21:10:40.251031+00'),
	('cde5f199-9edc-4dfe-abb7-9b7e7b803310', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'Sgrassatore', 'pz', '2025-11-30 21:10:40.251031+00'),
	('75a9b681-64da-436f-97a6-f70225665725', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'Pita', 'pz', '2025-11-30 21:10:40.251031+00'),
	('27b311b4-4b0f-47b7-922c-aa567dfd0d7f', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'Satola sfizi', 'pz', '2025-11-30 21:10:40.251031+00'),
	('2e428f63-1088-4db0-8dc1-2d862184ebb8', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'Scatola panino', 'pz', '2025-11-30 21:10:40.251031+00'),
	('29dfb81f-7f94-4f82-97a2-b74da6a387dc', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'Carta antigrasso', 'pz', '2025-11-30 21:10:40.251031+00'),
	('2805e62e-172b-497e-a01b-c13d20483efb', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'Carta Antigrasso piccola', 'pz', '2025-11-30 21:10:40.251031+00'),
	('671be1b4-7536-4c42-aaca-bfe48a0ac659', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'Poké e coperchio', 'pz', '2025-11-30 21:10:40.251031+00'),
	('872a11a6-85f5-4d5d-b58c-16c78a809b8a', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'Busta SF', 'pz', '2025-11-30 21:10:40.251031+00'),
	('92b85c98-d765-490b-9d54-c7b8f849d8c5', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'Crystal dolci', 'pz', '2025-11-30 21:10:40.251031+00'),
	('6d10f0ef-6bfa-4455-8ab8-8d261b8d3a77', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'Cheddar', 'pz', '2025-11-30 21:10:40.251031+00'),
	('42b33b4f-1b4e-48fa-b550-c4d0931f2a0b', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'Formaggio', 'pz', '2025-11-30 21:10:40.251031+00'),
	('f7d57a28-0688-47c1-ac55-fcb2ae4d68fb', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'Thina', 'pz', '2025-11-30 21:10:40.251031+00'),
	('da669d15-8666-4792-813f-7560f9e88ecc', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'Quasar', 'pz', '2025-11-30 21:10:40.251031+00'),
	('c9caddfe-c554-456a-b5e7-96f5709b3430', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'Miele', 'pz', '2025-11-30 21:10:40.251031+00'),
	('9b1a6fe0-8456-4baf-8ee4-c3ad4fd866dd', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'Salsa Chilly', 'pz', '2025-11-30 21:10:40.251031+00'),
	('82232205-0184-4f46-bcd3-06548b8419eb', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'Ketchup', 'pz', '2025-11-30 21:10:40.251031+00'),
	('583c9f0f-e6c6-467c-91a4-f65d5bf412c5', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'Pulled Beef', 'pz', '2025-11-30 21:10:40.251031+00'),
	('642bd20b-3c3e-4859-ad4c-82a799c41e86', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'Pomodoro barattolo', 'pz', '2025-11-30 21:10:40.251031+00'),
	('5866c0bd-d5b4-4c30-98f0-7f0c73264ace', '377eb876-bdd8-417e-b7c4-c473371e9edf', 'Maionese Limone e pepe', 'pz', '2025-11-30 21:10:40.251031+00');


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."order_items" ("id", "order_id", "product_id", "product_name", "quantity", "created_at") VALUES
	('aff8b2e9-ed14-4ff6-ac63-c73ad0b47f25', '67036b64-132c-44bf-bad0-fca26c1c2699', NULL, 'Sale Bustine', '3', '2025-09-24 13:20:06.214652+00'),
	('6a8f8337-bf3e-4f7c-a611-fde9e196c040', '67036b64-132c-44bf-bad0-fca26c1c2699', NULL, 'Songino', '6', '2025-09-24 13:20:06.214652+00'),
	('95c0d471-122e-49aa-8a4d-ee6b30fb3cf0', '860d8c10-6948-4cd8-903d-0fedbdacef4e', NULL, 'Cetrioli', '8', '2025-09-24 16:01:01.552944+00'),
	('eecddd80-4c1c-47cc-ba3b-f07462b579a9', '0c7ec916-534c-4319-86a9-3c3ae2451cc2', NULL, 'Grappolo', '0', '2025-09-24 16:29:18.616544+00'),
	('157b0fac-1ff6-442b-868e-45c566323a18', '0c7ec916-534c-4319-86a9-3c3ae2451cc2', NULL, 'Cetrioli', '6', '2025-09-24 16:29:18.616544+00'),
	('60c475f6-3e99-410a-9149-f9840e975d28', '4db4fa5c-6478-41f8-9f19-81a058f8cc1c', NULL, 'glock', '10', '2025-09-25 15:01:55.685276+00'),
	('4e84a03f-3005-4648-9960-e015996c13e7', '4db4fa5c-6478-41f8-9f19-81a058f8cc1c', NULL, 'colpi', '10', '2025-09-25 15:01:55.685276+00'),
	('760e0f7e-24e3-473e-958f-a2ca306a8199', '4db4fa5c-6478-41f8-9f19-81a058f8cc1c', NULL, 'lancia granate', '3', '2025-09-25 15:01:55.685276+00'),
	('07688ee3-e104-4abe-97cc-71c57f39ddb6', '4db4fa5c-6478-41f8-9f19-81a058f8cc1c', NULL, 'carri armate', '4', '2025-09-25 15:01:55.685276+00'),
	('488d8d7b-a991-40b1-8539-89abd7003341', '21036cbc-039d-4cb1-9e61-9f3a8e026980', NULL, 'Rucola', '2', '2025-09-25 21:35:38.178037+00'),
	('a02b93fb-9a4b-4eb4-9e68-336943ebf196', '21036cbc-039d-4cb1-9e61-9f3a8e026980', NULL, 'Quasar Vetri', '1', '2025-09-25 21:35:38.178037+00'),
	('946d3098-ce69-4aaa-a2c8-ff31c7b227b6', '21036cbc-039d-4cb1-9e61-9f3a8e026980', NULL, 'Semola Rimacinata', '2', '2025-09-25 21:35:38.178037+00'),
	('fff87ecb-269a-4435-b6d5-5f4c06aafaec', '21036cbc-039d-4cb1-9e61-9f3a8e026980', NULL, 'Rotoli carta', '2', '2025-09-25 21:35:38.178037+00'),
	('8617bd0b-a7d9-4dc6-93bd-72ae221b5b15', '9a08fded-ee34-4aa4-bd4d-998eea493797', NULL, 'Asado', '1', '2025-09-25 21:38:18.645413+00'),
	('b029507d-7e42-4645-812b-d4f744744145', 'f3eeb6f9-bc34-4a3f-a74f-8427935297f8', NULL, 'glock', '2', '2025-09-25 21:41:55.437707+00'),
	('4d4d01f7-5147-4e43-8ba6-f4ea430af62e', 'f3eeb6f9-bc34-4a3f-a74f-8427935297f8', NULL, 'colpi', '3', '2025-09-25 21:41:55.437707+00'),
	('87dceae5-ffe5-4904-a931-cc45257047ff', 'bb7488b2-6fb9-424a-8684-f215fd7894ac', NULL, 'glock', '1', '2025-09-25 21:42:18.867152+00'),
	('a53b9eea-2e34-4e70-ae76-374063c1ff07', 'bb7488b2-6fb9-424a-8684-f215fd7894ac', NULL, 'colpi', '2', '2025-09-25 21:42:18.867152+00'),
	('2d4b0c18-43ec-46b3-a338-1fdf28f69f89', 'e6b4ca5f-4614-4bcf-b06c-2034a260eabc', NULL, 'Pizza bianca', '1', '2025-09-25 21:43:26.227088+00'),
	('d5bec242-7eca-43b9-b4a2-a84fda5158d5', '706cef70-cf36-4dce-a3e4-34749742c111', NULL, 'Pizza bianca', '1', '2025-09-26 10:24:34.637998+00'),
	('a8b686b2-f7c2-4932-82bb-4a1fec695ee3', 'f0635167-20ce-4c59-8ed2-63ee79116621', NULL, 'Pizza bianca', '1', '2025-09-26 10:25:09.359937+00'),
	('19515d48-69d0-42d5-b29f-747e2416bfe3', '1cdd11d5-29b5-4750-af16-1cc967537edb', NULL, 'Pizza bianca', '1', '2025-09-26 10:26:04.783482+00'),
	('bb01f73d-e1c1-423a-8f83-f7cede135c73', '387e5523-7e6a-4db1-ad3d-339652e1abde', NULL, 'Carne secca', '1', '2025-09-26 10:26:35.41036+00'),
	('c0e8b424-fc86-4ab3-83ed-c7f6f917431d', '9c275e83-5588-4d51-80aa-4efe65f2d93f', NULL, 'glock', '1', '2025-09-29 14:47:41.053036+00'),
	('1cb63965-5ec7-4bc2-89f3-91dceb6bbba8', '9c275e83-5588-4d51-80aa-4efe65f2d93f', NULL, 'colpi', '1', '2025-09-29 14:47:41.053036+00'),
	('461e0056-97ab-44aa-a82a-d72f3233c103', '9c275e83-5588-4d51-80aa-4efe65f2d93f', NULL, 'lancia granate', '1', '2025-09-29 14:47:41.053036+00'),
	('c19543df-3972-466a-84d0-2992c4f3c694', '9c275e83-5588-4d51-80aa-4efe65f2d93f', NULL, 'carri armate', '0', '2025-09-29 14:47:41.053036+00'),
	('3e7d7b78-f327-4488-a1e3-4a1a6325c000', '9c275e83-5588-4d51-80aa-4efe65f2d93f', NULL, 'bistecche', '2', '2025-09-29 14:47:41.053036+00'),
	('ebb5b424-f873-415b-8833-65d07900dc00', '9c275e83-5588-4d51-80aa-4efe65f2d93f', NULL, 'pollo', '3', '2025-09-29 14:47:41.053036+00'),
	('d81aa000-dbd9-43ae-9b77-acea3d782649', '9c275e83-5588-4d51-80aa-4efe65f2d93f', NULL, 'nuggets', '2', '2025-09-29 14:47:41.053036+00'),
	('b8e07e8a-4532-47fc-a1f0-8da24139ca86', '9c275e83-5588-4d51-80aa-4efe65f2d93f', NULL, 'sefarimmi', '2', '2025-09-29 14:47:41.053036+00'),
	('099d3e8a-54e2-4eb5-8dad-048377827c53', '637d521c-79a8-4101-8451-a7332e95153c', NULL, 'glock', '0', '2025-09-29 14:48:00.581254+00'),
	('f131a5ea-cbfb-4c8b-aa1c-19e565583812', '83f2d9ce-60ae-405b-bb7f-7e3af3aea2b6', NULL, 'bistecche', '0', '2025-09-29 14:48:24.969277+00'),
	('613caa57-009e-4ce4-bd70-55bc64e0bd56', '83f2d9ce-60ae-405b-bb7f-7e3af3aea2b6', NULL, 'glock', '0', '2025-09-29 14:48:24.969277+00'),
	('e6b37ce9-fef0-4661-99cf-66d9ef627252', '230971fd-1ed3-43ed-8aa5-44494c4dddf6', NULL, 'glock', '1', '2025-09-29 14:49:06.91045+00'),
	('e2ff5a6a-9474-4a5d-bc2d-64fedfd3752b', '230971fd-1ed3-43ed-8aa5-44494c4dddf6', NULL, 'bistecche', '1', '2025-09-29 14:49:06.91045+00'),
	('5399e6a9-641a-40e7-81e0-0f4c5f441e4e', '6e5563f3-c3a1-4a85-99c8-4838f2ea224e', NULL, 'glock', '1', '2025-09-30 09:12:22.697429+00'),
	('a48c70c8-15b9-494a-bfb3-25bff27ebbcf', 'fea917df-c79c-468a-86da-cc7be576c734', NULL, 'glock', '10', '2025-10-10 10:04:12.38587+00'),
	('0f96d159-9bee-409d-a218-e2200a0f3ebe', '3ac5918a-8fd6-41dc-8e8d-89a8cba2e09d', NULL, 'glock', '10', '2025-10-10 10:04:26.905403+00'),
	('f1ef77e6-2950-4ba1-b68c-8bee6d3601f4', 'd6dba468-cdb7-45c4-a23a-223fdff757a6', NULL, 'glock', '10', '2025-10-10 10:04:48.291452+00'),
	('4c615d08-441f-4136-8d6e-9bcea4959450', '80314d52-7449-4bde-a16f-8c2e43f89398', NULL, 'glock', '4', '2025-10-10 10:05:31.168054+00'),
	('f371b6da-3da3-4500-8054-75ba14ef5fca', '7de230b4-fc01-4c34-be60-e51bb09cccdf', NULL, 'Pizza bianca', '4', '2025-10-10 10:05:33.042594+00'),
	('863a8ff3-d785-4e59-a06c-dc2f9949218c', 'caaec1bf-17f2-48c7-9906-b2faf56d437c', NULL, 'Bomba Piccante', '1', '2025-10-10 10:05:53.97659+00'),
	('4f9a31e3-9a2f-47de-9934-64e535826c4d', 'fa7c5dc2-5669-464c-b8da-636471168d59', NULL, 'Sale Bustine', '1', '2025-10-10 10:06:33.358996+00'),
	('57c18303-f2b0-44dc-aec6-2fe5088185cb', '916335ae-e32b-44f9-b6ae-b20e79e1692c', NULL, 'glock', '2', '2025-10-10 10:06:35.036979+00'),
	('72ef277a-2242-4f88-b987-018a2bc6453d', 'b9f13435-0326-4283-ac21-2e8ef41ee692', NULL, 'glock', '2', '2025-10-10 10:07:05.214889+00'),
	('be4a3841-aa65-4dc9-9c2a-e26e99d3f2ff', 'daff61f5-4fc9-4b17-ba0e-3bad1e6431bf', NULL, 'glock', '2', '2025-10-10 10:08:12.01918+00'),
	('9d56d5cc-d4bd-4ae4-b64c-751872cd5981', '590ce01e-779c-4f0e-bbbf-d9d41570fb8c', NULL, 'glock', '10', '2025-10-10 10:47:03.314499+00'),
	('eafb9552-3272-4eb9-8dae-3db30787278f', '659cc5fe-03c4-4b2e-b03b-53d6c12bb17e', NULL, 'Carne secca', '10', '2025-10-10 10:48:33.044251+00'),
	('5996f30f-8010-4905-8769-78c18d5850bc', '369dad56-8f47-42ac-b9ac-6d53d4024e4c', NULL, 'Crema tartufo', '1', '2025-10-10 17:18:57.13567+00'),
	('a3ce3143-230b-49ce-b90e-6358762e600d', '1add250d-de7b-4590-9c82-6b2a7ca8319b', NULL, 'Pizza bianca', '1', '2025-10-10 18:41:30.425429+00'),
	('83c74ed0-a4b3-4248-9683-e1f554acfea9', 'df38ca3b-665c-43ff-9e9f-fa098bae37b7', NULL, 'Sale Bustine', '2', '2025-10-10 18:42:00.472629+00'),
	('3f17297b-8855-4f41-b929-8d7c2a3e6cfd', '5544bba0-7eb5-467f-94be-9a23ce5beced', NULL, 'Pizza bianca', '1', '2025-10-10 18:42:30.195354+00'),
	('0ef1acf7-f0cd-400a-8c20-676d93d07470', 'fb76bf28-4807-4000-aa71-d2c45ddb7bec', NULL, 'Pizza bianca', '1', '2025-10-10 18:43:19.687382+00'),
	('7540472e-5a09-40bb-a6cd-f74e57b1e63a', 'da685386-bcb1-46bf-ad50-50f4d5056fcd', NULL, 'Sale Bustine', '1', '2025-10-10 18:45:32.112065+00'),
	('cf021416-8a7e-4be5-a23d-31b4aaa49dfa', 'dd1e5c39-5cb3-4760-86fc-0849dc46fbaf', NULL, 'Pizza bianca', '3', '2025-10-10 18:49:31.881449+00'),
	('3e5177fa-13ce-4379-9d37-c1cd75d961b3', '4c354869-2ee7-4890-a3e8-6f9f311a9eb6', NULL, 'Fuselli Panati', '5', '2025-10-12 18:19:48.092419+00'),
	('1efd7914-a623-4b64-87c9-99750598e7e4', '4c354869-2ee7-4890-a3e8-6f9f311a9eb6', NULL, 'Shnitzel', '9', '2025-10-12 18:19:48.092419+00'),
	('ea96949e-edbd-4218-bf45-764fb553bcd0', 'fe1f665a-2172-484a-bc2c-255ded4e1d85', NULL, 'Pepe Bustine', '3', '2025-10-12 18:49:48.646341+00'),
	('0134a0ca-f466-44ca-970e-593f3b61ba36', '459b414e-6b43-4e02-967d-1db9b0ce0bd9', NULL, 'Pizza bianca', '3', '2025-10-12 18:50:02.341516+00'),
	('857360ad-24b0-4a20-91db-01a25d862e14', '61b07494-34b7-4dd8-9c6d-48c563c87f38', NULL, 'Bomba Piccante', '4', '2025-10-12 18:52:11.402105+00'),
	('acd46953-45c1-4e5d-a961-98214b3da1b3', 'b9577e46-57a8-4be9-9543-26ebf990104f', NULL, 'Francesine', '3', '2025-10-12 18:52:32.657387+00'),
	('a68b23bb-a688-42cc-a2f6-85dd97934227', '8d450bbf-9f9f-4aea-9b1a-208ade88db8b', NULL, 'Sale Bustine', '3', '2025-10-12 18:53:30.241417+00'),
	('22323917-051e-4696-8573-ada088d754fe', '08100719-53c5-4b98-8c84-f0af95ad729b', NULL, 'Pepe Bustine', '3', '2025-10-12 18:54:06.237437+00'),
	('b8bb867f-b98d-4a68-a163-858eabd03f40', 'eecb57fa-ceee-4d9b-a6f7-50fea578eeba', NULL, 'Pepe Bustine', '3', '2025-10-12 18:55:02.964159+00'),
	('6930e791-b047-48ff-b8be-68b156f509fc', '08a88ad2-5453-4214-9e69-f04e70791f09', NULL, 'Pepe Bustine', '3', '2025-10-12 18:55:42.316728+00'),
	('a2df0e6c-ace9-40df-ba64-e1c0b68fa573', 'd1a4b372-f3dc-4bd9-ba60-88ffa87ce393', NULL, 'Fuselli Panati', '4', '2025-10-12 18:56:11.102822+00'),
	('450257ca-69de-4aa3-bea4-298c5986cc24', '262c3a27-87a8-4d93-8679-817e023c637d', NULL, 'Pizza bianca', '4', '2025-10-12 18:56:28.603466+00'),
	('bb20938a-5039-4ea1-bfbf-d85c8dff3516', 'a1164786-55c2-4c89-9fa0-a6bebd67eaf0', NULL, 'Sale Bustine', '3', '2025-10-12 18:56:52.763121+00'),
	('375d5f80-ab59-42e8-b9ea-00d604de0ac7', '8c3ade29-fd07-4881-84a4-1b326b58f73f', NULL, 'Pizza bianca', '2', '2025-10-12 18:57:30.556387+00'),
	('c0bb39df-4dc9-41e1-bc50-b63239d796f2', '2de4624b-dc2b-44eb-a4db-e17064861ab5', NULL, 'Pizza bianca', '2', '2025-10-12 19:00:10.678595+00'),
	('a39e19dc-a22d-44b3-8d83-6094092fa43b', '597ba47d-bd26-4d0e-91e8-7133b102068e', NULL, 'Pizza bianca', '2', '2025-10-12 19:07:40.935487+00'),
	('a5c1c765-60b1-4177-933a-a9aba89306b5', '7eee9bfb-4063-4b8e-9cf0-b0563537709d', NULL, 'Pizza bianca', '2', '2025-10-12 19:08:32.709357+00'),
	('0c506072-28ac-4df3-81e5-ae55ae7279ad', 'a8c99e38-df8b-47db-9d83-3dc81a4658ff', NULL, 'Pizza bianca', '2', '2025-10-12 20:36:29.566332+00'),
	('95eb457f-518a-4649-b5d7-b5a042e9136e', 'dd522af2-1cf8-4796-b4c7-cb9c860664ed', NULL, 'Bresaola', '3', '2025-10-12 20:36:44.79209+00'),
	('9f9d921d-69f6-40ca-ba80-742f311fef58', '22c7d700-ef96-4dbd-ae22-da52dead7b72', NULL, 'Rucola', '2', '2025-10-12 21:00:15.526619+00'),
	('be3c1566-eabd-4426-b8f1-0458127a04e7', '22c7d700-ef96-4dbd-ae22-da52dead7b72', NULL, 'Songino', '2', '2025-10-12 21:00:15.526619+00'),
	('bd760ca1-c07a-451d-b839-edd4900897bb', '22c7d700-ef96-4dbd-ae22-da52dead7b72', NULL, 'Semola Rimacinata', '2', '2025-10-12 21:00:15.526619+00'),
	('78645f32-a875-47d0-8f5a-cdf99e28b499', '0dba9aa2-d76d-4642-9c40-e03b02859593', NULL, 'Carne secca', '0', '2025-10-12 21:03:08.304963+00'),
	('047f2c70-6053-4e07-9f78-6e1644adeed1', '0dba9aa2-d76d-4642-9c40-e03b02859593', NULL, 'Bresaola', '0', '2025-10-12 21:03:08.304963+00'),
	('282189fc-6f63-46e1-925c-ded7f5286674', '0dba9aa2-d76d-4642-9c40-e03b02859593', NULL, 'Shawarma', '5', '2025-10-12 21:03:08.304963+00'),
	('f8571044-d0c4-4763-9a3f-44777fd26f32', '7151cdac-0253-45bb-a5e1-5222415da7d6', NULL, 'Lattuga', '1', '2025-10-12 21:03:45.070419+00'),
	('306c1446-463c-4d1d-8372-22bd9a72cf7f', 'facd6dff-4c36-412f-a6dd-6d930258f3c6', NULL, 'BBQ', '0', '2025-10-12 21:04:36.346366+00'),
	('9acc8a80-2795-48fa-a2e2-7b3f88137357', '331bdc24-d6aa-4d25-b870-d3c7a4a6c362', NULL, 'Shnitzel', '15', '2025-10-12 21:05:36.941527+00'),
	('c53038f5-cc3a-4390-8a00-9af3980aebf9', '331bdc24-d6aa-4d25-b870-d3c7a4a6c362', NULL, 'Francesine', '3', '2025-10-12 21:05:36.941527+00'),
	('b39f54d5-228c-40be-8f8a-513b0763caf0', '331bdc24-d6aa-4d25-b870-d3c7a4a6c362', NULL, 'Fettine Panate', '10', '2025-10-12 21:05:36.941527+00'),
	('162e12e3-f5be-484c-aa4d-3523381f3c9d', '707f4040-6422-4297-ae76-237c3c40a91e', NULL, 'Pizza bianca', '1', '2025-10-12 21:06:14.288729+00'),
	('3b4f8e77-37b5-49c3-95c8-8fe57e8cc7f4', '1ddcc4f0-3658-4216-9f39-2ccfd5de2cbf', NULL, 'Pizza bianca', '1', '2025-10-13 09:53:22.759404+00'),
	('aa9e6b70-4579-4793-a989-b0dd9edaace7', '30a5ccb6-9f1d-4f23-a33d-b2cda4fce9b1', NULL, 'Pizza bianca', '1', '2025-10-13 16:29:06.092677+00'),
	('034b0131-e84b-4f27-9910-3298229654ed', 'f1a203f2-fa5d-4a93-9703-96eb4790ad56', NULL, 'Pizza bianca', '2', '2025-10-13 16:29:24.440095+00'),
	('cbcfbda8-da3c-4794-9eba-191cb448374d', 'b68cfae2-25ec-462b-9236-f415d66a2963', NULL, 'glock', '10', '2025-10-13 17:03:40.896738+00'),
	('83066449-e596-4e3e-9f1b-12f6d0ff1ec0', '5d21dc9f-609a-437b-a138-05a16a280d79', NULL, 'bistecche', '9', '2025-10-13 17:23:52.950554+00'),
	('ce1c0fa0-0c00-46e7-8a55-6e4bbf985d3c', 'ce3e806e-ddbd-4cf2-89a6-77dcdaac583b', NULL, 'bistecche', '9', '2025-10-13 17:24:44.827789+00'),
	('edd34132-53aa-4c0d-8de1-9b57bbadfe6c', 'ce3e806e-ddbd-4cf2-89a6-77dcdaac583b', NULL, 'glock', '5', '2025-10-13 17:24:44.827789+00'),
	('4788ee0c-46f8-4546-a2c8-a83b6f34a3fe', 'ce3e806e-ddbd-4cf2-89a6-77dcdaac583b', NULL, 'lancia granate', '8', '2025-10-13 17:24:44.827789+00'),
	('ea0339d1-cd92-4f4b-a8a1-188bb82a6e09', 'ce3e806e-ddbd-4cf2-89a6-77dcdaac583b', NULL, 'carri armate', '8', '2025-10-13 17:24:44.827789+00'),
	('dacc3004-ea6a-47e6-a2dd-9047d7b00131', 'da597509-4777-4d81-8ffd-f5bb0e32e340', NULL, 'Songino', '10', '2025-10-14 12:58:38.871803+00'),
	('0efafec0-fb3f-4e3d-b1ad-d9d430b4f92b', '14bd57f6-567b-4476-815a-2a0832a24504', NULL, 'Pizza bianca', '2', '2025-10-14 17:40:49.733508+00'),
	('26b33b11-0baf-4229-a67a-b35751c649e5', '73c9e995-d63b-4a40-b55f-7153cfa56588', NULL, 'Rucola', '2', '2025-10-15 18:08:07.668317+00'),
	('50aa944d-e393-4c9c-918b-f2887ff5dedc', '73c9e995-d63b-4a40-b55f-7153cfa56588', NULL, 'Cavolo Rosso', '2', '2025-10-15 18:08:07.668317+00'),
	('60a5c1a8-56da-451e-a4d8-0f4be62ac3aa', '73c9e995-d63b-4a40-b55f-7153cfa56588', NULL, 'Songino', '2', '2025-10-15 18:08:07.668317+00'),
	('2d0e217e-c8e5-4144-8042-fbb418a2a816', '73c9e995-d63b-4a40-b55f-7153cfa56588', NULL, 'Rotoli carta', '2', '2025-10-15 18:08:07.668317+00'),
	('2595e8ba-7fd1-48ef-a993-9394acfa2048', '208fef9b-30a1-4181-b8fe-d743551d9b2c', NULL, 'Grappolo', '1', '2025-10-15 18:08:55.337724+00'),
	('367a0f07-0f48-4801-a33a-90fd85918302', '9ffdc49d-7ffa-4068-9a35-28a90edd9a43', NULL, 'Sfoglia', '1', '2025-10-15 18:10:42.125039+00'),
	('0f62567a-be0f-4af7-b80f-b08976878b6c', '9ffdc49d-7ffa-4068-9a35-28a90edd9a43', NULL, 'Asado', '1', '2025-10-15 18:10:42.125039+00'),
	('30c24f39-736b-488b-8cc6-8f31e14e0e0c', '6ec3892c-b564-4b09-8aa1-2879f2153281', NULL, 'Pizza bianca', '1', '2025-10-15 18:11:42.400924+00'),
	('af3137d3-dae7-43b1-a64f-1de60103b5df', '59c5be78-b93e-49e3-a38c-5d83c0718cfb', NULL, 'Fuselli Panati', '6', '2025-10-15 18:14:52.877529+00'),
	('b8a6d3a1-ad70-4e66-b0d0-2a110b99263b', '59c5be78-b93e-49e3-a38c-5d83c0718cfb', NULL, 'Shnitzel', '10', '2025-10-15 18:14:52.877529+00'),
	('f33dd17f-bf65-421a-a3d4-30c8bb81a898', '59c5be78-b93e-49e3-a38c-5d83c0718cfb', NULL, 'Bocconcini di Pollo', '2', '2025-10-15 18:14:52.877529+00'),
	('b98adda3-e8e3-4995-8ef5-6588982b4454', '59c5be78-b93e-49e3-a38c-5d83c0718cfb', NULL, 'Straccetti', '1', '2025-10-15 18:14:52.877529+00'),
	('858e4bf5-e265-42ed-a727-1501997ff34f', '79b34477-57fa-4a47-ae83-167283fa9d70', NULL, 'Prezzemolo', '3', '2025-10-16 10:59:24.174978+00'),
	('a45dbd0a-42c3-483c-bf1f-b354335881e8', '2db665d6-b5f2-40b1-aaeb-8a477ce707c6', NULL, 'Sale Bustine', '2', '2025-10-16 12:09:40.652072+00'),
	('6476edac-c9d4-43b0-a1c1-bb5b49ad6810', 'be2aa15c-3d39-4626-8217-c9daee86f600', NULL, 'Pizza bianca', '3', '2025-10-16 12:12:36.608005+00'),
	('de07a02f-c78c-4ab8-9984-096ebd40f20b', 'a17801c3-7a91-4e8f-be41-170a6098baca', NULL, 'Sale Bustine', '2', '2025-10-16 12:18:32.155006+00'),
	('c2535328-7fa0-4f56-8e86-018428ef39ff', 'd1ef13d5-7418-4acb-9e03-eb33937495cc', NULL, 'Sale Bustine', '2', '2025-10-16 12:18:57.653678+00'),
	('9e2a045b-1c27-4633-92b5-3b66062f1a47', '7bdfb673-ce05-45d6-ba51-4fa02be4af45', NULL, 'Sale Bustine', '2', '2025-10-16 12:34:30.023865+00'),
	('5fa3d5ee-1a8d-492e-85cb-4fd1c756e0d1', '579633ed-0fcf-4161-ba60-63c61fd36d66', NULL, 'Pepe Bustine', '3', '2025-10-16 12:38:18.169645+00'),
	('590334aa-009b-4dfa-b229-7e26908619a6', 'fe27d3a5-534e-4723-b008-55d937e35ded', NULL, 'Rucola', '2', '2025-10-16 12:38:57.982584+00'),
	('400077a1-da90-4321-827f-6691a9abad73', 'a97c9a47-dd86-4729-b8a6-70dec90d78d0', NULL, 'Pepe Bustine', '4', '2025-10-16 12:43:15.999077+00'),
	('860b2335-0388-4da2-a21a-94a7285bf143', 'f075b55b-b36c-49b0-90fc-8587ae9b56ec', NULL, 'Pepe Bustine', '2', '2025-10-16 12:43:45.040499+00'),
	('d0a1479d-fe4a-430c-8b61-ca81640e8376', '5f94ac71-a86d-436b-ad5b-b912efe7d22e', NULL, 'Songino', '3', '2025-10-16 12:44:19.665831+00'),
	('c987a96f-6a17-4926-947d-2742ceda70f5', '5e2b16e3-2a94-4880-b704-b45ec7f45333', NULL, 'Sale Bustine', '2', '2025-10-16 12:48:12.289239+00'),
	('c0ec3f92-0761-4914-a3b0-d2f60633878b', '55dfc36a-5237-4af6-b1a3-c1c3157c947d', NULL, 'Sale Bustine', '1', '2025-10-16 12:48:25.617806+00'),
	('df1f73d4-56f3-42f0-a99b-ce0bde706cec', '84346671-b36e-4605-9a21-75933ca9b3fe', NULL, 'Olio Bustine', '3', '2025-10-16 12:57:26.655911+00'),
	('8e564944-d95e-4c2c-ab2e-c51e742ac767', '5daa9e1a-3d41-4938-b939-eb792dde90a0', NULL, 'Cipolla Rossa', '1', '2025-10-16 21:06:36.528296+00'),
	('dc05a701-ec2a-42f9-8f3f-3eb78b0d3381', '5daa9e1a-3d41-4938-b939-eb792dde90a0', NULL, 'Tris Posate Monouso', '1', '2025-10-16 21:06:36.528296+00'),
	('0e5f00d6-507c-4570-865b-9e2c14c434fc', '5daa9e1a-3d41-4938-b939-eb792dde90a0', NULL, 'Guanti L', '2', '2025-10-16 21:06:36.528296+00'),
	('39c6d8bd-295b-4a6f-9449-0265011572a9', 'a594b139-f446-4f98-9a4e-29c40f471f8d', NULL, 'Cetrioli', '1', '2025-10-16 21:07:37.367969+00'),
	('cd04a235-6013-43ee-af99-90d9368e65e8', 'a594b139-f446-4f98-9a4e-29c40f471f8d', NULL, 'Cipolla Bianca', '1', '2025-10-16 21:07:37.367969+00'),
	('25ae6510-ea2d-4e14-bfa1-295b0a64b2a5', '0ae42cd1-8e63-422d-b76d-cccf21cac27b', NULL, 'Maionese BG', '0', '2025-10-16 21:10:04.734655+00'),
	('e056d8b9-4fe9-4e3b-b771-690d9010266c', '0ae42cd1-8e63-422d-b76d-cccf21cac27b', NULL, 'Porchetta', '0', '2025-10-16 21:10:04.734655+00'),
	('9c96ef4c-3c09-48a0-84e1-90fb09d7c01d', '0ae42cd1-8e63-422d-b76d-cccf21cac27b', NULL, 'Cheddar', '2', '2025-10-16 21:10:04.734655+00'),
	('07edf21d-d4ab-4f57-bafc-a1c3d432d8a6', '0ae42cd1-8e63-422d-b76d-cccf21cac27b', NULL, 'Salsa Chilly', '1', '2025-10-16 21:10:04.734655+00'),
	('ad355b12-0659-48ce-b855-267d50dcda3c', 'cecb5081-917f-4a36-92ae-255be6efdc3d', NULL, 'Fuselli Panati', '6', '2025-10-16 21:11:21.643365+00'),
	('66eb6d10-68eb-47a4-ba47-6982544754ac', 'cecb5081-917f-4a36-92ae-255be6efdc3d', NULL, 'Bocconcini di Pollo', '2', '2025-10-16 21:11:21.643365+00'),
	('8ca80f8a-e130-431a-a3b8-d39344ac6453', '973716b2-cb9d-48ec-aaf2-2ecc78c45e0d', NULL, 'Pizza bianca', '2', '2025-10-16 21:13:25.716274+00'),
	('d1cbb31a-aa84-4c18-bd31-3ff6d81f61e9', '72edea07-663d-4d20-800c-a4ead4a07a4e', NULL, 'Pizza bianca', '3', '2025-10-17 19:51:20.060757+00'),
	('17872422-11fb-4096-818f-c27dff4f7416', 'f0b00a19-60ee-498b-acff-053be165fa4a', NULL, 'Pizza bianca', '7', '2025-10-17 20:10:53.934279+00'),
	('35c50022-93f9-4b08-89ab-6713655650c7', '74aafa9f-474c-4926-a7c6-9fe93275b5fc', NULL, 'Ketchup', '4', '2025-10-17 20:19:42.958869+00'),
	('e0141fed-e0ae-4548-888e-219ab71af33e', 'de06558c-67d8-4de8-ac94-a7980e115f55', NULL, 'Pizza bianca', '2', '2025-10-17 20:33:02.029941+00'),
	('a2d37877-c203-4708-b05a-a61de9b8d176', '73142fec-befe-460d-9bfe-5b63a0d6856d', NULL, 'Pizza bianca', '2', '2025-10-17 20:33:08.444126+00'),
	('87b1eaef-3c01-4425-9a60-86256e16925f', 'f523afd8-e417-4568-8088-93ec26688761', NULL, 'Pizza bianca', '2', '2025-10-17 20:33:16.314648+00'),
	('2b572742-5253-4677-8b2c-7b2de482f1f9', 'edebf13b-a8cc-4e99-a6ca-d3c71365c082', NULL, 'Pizza bianca', '2', '2025-10-17 20:37:49.996159+00'),
	('c9548747-d2b0-4f43-8ed0-3ffc0a1780ec', 'd28bdccc-27d2-49ef-8b18-c885f7e83dfb', NULL, 'Pizza bianca', '2', '2025-10-17 20:39:44.376479+00'),
	('53d8e911-edcf-48ed-a3a5-c217b064639d', '154eb466-3d26-49b3-9188-c52145395516', NULL, 'Pizza bianca', '2', '2025-10-17 20:40:22.886524+00'),
	('e4b095de-d966-4e67-a619-d00fd193a6ef', 'b995b2d0-b63a-4e43-ae16-4f13a50e6698', NULL, 'Pizza bianca', '2', '2025-10-17 20:40:27.128783+00'),
	('f48ab169-4312-40d9-8eec-9b6576a7ef9e', 'ef2f8409-10b5-42ce-ac7c-d211c1a69889', NULL, 'Pizza bianca', '6', '2025-10-17 20:42:13.261526+00'),
	('f9c725e7-1087-4f3b-b724-48d80f48f3fb', '3ee82a7c-9485-4cdd-81fd-cdcddf265968', NULL, 'Pizza bianca', '6', '2025-10-17 20:42:21.508528+00'),
	('ef1bcf8d-c25f-4567-806a-290e81552d2e', 'a5a6a905-0a25-4615-bf50-9833fe51c17b', NULL, 'Pizza bianca', '6', '2025-10-17 20:42:32.335603+00'),
	('77fa0c9e-e81c-4f28-9f57-5e13c74a4b7f', '4464da75-b97f-4690-b13f-21e2071875fb', NULL, 'Pizza bianca', '7', '2025-10-17 20:44:50.191116+00'),
	('cbdcd417-72e8-4ee3-80f7-1bbefc82b405', '4a1d14f6-3d80-478d-9db1-623bc75b094d', NULL, 'Pizza bianca', '7', '2025-10-17 20:44:56.414792+00'),
	('85ce965e-7b68-47f6-ab80-3bd61f65d426', '53a2944a-f824-4ae2-b941-2ada65d95307', NULL, 'Pizza bianca', '2', '2025-10-18 14:33:18.27741+00'),
	('14506088-ec10-4cf9-b6db-a78431f69196', 'e0ec2f2b-627d-46f6-b892-e760d2804d35', NULL, 'Peperoncino olio', '2', '2025-10-18 14:33:18.555028+00'),
	('9c2ee448-c286-4e29-a668-0b200430a09f', '27cf6ab5-3ca2-40db-b293-cca1bba501d0', NULL, 'Bresaola', '4', '2025-10-18 14:33:18.80267+00'),
	('ab5822a2-6638-43bf-9b15-a1fb09ba3234', '120eea29-2959-4c0a-8934-5bfcb4a97b55', NULL, 'Pizza bianca', '8', '2025-10-18 16:39:46.209963+00'),
	('68427540-f295-4d11-bcca-f6e72aeae7c1', 'd8f59bdb-ae4a-4f31-8e1e-9167042c032a', NULL, 'Pizza bianca', '8', '2025-10-18 16:40:36.967953+00'),
	('5e840ce1-8e23-42a8-8e25-12641ad2543e', 'd7b99aaf-8287-472f-ba0a-4f8efb95b26a', NULL, 'Pizza bianca', '2', '2025-10-18 16:46:14.436933+00'),
	('66e64c69-08b9-4bd3-87e8-2c0bc3dbd0ba', 'fba1d382-a22b-4d69-8af7-806f9636d443', NULL, 'Bomba Piccante', '5', '2025-10-18 16:50:38.267972+00'),
	('2404593e-2fa0-4290-aa31-1ca2b47a2974', 'e2fe3546-a0d5-42c0-8092-53a4322d25f9', NULL, 'Pizza bianca', '3', '2025-10-18 17:00:03.367842+00'),
	('80dd0fe8-a5fa-4c80-8c36-39106d6da0cf', 'acf547cc-2ece-47af-a630-ff1b3537971c', NULL, 'Pizza bianca', '3', '2025-10-18 17:01:21.663335+00'),
	('832c7225-d8a7-47d9-a50e-6d4db14cf352', '26b6639e-71ea-4142-bfc4-384e2c5a693b', NULL, 'Peperoncino olio', '5', '2025-10-18 17:01:24.466357+00'),
	('9520ce64-e97b-4e3d-8236-1702eab87d99', 'd181465a-387d-4687-9616-1a04c86232cc', NULL, 'Pizza bianca', '3', '2025-10-18 17:05:04.770175+00'),
	('f0d1f18f-e072-4436-b54c-8c8dd2f076a7', '7b4c00ab-f1b3-4304-8a5c-7cf04393389a', NULL, 'Carne secca', '2', '2025-10-18 17:05:10.641684+00'),
	('0a17cb5a-93df-4967-a056-27812b5c34f9', '08e7ccf0-6ae2-4794-8e1f-40b7c4856156', NULL, 'Pizza bianca', '2', '2025-10-18 17:08:01.537732+00'),
	('edf76fe8-3746-47ca-aa2f-197e67266db4', 'eb5174db-4cbe-4b22-b3e9-75a29b4a19af', NULL, 'Lattuga', '1', '2025-10-18 17:08:12.569586+00'),
	('73059f81-1b88-4852-bf2c-c186006b0ba8', '7357ac7b-e2e7-42fa-beb3-467cb55685d5', NULL, 'Manitoba', '25', '2025-10-18 17:08:19.451252+00'),
	('64fb5371-0626-4761-8f9f-c23b87c221c6', '3e3c41b3-b8dc-47fd-be0f-41bd68267c94', NULL, 'Pizza bianca', '1', '2025-10-18 21:23:06.600248+00'),
	('2b073461-e99f-4b14-9de8-5eae9c79c961', 'cf763093-8213-4ff0-ae62-794b11d6f314', NULL, 'Rucola', '2', '2025-10-18 21:33:55.88501+00'),
	('79056473-6041-4db2-9ad8-ae65ac813be9', 'cf763093-8213-4ff0-ae62-794b11d6f314', NULL, 'Semola Rimacinata', '2', '2025-10-18 21:33:55.88501+00'),
	('483bbd6f-11b1-437b-b1df-67f771337003', 'cf763093-8213-4ff0-ae62-794b11d6f314', NULL, 'Manitoba', '25', '2025-10-18 21:33:55.88501+00'),
	('a247cc64-6cb9-4f9d-857b-2a52a880ffa6', '9b419248-1ae1-4050-9907-9d7f24b4b47b', NULL, 'Bomba Piccante', '2', '2025-10-18 21:57:29.850376+00'),
	('52b84723-aa34-4118-8346-dca7338c0ed6', '1c1d09d0-77e9-4744-9293-824671e12ee0', NULL, 'Pizza bianca', '6', '2025-10-19 14:59:27.345877+00'),
	('edfa2c29-e558-426a-8655-97e05cf99868', 'bcaf7160-6506-42c3-bb40-4af5d05deec0', NULL, 'Pizza bianca', '3', '2025-10-19 17:51:47.757693+00'),
	('1966f402-1e0d-42c4-8607-fc750672ba6f', 'da5631e0-eafc-4b5e-8f91-abfac7ed185c', NULL, 'Chocolla', '3', '2025-10-19 17:51:53.474876+00'),
	('aac27969-5566-4578-b0dd-2736440e7f7e', 'a264a653-75d2-4bc8-8788-8147a0f08a45', NULL, 'Pizza bianca', '7', '2025-10-19 18:48:10.050586+00'),
	('a0a14f88-5355-4e8e-a887-35f9bd62fd4d', 'f911c65c-7978-4212-8189-1a1518183d60', NULL, 'Cetriolini', '7', '2025-10-19 18:48:14.626988+00'),
	('eaf82550-1206-4e64-9dd4-b010663feb7f', 'ab4b49d1-e48f-483c-92ff-db37500f2f0c', NULL, 'po', '0', '2025-10-20 15:36:27.430711+00'),
	('a804ca17-29d0-4d04-80bd-3c9b2aacc887', 'ab4b49d1-e48f-483c-92ff-db37500f2f0c', NULL, 'l', '9', '2025-10-20 15:36:27.430711+00'),
	('08f6437a-2b15-46e1-929f-28297ee37a4a', '478b2560-c516-425d-9c8a-b25832d41898', NULL, 'po', '8', '2025-10-20 15:37:12.067596+00'),
	('8887a4d2-0509-4ad0-a008-bda24e260ed6', '8933a7f4-eeec-4431-9643-b899323b4880', NULL, 'po', '8', '2025-10-20 15:37:36.72505+00'),
	('5abf7245-dd99-4620-8b90-4ec533bf051c', 'e3634386-9d3a-4101-8737-b1f378757755', NULL, 'l', '9', '2025-10-20 15:37:45.246825+00'),
	('a3cae6fa-89e4-4019-8085-bb6105bbe747', '75bb527d-65e1-4754-80ba-95bbb0817693', NULL, 'l', '9', '2025-10-20 15:38:48.869267+00'),
	('8e8b88bf-f602-4d3e-9170-adebcdfbd439', '3cc39b99-0cd9-4a9c-9a36-3a05f5b1c0c5', NULL, 'po', '8', '2025-10-20 15:39:00.00862+00'),
	('70cc4bf4-9ded-4fa0-8a33-5f31c7e4e416', '543304f7-fbaa-4cd2-a6b4-2f08cf7baeaf', NULL, 'Fuselli Panati', '5', '2025-10-20 21:34:23.652748+00'),
	('67a25c08-80d6-4651-9c49-42e468dd7b0a', '543304f7-fbaa-4cd2-a6b4-2f08cf7baeaf', NULL, 'Shnitzel', '10', '2025-10-20 21:34:23.652748+00'),
	('f3410cc4-565f-407f-9c40-554a7a630713', '543304f7-fbaa-4cd2-a6b4-2f08cf7baeaf', NULL, 'Bocconcini di Pollo', '2', '2025-10-20 21:34:23.652748+00'),
	('459b7931-1eb2-45aa-979d-b7a39360e4da', '543304f7-fbaa-4cd2-a6b4-2f08cf7baeaf', NULL, 'Straccetti', '1', '2025-10-20 21:34:23.652748+00'),
	('dfdc090a-35f5-49b0-a63a-77f066b23e49', '7eb925ad-90dd-429a-a69a-a9a5b0338649', NULL, 'Pizza bianca', '1', '2025-10-20 21:34:38.188183+00'),
	('24f0443e-c15d-4566-902a-7493f235041a', '8c82d7ee-b93c-4e7a-a912-3e3d0e57c03f', NULL, 'Shawarma', '5', '2025-10-20 21:34:47.922839+00'),
	('727f8da6-3048-498b-bff6-5a5e0c5e2daa', 'b93d64c7-169e-44eb-a333-0c22b2f6f7ef', NULL, 'Rucola', '2', '2025-10-20 21:44:28.603396+00'),
	('19c49c66-0ceb-4550-8cb9-3f796e8c6245', 'b93d64c7-169e-44eb-a333-0c22b2f6f7ef', NULL, 'Tovaglioli neri 24x24', '1', '2025-10-20 21:44:28.603396+00'),
	('93ab6082-91b7-4ab3-85bf-c509631b60d1', 'b93d64c7-169e-44eb-a333-0c22b2f6f7ef', NULL, 'Manitoba', '25', '2025-10-20 21:44:28.603396+00'),
	('2a15638e-db3e-42dc-95a7-9f6d64099716', '6dbed8f2-bfe2-47da-8e09-6aac3b02091c', NULL, 'Goldstar', '0', '2025-10-22 00:25:22.413422+00'),
	('d0d35252-3576-41d9-912e-489b39bdaec7', '6dbed8f2-bfe2-47da-8e09-6aac3b02091c', NULL, 'Cheddar', '0', '2025-10-22 00:25:22.413422+00'),
	('9e73d200-827f-4cd4-9ac4-8b8809dec8db', 'e69c1264-b370-4fc4-8d2d-581b19a14d1e', NULL, 'Goldstar', '0', '2025-10-22 00:25:40.4195+00'),
	('fd843c46-d16b-403f-a51d-bfc65a72c50f', 'e69c1264-b370-4fc4-8d2d-581b19a14d1e', NULL, 'Cheddar', '0', '2025-10-22 00:25:40.4195+00'),
	('f83733c3-173a-4506-9c74-715349cb526d', 'a3ae23be-01b5-4b23-939c-05df8447f2f7', NULL, 'Shnitzel', '10', '2025-10-22 00:26:18.103295+00'),
	('3b269fa1-a501-42d1-9a4f-4bee7de1268c', '3c609a27-f425-4458-af05-ca8c7c5d2fef', NULL, 'Pizza bianca', '1', '2025-10-22 00:27:11.837288+00'),
	('a2033b76-34a8-4ee6-8a87-699b164ec38c', '54257d00-0d5d-4f26-9220-9033847c1f5c', NULL, 'Rucola', '2', '2025-10-22 21:20:54.057264+00'),
	('eed849f9-6de7-4059-b973-d09d7a244c3b', '54257d00-0d5d-4f26-9220-9033847c1f5c', NULL, 'Sapone Piatti', '2', '2025-10-22 21:20:54.057264+00'),
	('ec6cc186-dc2a-4f37-8de8-61cf5c34e4bd', '54257d00-0d5d-4f26-9220-9033847c1f5c', NULL, 'Manitoba', '25', '2025-10-22 21:20:54.057264+00'),
	('8d78d72d-66d0-476d-bf32-b6b3dc18248c', 'e821403d-4ee0-498a-bb48-ded609e5bc1a', NULL, 'Grappolo', '1', '2025-10-22 21:21:24.833185+00'),
	('cb86b4f1-cbcf-46d0-89ed-3c84a5256cab', 'e988423b-5a6d-43bf-8e8c-8e278b925385', NULL, 'Sfoglia', '1', '2025-10-22 21:21:37.682216+00'),
	('94de9df1-6bcc-4e79-a764-0c346412edfa', 'e988423b-5a6d-43bf-8e8c-8e278b925385', NULL, 'Asado', '1', '2025-10-22 21:21:37.682216+00'),
	('18a3b224-7306-4051-aec5-5ae4a048465b', 'e988423b-5a6d-43bf-8e8c-8e278b925385', NULL, 'Shawarma', '5', '2025-10-22 21:21:37.682216+00'),
	('ce2cedcd-cb57-4ef6-9595-f8401e87f01a', 'c33354a9-21d2-49f9-9acb-29ff5c486e4e', NULL, 'Pizza bianca', '1', '2025-10-22 21:21:50.830408+00'),
	('ffbd5dd5-ae0d-4802-ad35-77f48e87ae51', 'df53913e-2560-4537-b644-bbab3a0e8a3c', NULL, 'Shnitzel', '10', '2025-10-22 21:21:59.533424+00'),
	('76b28d80-b663-43af-8894-43a210f92e37', 'df53913e-2560-4537-b644-bbab3a0e8a3c', NULL, 'Francesine', '3', '2025-10-22 21:21:59.533424+00'),
	('966e553b-bbf6-4459-b363-848c356a7dc0', 'df53913e-2560-4537-b644-bbab3a0e8a3c', NULL, 'Bocconcini di Pollo', '2', '2025-10-22 21:21:59.533424+00'),
	('f51b20fd-3e4d-4798-a6ba-56980cf8c6d1', 'cfaf9d91-6d01-4742-91c7-c5431130384a', NULL, 'Scatola panino', '0', '2025-10-22 21:22:30.766314+00'),
	('8640a13e-a15d-4f4e-84bf-306291bb4d10', 'cfaf9d91-6d01-4742-91c7-c5431130384a', NULL, 'Poké e coperchio', '0', '2025-10-22 21:22:30.766314+00'),
	('6dad754b-f887-4a27-b92e-a075e4cc5602', 'cb326dc8-44f9-415d-bbde-b8052f3d6cc7', NULL, 'Maionese BG', '1', '2025-10-23 22:13:21.724398+00'),
	('63d66642-ba61-4a1c-8d4d-101a3f434ec7', 'cb326dc8-44f9-415d-bbde-b8052f3d6cc7', NULL, 'Cetriolini', '1', '2025-10-23 22:13:21.724398+00'),
	('703aec67-a6ee-4007-b710-4919291b61bd', 'cb326dc8-44f9-415d-bbde-b8052f3d6cc7', NULL, 'Pastrami', '1', '2025-10-23 22:13:21.724398+00'),
	('ad4ecdf6-4997-40b8-b9da-1f1d261f1748', 'fcccb9a7-53b6-4221-9111-c9dc0cf9d6d3', NULL, 'Maionese BG', '1', '2025-10-23 22:13:21.794172+00'),
	('81a7b887-3b84-4d26-a944-1f232f537996', 'fcccb9a7-53b6-4221-9111-c9dc0cf9d6d3', NULL, 'Cetriolini', '1', '2025-10-23 22:13:21.794172+00'),
	('17d3a316-7b04-45c1-8931-e562ea4d5db2', 'fcccb9a7-53b6-4221-9111-c9dc0cf9d6d3', NULL, 'Pastrami', '1', '2025-10-23 22:13:21.794172+00'),
	('1b7b15cf-2728-42e8-abef-98a7d1ff38b6', 'b789d3da-e094-4115-99ab-ca9ac9af3aaa', NULL, 'Fuselli Panati', '10', '2025-10-23 22:13:43.400468+00'),
	('65be7710-d79f-4360-9f69-c0278f1876d9', 'b789d3da-e094-4115-99ab-ca9ac9af3aaa', NULL, 'Shnitzel', '10', '2025-10-23 22:13:43.400468+00'),
	('bd23c05a-a110-477b-b938-70592013f9f6', 'b789d3da-e094-4115-99ab-ca9ac9af3aaa', NULL, 'Bocconcini di Pollo', '2', '2025-10-23 22:13:43.400468+00'),
	('c0cdc4e8-e4e9-4107-8ad7-b261043681f9', 'b789d3da-e094-4115-99ab-ca9ac9af3aaa', NULL, 'Fettine Panate', '10', '2025-10-23 22:13:43.400468+00'),
	('b694ba74-06f7-44f2-86e9-d0290cbe2d5f', 'afb0605d-25c3-44f2-83f8-3b871b6a6942', NULL, 'Pizza bianca', '1', '2025-10-23 22:14:01.365284+00'),
	('0a20a84f-2687-4081-b6ca-d49d7a88cbf7', '4702c44f-3d9b-4680-a2d4-28ec1428bf8b', NULL, 'Carne secca', '1', '2025-10-23 22:14:11.996089+00'),
	('86f7cda0-fd0e-4bff-8628-b230a8641f32', 'a5c13b0c-5432-45c6-aa8d-1c567a0049b8', NULL, 'Lattuga', '1', '2025-10-23 22:14:29.378189+00'),
	('6176018d-6d4d-42f1-9041-3dbedfd52531', '264e487f-96d3-4a9c-92d4-7902ecf373f9', NULL, 'Rucola', '2', '2025-10-23 22:17:34.755524+00'),
	('6d78b0ae-2328-4bf1-b196-3728b10a26be', '264e487f-96d3-4a9c-92d4-7902ecf373f9', NULL, 'Rotoli carta', '2', '2025-10-23 22:17:34.755524+00'),
	('56fa8864-1709-4af9-9bf5-40af7bc55529', '5fad9ff7-647e-48b0-a3d6-43ad627be01a', NULL, 'Paprika Affumicata', '2', '2025-10-24 16:53:51.049056+00'),
	('d8112bfa-0838-45d4-bf7b-694299df06ed', '731ba64f-92d2-4261-b627-b7d19e4728bb', NULL, 'Pastrami', '0', '2025-10-26 21:42:45.764481+00'),
	('64f35b53-a3e8-4aef-be1f-6bbc76c9440a', '0212267b-bb3f-40a7-bd94-3d235e0d0ab7', NULL, 'Fuselli Panati', '10', '2025-10-26 21:43:03.578304+00'),
	('60bc0003-40ab-4e9a-9b8a-68fa4a4a49b8', '0212267b-bb3f-40a7-bd94-3d235e0d0ab7', NULL, 'Shnitzel', '15', '2025-10-26 21:43:03.578304+00'),
	('47e1fba7-f254-4fd0-8afb-ff6efb435bd5', '0212267b-bb3f-40a7-bd94-3d235e0d0ab7', NULL, 'Bocconcini di Pollo', '2', '2025-10-26 21:43:03.578304+00'),
	('9744ff4e-218e-4ef0-ac46-7fb8cd5e1e1f', '0212267b-bb3f-40a7-bd94-3d235e0d0ab7', NULL, 'Fettine Panate', '10', '2025-10-26 21:43:03.578304+00'),
	('f70a5d48-5d58-4dbb-acf9-e6b5e08a9c50', 'b9d2d151-8e67-4eae-a5a9-1298a33c1146', NULL, 'Pizza bianca', '1', '2025-10-26 21:43:16.920227+00'),
	('b9b0e996-ccb1-4821-aec2-3a81e191a6b0', '4ed54302-17a3-4cb8-a591-ed951a4ef818', NULL, 'Carne secca', '0', '2025-10-26 21:43:33.254008+00'),
	('0ecee428-2a76-403d-9a11-5905964479ba', '4ed54302-17a3-4cb8-a591-ed951a4ef818', NULL, 'Shawarma', '5', '2025-10-26 21:43:33.254008+00'),
	('d759e874-84ef-4d4d-ab7c-bc18d3fcd658', '4ed54302-17a3-4cb8-a591-ed951a4ef818', NULL, 'Asado', '1', '2025-10-26 21:43:33.254008+00'),
	('d10f71ee-fdd1-4950-9bc6-5c1deaa0518b', 'cf3e6d14-5ffa-471c-a0c6-03cd41867e3d', NULL, 'Grappolo', '1', '2025-10-26 21:43:46.84793+00'),
	('998c0867-65aa-40ae-bcba-a42085e03570', 'db26911c-fc76-47ce-b692-7d3739e026dd', NULL, 'Olio Bustine', '1', '2025-10-26 21:44:08.180676+00'),
	('37fe81f3-8787-43f8-b386-e093c45c3504', 'db26911c-fc76-47ce-b692-7d3739e026dd', NULL, 'Songino', '2', '2025-10-26 21:44:08.180676+00'),
	('a3425042-125f-430e-92d0-5bc14c35aa04', 'db26911c-fc76-47ce-b692-7d3739e026dd', NULL, 'Guanti L', '2', '2025-10-26 21:44:08.180676+00'),
	('22d226de-52ed-487f-9dbb-fb4b4af744f7', '2b5f1259-fe61-4204-8c43-2ff9c05cc588', NULL, 'Sale Bustine', '2', '2025-10-27 19:48:02.913699+00'),
	('909347da-61b9-4d2d-b076-8ed6e28856fb', 'a807049d-66ef-402f-b58f-82628341b51e', NULL, 'Cheddar', '0', '2025-10-27 22:14:10.395015+00'),
	('0c70322e-98ef-4e2b-b39e-efdd4cd9e817', '1350ee27-c9ce-4bb9-9437-27cdfadad3f2', NULL, 'Shnitzel', '20', '2025-10-27 22:14:20.53128+00'),
	('b4fac462-d606-40c0-abda-e40ffe72d620', '1350ee27-c9ce-4bb9-9437-27cdfadad3f2', NULL, 'Fettine Panate', '10', '2025-10-27 22:14:20.53128+00'),
	('649588e4-c319-42e2-b695-45374b0b4c41', '1350ee27-c9ce-4bb9-9437-27cdfadad3f2', NULL, 'Straccetti', '1', '2025-10-27 22:14:20.53128+00'),
	('a7fcf2ec-88dc-4e91-be14-f41606da4c1b', 'd5750fd3-7536-4380-acd4-733952c81d5e', NULL, 'Pizza bianca', '1', '2025-10-27 22:14:31.083579+00'),
	('b8211420-f3ac-47a2-a1d8-28884926aa0c', '5e2531c5-2a18-4604-9165-d23ad3f0576e', NULL, 'Cipolla Rossa', '2', '2025-10-27 22:14:37.930584+00'),
	('61138008-9cf5-4f1a-80a4-667aedce6257', '345d084b-8060-4d31-9ad2-0dea296735b3', NULL, 'Cipolla Bianca', '1', '2025-10-27 22:14:46.430172+00'),
	('6e6a13b9-7cc2-477b-a1dd-a5a09a70090b', '6d319171-1b85-4e01-9b47-bc1a9fb2b32c', NULL, 'Carne secca', '3', '2025-10-29 15:37:47.322398+00'),
	('8d9f44b7-bb99-47f8-b72f-403ae94bc083', '7929f1f3-25d1-4de1-bb57-a86336f54a37', NULL, 'Cipolla Rossa', '3', '2025-10-29 15:38:06.612935+00'),
	('b972a83f-c0ae-440d-b2f7-0495ed869061', '0271bc90-4fd9-42a4-8506-ed5f84d8b506', NULL, 'Shnitzel', '5', '2025-10-29 17:46:15.560432+00'),
	('5624061c-7368-41c5-9fc6-8861fa3e0c75', 'dbea8090-b36a-4b12-864c-db00a64ef6e0', NULL, 'Pastrami', '0', '2025-10-29 23:54:10.668283+00'),
	('8afb97ce-d24b-4ea2-acc7-2b18b9b8a11d', 'bdfedb36-5e93-4bc1-8020-8e507470f130', NULL, 'Pastrami', '0', '2025-10-29 23:54:12.027155+00'),
	('00cc0f65-372e-43a7-94aa-68edb69dcdcb', '00353b82-a8ee-40d0-b0bd-406a3fdcc4f0', NULL, 'Shnitzel', '15', '2025-10-29 23:54:21.735518+00'),
	('3277a3cb-19a4-4d18-8dc4-6217665abe4c', '00353b82-a8ee-40d0-b0bd-406a3fdcc4f0', NULL, 'Francesine', '3', '2025-10-29 23:54:21.735518+00'),
	('b33522bd-5505-4a35-ac1c-dcd8c0a742de', 'c5a43b9c-b154-4e4f-86bb-d62075812196', NULL, 'Pizza bianca', '1', '2025-10-29 23:54:30.382354+00'),
	('30528250-6fdf-4fc7-9b3c-ab36fd3b4437', 'c6ac6ae2-bd11-40a6-b54e-5f42cc23cbd7', NULL, 'Rucola', '2', '2025-10-29 23:54:38.315071+00'),
	('035df6a8-94d6-472e-835c-f714466b5739', 'c6ac6ae2-bd11-40a6-b54e-5f42cc23cbd7', NULL, 'Guanti L', '2', '2025-10-29 23:54:38.315071+00'),
	('3ac6bd9e-900b-4f76-b82e-7868dc065b3d', 'c6ac6ae2-bd11-40a6-b54e-5f42cc23cbd7', NULL, 'Manitoba', '25', '2025-10-29 23:54:38.315071+00'),
	('786baf2f-3c59-44d4-a190-97b0cff6e8bd', '844ccf2a-ff82-4287-9b3b-c2dc464c3e0b', NULL, 'Carne secca', '0', '2025-10-29 23:54:57.57267+00'),
	('8c2b53d6-a84c-40d2-9ff0-cd5be6b8bf3f', '844ccf2a-ff82-4287-9b3b-c2dc464c3e0b', NULL, 'Bresaola', '0', '2025-10-29 23:54:57.57267+00'),
	('445fbbac-a16e-46b0-a6a9-8ee2e98bb681', '844ccf2a-ff82-4287-9b3b-c2dc464c3e0b', NULL, 'Sfoglia', '1', '2025-10-29 23:54:57.57267+00'),
	('8b335bf8-05e9-40a3-8337-f39b6ac8061b', 'b1180973-d55b-4ec9-a987-9b8a912cddbf', NULL, 'Songino', '2', '2025-10-30 22:12:53.14977+00'),
	('e4f46b67-f776-4d23-9b59-d05ec9513b42', 'b1180973-d55b-4ec9-a987-9b8a912cddbf', NULL, 'Rucola', '2', '2025-10-30 22:12:53.14977+00'),
	('b28b2946-7a81-4631-86c5-ccfbe4352336', 'b1180973-d55b-4ec9-a987-9b8a912cddbf', NULL, 'Cavolo Rosso', '2', '2025-10-30 22:12:53.14977+00'),
	('0bba798e-7a52-4b3c-b277-c2dbfcd8c5d0', '73dc6cb4-5b9b-4623-906a-5dcf4810c015', NULL, 'Cetrioli', '1', '2025-10-30 22:13:11.257254+00'),
	('def570ff-c49c-43da-9625-ba69260c4812', '73dc6cb4-5b9b-4623-906a-5dcf4810c015', NULL, 'Grappolo', '1', '2025-10-30 22:13:11.257254+00'),
	('c851065e-b6e6-4b9f-b7d5-ea5b363c6b67', '73dc6cb4-5b9b-4623-906a-5dcf4810c015', NULL, 'Lattuga', '1', '2025-10-30 22:13:11.257254+00'),
	('0bb52cf4-6eb3-4b4a-958b-76b20ab2336c', 'fa6e8fd3-0a13-4ae7-bb71-8486563a0c0f', NULL, 'Asado', '1', '2025-10-30 22:13:22.318642+00'),
	('84bdab93-0b0c-4aef-9d69-ac3d41b89d2c', '7f1fc213-030b-451d-843e-464759af019c', NULL, 'Maionese BG', '0', '2025-10-30 22:13:29.754557+00'),
	('3193da5e-36b8-4dce-82de-f398a326390b', '7f1fc213-030b-451d-843e-464759af019c', NULL, 'Pastrami', '0', '2025-10-30 22:13:29.754557+00'),
	('ee759d5a-fb29-4cd7-b056-dbed6acdf037', '7f1fc213-030b-451d-843e-464759af019c', NULL, 'Scatola panino', '0', '2025-10-30 22:13:29.754557+00'),
	('2213a0fe-a45e-4d00-b8ae-6dd85264d57c', '7f1fc213-030b-451d-843e-464759af019c', NULL, 'Poké e coperchio', '0', '2025-10-30 22:13:29.754557+00'),
	('c30f760e-e6b8-47ce-a0bb-834b28e1d688', '5f1cae9e-d074-4007-8cb0-af135f71dbc4', NULL, 'Fuselli Panati', '10', '2025-10-30 22:13:40.721251+00'),
	('04944dd0-1c16-464f-8627-fc223d217799', '5f1cae9e-d074-4007-8cb0-af135f71dbc4', NULL, 'Shnitzel', '20', '2025-10-30 22:13:40.721251+00'),
	('c4765bfd-367e-4cb9-8a72-71b66cdb7419', '5f1cae9e-d074-4007-8cb0-af135f71dbc4', NULL, 'Bocconcini di Pollo', '3', '2025-10-30 22:13:40.721251+00'),
	('3366fbf6-31f2-4996-9137-024ec3b6e7b2', '7bf74c68-e753-4b1c-a39e-052e4993abb5', NULL, 'Pizza bianca', '2', '2025-10-30 22:13:52.895766+00'),
	('21f78648-e101-4459-aaf2-61e7e795d409', '8f4eace5-ac02-4ef1-9a0f-d5ef8ec44afa', NULL, 'Pizza bianca', '1', '2025-11-01 23:17:22.183219+00'),
	('3f81fe79-fc25-438a-a610-6049f73b9088', 'f892e81a-910c-4048-9cca-361a5df1bdf7', NULL, 'Satola sfizi', '0', '2025-11-02 22:08:13.109333+00'),
	('93da7844-f00d-46b5-b299-a37a58282161', 'f892e81a-910c-4048-9cca-361a5df1bdf7', NULL, 'Poké e coperchio', '0', '2025-11-02 22:08:13.109333+00'),
	('4640319f-c77b-4799-a253-648b606a7373', 'f892e81a-910c-4048-9cca-361a5df1bdf7', NULL, 'Cheddar', '0', '2025-11-02 22:08:13.109333+00'),
	('af103292-47c7-4ede-b07a-0a082dc878af', '82d3e8b0-f7a2-457f-8284-542b33727f83', NULL, 'Shnitzel', '10', '2025-11-02 22:08:22.104513+00'),
	('58ccf7fb-2fc0-4c6a-84c1-393f22d1d4b0', '82d3e8b0-f7a2-457f-8284-542b33727f83', NULL, 'Bocconcini di Pollo', '2', '2025-11-02 22:08:22.104513+00'),
	('36bb61d3-cc73-48b9-a2af-618955c735e8', '9502e299-6934-4a24-99cb-0f12353db295', NULL, 'Pizza bianca', '1', '2025-11-02 22:08:34.686299+00'),
	('d56b902e-8388-4d0b-b5ac-3d61dff804ac', 'd1b5c6d6-b16f-4831-8cd8-c6b8f3486905', NULL, 'Songino', '2', '2025-11-02 22:08:44.919147+00'),
	('295d9175-e79a-4593-829f-378c1bfeb70b', 'd1b5c6d6-b16f-4831-8cd8-c6b8f3486905', NULL, 'Rucola', '2', '2025-11-02 22:08:44.919147+00'),
	('ee481b56-fc8f-4d2d-80bb-59505662a90d', 'd3c783d0-4758-477a-bae5-8db0e8da6f34', NULL, 'Bresaola', '0', '2025-11-02 22:09:09.303039+00'),
	('9a541d26-046a-4a16-963f-9dbad808a559', 'd3c783d0-4758-477a-bae5-8db0e8da6f34', NULL, 'Asado', '1', '2025-11-02 22:09:09.303039+00'),
	('b141ad31-23bf-4e64-b29c-1a47c3599ade', '1f3a27ac-4daa-428d-8c82-e20cd107fc26', NULL, 'Grappolo', '1', '2025-11-02 22:09:18.977056+00'),
	('9e47bff1-d933-428e-a621-bd10a9f1462a', '703e5934-84d3-4eaa-a4b0-7efbc44a25f3', NULL, 'Pizza bianca', '1', '2025-11-03 09:50:14.036963+00'),
	('eaecf827-6179-4212-b27b-ea57a6e90c56', '5cb259a3-3a6d-4db9-8cf4-484b582b8183', NULL, 'Pizza bianca', '1', '2025-11-03 22:00:44.0128+00'),
	('0626cdff-30d0-4ba3-b98d-6bb5fcd9b965', '8cc928a7-5066-49e9-ac3d-53e2ecf88126', NULL, 'Bocconcini di Pollo', '2', '2025-11-03 22:00:54.929542+00'),
	('d95e86d8-1a31-47aa-990c-10bcc7c07fd1', '8cc928a7-5066-49e9-ac3d-53e2ecf88126', NULL, 'Fettine Panate', '6', '2025-11-03 22:00:54.929542+00'),
	('d43795fe-a1b3-4246-be03-e3878f879166', '8cc928a7-5066-49e9-ac3d-53e2ecf88126', NULL, 'Straccetti', '1', '2025-11-03 22:00:54.929542+00'),
	('3ff02acf-a3be-44da-83e5-d9980c9d4a0c', '2adc0644-7fde-4bfb-a472-de50ee8962d7', NULL, 'Songino', '2', '2025-11-03 22:01:05.272+00'),
	('a0f09697-df52-407b-af17-842300cda37c', '2adc0644-7fde-4bfb-a472-de50ee8962d7', NULL, 'Rucola', '2', '2025-11-03 22:01:05.272+00'),
	('d816ca76-555d-4959-9948-096a1d66b852', '2adc0644-7fde-4bfb-a472-de50ee8962d7', NULL, 'Guanti L', '2', '2025-11-03 22:01:05.272+00'),
	('a560de15-e56c-4baa-aead-2013cc6420c9', '2adc0644-7fde-4bfb-a472-de50ee8962d7', NULL, 'Manitoba', '25', '2025-11-03 22:01:05.272+00'),
	('3017e91a-5d10-44bd-9b90-7d9f06d7db09', '9b2c67b8-ddc8-4e2f-8cc0-89b2ad585194', NULL, 'Asado', '1', '2025-11-03 22:01:26.792211+00'),
	('0e882513-2791-40f5-af21-af21a5a80c6a', '9b2c67b8-ddc8-4e2f-8cc0-89b2ad585194', NULL, 'Shawarma', '5', '2025-11-03 22:01:26.792211+00'),
	('db73aa21-9d2e-450f-9449-94367aaccf39', '0c088159-fc23-46b0-ab79-07c5aa4fe614', NULL, 'Pastrami', '0', '2025-11-04 21:44:33.682912+00'),
	('fa4144ab-89f8-455c-b187-97cac243962e', '0c088159-fc23-46b0-ab79-07c5aa4fe614', NULL, 'Pita', '0', '2025-11-04 21:44:33.682912+00'),
	('18d7cfb8-c08b-48c9-864d-346a08b64d1a', 'ba14bc26-58ac-4d9c-aa7a-c707c4a32859', NULL, 'Shnitzel', '15', '2025-11-04 21:44:42.374143+00'),
	('d277ba76-4a4a-46df-8055-7cd72b1b67b2', 'ba14bc26-58ac-4d9c-aa7a-c707c4a32859', NULL, 'Francesine', '3', '2025-11-04 21:44:42.374143+00'),
	('5caf28e4-d670-4eda-a709-1c0102d1289e', 'ba14bc26-58ac-4d9c-aa7a-c707c4a32859', NULL, 'Bocconcini di Pollo', '2', '2025-11-04 21:44:42.374143+00'),
	('e71830d3-a436-46c1-9909-8816b8598370', '7d5fcc7a-4cb0-4cf0-83a8-49040c525e63', NULL, 'Pizza bianca', '1', '2025-11-04 21:44:50.426054+00'),
	('aa75395e-9ae0-49e2-be3f-51d9abaf6e3d', '8c9e47bf-92c2-4715-a720-5ed66dbf0c12', NULL, 'Tris Posate Monouso', '1', '2025-11-04 21:45:17.702373+00'),
	('9495b85e-955f-4f93-b46b-94ba44a8c2d1', '8c9e47bf-92c2-4715-a720-5ed66dbf0c12', NULL, 'Rotoli carta', '2', '2025-11-04 21:45:17.702373+00'),
	('c1dbd75e-4aab-4192-b69c-f493b8e41dd1', 'b0a21730-12bf-4771-95ed-37c3a7d89131', NULL, 'Carne secca', '0', '2025-11-04 21:45:28.664399+00'),
	('b0a65ea4-65f3-47de-b0b7-74f64dd612a5', 'b0a21730-12bf-4771-95ed-37c3a7d89131', NULL, 'Shawarma', '10', '2025-11-04 21:45:28.664399+00'),
	('90fa265d-a16b-455d-8637-6e3a2cf40da2', '685c6f90-4e77-4e8f-adbd-56f89a5fb405', NULL, 'bistecche', '10', '2025-11-05 09:07:53.542982+00'),
	('53ce324a-c66d-4ee4-979d-98e1b5b09bb6', 'd69e917a-5003-4700-a954-af7bd097f18e', NULL, 'Goldstar', '1', '2025-11-05 22:15:04.033224+00'),
	('90e4d4cf-c856-4e7d-b939-15b367fff627', '5de1e093-7e78-4e05-81db-2767024e03f5', NULL, 'Shnitzel', '15', '2025-11-05 22:15:13.388109+00'),
	('6bf6d414-15eb-40fc-a609-fde97f11cfe8', '5de1e093-7e78-4e05-81db-2767024e03f5', NULL, 'Bocconcini di Pollo', '2', '2025-11-05 22:15:13.388109+00'),
	('b5662587-b1c3-406a-be0e-89ed7c0f1b5d', '5de1e093-7e78-4e05-81db-2767024e03f5', NULL, 'Fettine Panate', '10', '2025-11-05 22:15:13.388109+00'),
	('ba2f2eac-b463-4b99-a202-687b115e53fd', '7c0d09df-5f23-4644-ab68-62c837511aba', NULL, 'Pizza bianca', '1', '2025-11-05 22:16:05.940444+00'),
	('19a62cb7-8c15-4dd5-991e-4eb29d9934c9', 'f1849a9e-174d-4744-bfc3-13898cb187cd', NULL, 'Olio Bustine', '1', '2025-11-05 22:16:14.175947+00'),
	('ef0c46ba-6254-4e6b-b715-89d0cb0fe6fb', 'f1849a9e-174d-4744-bfc3-13898cb187cd', NULL, 'Cavolo Rosso', '2', '2025-11-05 22:16:14.175947+00'),
	('796709b5-1ba9-423a-a2d8-f6d67c828ee5', '2f02d324-3752-4edd-ae05-906732fca33f', NULL, 'Sfoglia', '1', '2025-11-05 22:16:24.711882+00'),
	('ea3df95f-b28e-4fb3-aac7-ab18273a550c', '2f02d324-3752-4edd-ae05-906732fca33f', NULL, 'Asado', '1', '2025-11-05 22:16:24.711882+00'),
	('02454739-82a2-4841-95f3-055095329091', '3412c5af-09cc-4483-9986-a8f5a57be368', NULL, 'Cetriolini', '0', '2025-11-06 22:18:58.100803+00'),
	('a66eb46f-f1b4-42d2-969e-23b2904c4c7e', '3412c5af-09cc-4483-9986-a8f5a57be368', NULL, 'Senape', '0', '2025-11-06 22:18:58.100803+00'),
	('10229c24-168d-4fa0-9e88-ccf66aa54d77', 'cea33f8d-138f-47e7-9807-971a866eb993', NULL, 'Fuselli Panati', '5', '2025-11-06 22:19:08.640037+00'),
	('d19bd5f7-bf80-497e-bbae-275018c05c58', 'cea33f8d-138f-47e7-9807-971a866eb993', NULL, 'Shnitzel', '15', '2025-11-06 22:19:08.640037+00'),
	('433030e2-bc02-424b-83c7-03227190369c', 'cea33f8d-138f-47e7-9807-971a866eb993', NULL, 'Fettine Panate', '10', '2025-11-06 22:19:08.640037+00'),
	('7c183cec-81b2-48cf-9421-fa8cb27e1f35', 'cea33f8d-138f-47e7-9807-971a866eb993', NULL, 'Straccetti', '1', '2025-11-06 22:19:08.640037+00'),
	('85c37850-4fbd-442e-b09a-7f5c9e118e69', 'b5619b2a-c460-4217-adb2-f1758d352179', NULL, 'Pizza bianca', '2', '2025-11-06 22:19:19.799579+00'),
	('37ce6e7c-7db7-46de-8e1f-5e3f18a265d4', '326dae34-cb08-4c89-8217-7a8ca0226441', NULL, 'Rotoli carta', '3', '2025-11-06 22:19:27.040361+00'),
	('7ea043b9-09bf-469f-873f-d8983b448c1b', '326dae34-cb08-4c89-8217-7a8ca0226441', NULL, 'Manitoba', '25', '2025-11-06 22:19:27.040361+00'),
	('91cfbcbb-f22c-4caf-b137-7f29f39e94f6', '2d969d0c-2bbd-4827-bf6b-91423aa46abc', NULL, 'Grappolo', '1', '2025-11-06 22:19:38.601095+00'),
	('99621b23-0d18-41aa-8bd5-a0a02df4c52a', '5b0e490f-6b4a-4e10-be9e-28eb68a90c9c', NULL, 'Pizza bianca', '1', '2025-11-08 22:11:32.84881+00'),
	('2490d009-65c1-404b-8768-2871015a4f67', '1402d60a-60ef-4985-a897-cb7e83eabc14', NULL, 'Guanti L', '2', '2025-11-08 22:11:40.556831+00'),
	('26d288c8-9937-4b17-b63a-f9ee25d0695e', '1bf789a9-da0d-4dc9-98fd-321425ed18fd', NULL, 'Senape', '0', '2025-11-09 22:11:34.083735+00'),
	('4fb24c0a-cd63-48b3-a21d-04b94071bb67', '1bf789a9-da0d-4dc9-98fd-321425ed18fd', NULL, 'Porchetta', '0', '2025-11-09 22:11:34.083735+00'),
	('dc4eb0b2-3a1d-4135-b516-6827517cc5bb', 'b0bf7868-adec-4b18-8269-253d9a05d1b2', NULL, 'Fuselli Panati', '6', '2025-11-09 22:11:44.181355+00'),
	('ff47b744-ce4d-4025-a42c-277f384e128d', 'b0bf7868-adec-4b18-8269-253d9a05d1b2', NULL, 'Shnitzel', '10', '2025-11-09 22:11:44.181355+00'),
	('e1686e28-6447-49b2-9d7c-23e58c92bfba', 'b0bf7868-adec-4b18-8269-253d9a05d1b2', NULL, 'Francesine', '3', '2025-11-09 22:11:44.181355+00'),
	('925cd98e-5417-481b-a656-b6cb417540fb', 'b0bf7868-adec-4b18-8269-253d9a05d1b2', NULL, 'Bocconcini di Pollo', '2', '2025-11-09 22:11:44.181355+00'),
	('f132c1e6-88aa-4782-93fc-2461efeadd88', 'b0bf7868-adec-4b18-8269-253d9a05d1b2', NULL, 'Fettine Panate', '10', '2025-11-09 22:11:44.181355+00'),
	('2a466eda-ffa8-4bdb-bf07-7cc0ec961222', 'b0bf7868-adec-4b18-8269-253d9a05d1b2', NULL, 'Petti di Pollo', '1', '2025-11-09 22:11:44.181355+00'),
	('c4a63f79-1ccd-4d89-98f5-dd72b6f50093', 'd25c037a-0363-4c25-9528-256efaf7c1dc', NULL, 'Pizza bianca', '1', '2025-11-09 22:11:52.417803+00'),
	('b1291f01-4022-4f5e-abef-b6c852104d6f', '56ff10af-b3ed-4559-84cd-a774f8e0c5e8', NULL, 'Songino', '2', '2025-11-09 22:12:00.101819+00'),
	('88f7c906-5ceb-4cb8-841d-bf61cf1d0eb9', '56ff10af-b3ed-4559-84cd-a774f8e0c5e8', NULL, 'Rucola', '2', '2025-11-09 22:12:00.101819+00'),
	('bb0b46c0-faea-4850-9f8f-76496a81d045', '8214dcba-be4c-48bc-a3a2-3351cc343055', NULL, 'Carne secca', '0', '2025-11-09 22:12:14.816248+00'),
	('93259d58-6fb0-426b-a323-d8bb9d6132bb', '8214dcba-be4c-48bc-a3a2-3351cc343055', NULL, 'Bresaola', '0', '2025-11-09 22:12:14.816248+00'),
	('57cdb9ee-0b35-4a3c-aa12-65c2d484e82d', '8214dcba-be4c-48bc-a3a2-3351cc343055', NULL, 'Asado', '1', '2025-11-09 22:12:14.816248+00'),
	('8dff9022-9ac7-41bd-81ec-fec701f8567b', '8214dcba-be4c-48bc-a3a2-3351cc343055', NULL, 'Shawarma', '5', '2025-11-09 22:12:14.816248+00'),
	('bf8d4c03-35e3-4bf4-8c7c-f9ba62d496c4', 'd96556ef-b675-46a0-96e6-a515d2fcee50', NULL, 'Pizza bianca', '78', '2025-11-10 16:15:50.16258+00'),
	('ccab579f-2586-436b-a9ce-d1736ac883ac', '8d5a7f18-fd17-427e-a192-f2f050577cc4', NULL, 'Pizza bianca', '78', '2025-11-10 16:19:28.036863+00'),
	('d9ae090d-3932-4982-ba20-2850276f510c', '1aef089b-fec5-4b3d-977c-1295249cc112', NULL, 'Pizza bianca', '78', '2025-11-10 16:20:06.133022+00'),
	('fb967916-e3f4-444a-b7c6-b1badaa429b4', '5fd3d4e3-ec75-4a7a-a703-eab4b9f582c0', NULL, 'Pepe Bustine', '5', '2025-11-10 17:40:00.033274+00'),
	('6dfca020-8a3d-44cc-a7f7-ac7d5c174004', 'e03a0a7e-2e5e-4a3b-add1-b25caa189f07', NULL, 'Pepe Bustine', '4', '2025-11-10 17:42:22.016891+00'),
	('0b502786-aeba-4c9a-ae18-738b53c34038', '07f516cf-81a7-41cc-8427-6f211adac54b', NULL, 'Manitoba', '25', '2025-11-10 22:31:49.356809+00'),
	('8a3e63c0-3cfb-4ff8-9fbc-0a6cd85c8491', '06c14502-8dc8-4537-b439-b0ca785812a3', NULL, 'Grappolo', '1', '2025-11-10 22:32:13.032242+00'),
	('20ea2d74-771f-4b83-bd67-bd7d85d049b4', '06c14502-8dc8-4537-b439-b0ca785812a3', NULL, 'Patate', '5', '2025-11-10 22:32:13.032242+00'),
	('6898f5ab-0180-4b43-9bf3-f94f789f5171', '937a584f-d757-4765-88af-880026710a5d', NULL, 'Maionese BG', '0', '2025-11-10 22:32:26.49324+00'),
	('5c81f040-3422-417f-bfbb-8ea74c796bad', '937a584f-d757-4765-88af-880026710a5d', NULL, 'Cheddar', '0', '2025-11-10 22:32:26.49324+00'),
	('fe1c170f-e687-42f1-b27e-2a06f43de627', '91db7573-1005-41d7-bc68-cf187e76bfd0', NULL, 'Shnitzel', '10', '2025-11-10 22:32:35.40936+00'),
	('ed7a10aa-0bc6-4e3e-8cd7-0df332f77f8f', '91db7573-1005-41d7-bc68-cf187e76bfd0', NULL, 'Petti di Pollo', '1', '2025-11-10 22:32:35.40936+00'),
	('3308a1d9-0291-40e1-b71e-fef2dd3dc32f', '91db7573-1005-41d7-bc68-cf187e76bfd0', NULL, 'Straccetti', '1', '2025-11-10 22:32:35.40936+00'),
	('bdf38e0b-bfa1-4cc1-998a-7ead66055707', 'b21b2fef-9fe4-42a7-93a2-52d8a46a8744', NULL, 'Pizza bianca', '1', '2025-11-10 22:32:50.120446+00'),
	('df6bc516-e57f-4be5-89cd-2a508a9c5fb1', 'ccfce4b5-764c-4082-83e6-2adc9441054d', NULL, 'Olio Bustine', '2', '2025-11-11 16:05:02.41279+00'),
	('5bd43a1b-b969-408c-adb8-a124920affb4', 'd7537698-f485-44e2-adc8-d5578c81ae89', NULL, 'Paprika Affumicata', '1', '2025-11-11 16:06:41.647751+00'),
	('519f41ff-8282-4e71-8a84-6a0fce435dae', 'e712ceb5-0d35-45ac-b77e-5c8fc95db508', NULL, 'Olio Bustine', '1', '2025-11-11 16:12:30.566172+00'),
	('2495d6ed-b66a-4563-90a0-4c737464fbe8', '19a2b830-f03e-4c0a-9ceb-383bd7e59e94', NULL, 'Pepe Bustine', '7', '2025-11-11 16:32:58.445094+00'),
	('c2dce95c-3e60-45d6-9e39-cb331b3dbbeb', 'ab93d72a-0f6d-4153-be9f-0b44112b6d9a', NULL, 'Olio Bustine', '4', '2025-11-11 17:11:01.718063+00'),
	('af28df4e-dcf7-45b9-87f4-37803ad34720', '27de764f-a1e4-4060-9dbd-1693e97fe704', NULL, 'Pizza bianca', '1', '2025-11-11 17:34:11.494627+00'),
	('51c1be95-27ce-487d-b594-da12190f1c9c', '3b3884d7-c3ba-4786-b055-d52b0e8af33f', NULL, 'Satola sfizi', '0', '2025-11-11 22:48:11.600523+00'),
	('d3b349c4-beae-450f-9406-c8acd417621c', '3b3884d7-c3ba-4786-b055-d52b0e8af33f', NULL, 'Scatola panino', '0', '2025-11-11 22:48:11.600523+00'),
	('b8b46bcc-d891-4a60-927d-cc8f6c24d7db', '3b3884d7-c3ba-4786-b055-d52b0e8af33f', NULL, 'Busta SF', '0', '2025-11-11 22:48:11.600523+00'),
	('ac22a41d-c529-41a1-af0c-848824d532a2', '78127a48-ce36-48f8-9490-0df6edd23c5c', NULL, 'Fuselli Panati', '6', '2025-11-11 22:48:19.958189+00'),
	('feeb4a8e-c23f-4864-9bea-e179b1804d09', '78127a48-ce36-48f8-9490-0df6edd23c5c', NULL, 'Shnitzel', '10', '2025-11-11 22:48:19.958189+00'),
	('0d77060b-37cb-4b27-bee1-594b1cb85843', 'd8a8fba2-330e-4553-81db-0f4fe0bcbf2f', NULL, 'Pizza bianca', '1', '2025-11-11 22:48:26.984181+00'),
	('6c7ea099-2475-4db2-a3b8-7ba28c60c81d', 'a6444d79-3f9f-4d97-a8a5-1b681b08f71a', NULL, 'Tovaglioli neri 24x24', '1', '2025-11-11 22:48:33.703974+00'),
	('ca74cb61-7101-4ccb-9586-a421acbd17c4', 'a6444d79-3f9f-4d97-a8a5-1b681b08f71a', NULL, 'Rotoli carta', '2', '2025-11-11 22:48:33.703974+00'),
	('abb4c9c3-cfd4-4a57-8730-af9221f52ad4', 'a6444d79-3f9f-4d97-a8a5-1b681b08f71a', NULL, 'Cavolo Rosso', '2', '2025-11-11 22:48:33.703974+00'),
	('f8c11785-0043-41af-a427-50eb45317209', 'd08acf5e-2aa9-4ccb-939a-32652669155c', NULL, 'Asado', '1', '2025-11-11 22:49:05.361906+00'),
	('0a1d27dc-214f-49a9-93c4-422044ffd6bf', 'c45c446f-31cc-4f47-baaa-d51358f6de2b', NULL, 'Tovaglioli neri 24x24', '1', '2025-11-11 22:50:51.718823+00'),
	('d13981df-b385-4788-b561-9bfa3b137590', 'c45c446f-31cc-4f47-baaa-d51358f6de2b', NULL, 'Rotoli carta', '2', '2025-11-11 22:50:51.718823+00'),
	('7836ff1d-6277-4719-b992-678e53b034f1', 'c45c446f-31cc-4f47-baaa-d51358f6de2b', NULL, 'Cavolo Rosso', '2', '2025-11-11 22:50:51.718823+00'),
	('75ba5d84-2a42-4c5c-8df0-bb4a8483d659', 'e963ce92-2914-4936-a97d-1e3db0a0b0a0', NULL, 'Pizza bianca', '1', '2025-11-12 15:02:49.868022+00'),
	('7ae307f8-f48c-42c2-b2e5-81fda8eadde2', 'e330c001-c6f2-4c39-adc1-4896cdee8cce', NULL, 'Pepe Bustine', '1', '2025-11-12 16:20:45.946919+00'),
	('7b0fc8f5-0de4-492b-8b9f-8ac95b049fe5', 'abe802dd-c60d-4028-9d66-9ca4a6f00148', NULL, 'Pizza bianca', '1', '2025-11-12 17:40:34.961744+00'),
	('34ac7c30-691a-417a-8d00-ff63cc4d86a1', '2deeef12-1333-4dd3-97eb-8475e96a4d81', NULL, 'Pepe Bustine', '1', '2025-11-12 20:14:32.731117+00'),
	('5b8e0c6b-aee7-4603-9fd3-4cfacfbe56c4', 'e13e9d6a-83b9-4fd4-a9fd-a8b6230a94d0', NULL, 'Paprika Affumicata', '1', '2025-11-12 20:14:54.608698+00'),
	('0e5e0b60-de36-471a-a652-bc173ef168cf', 'c8233e9c-1f13-41e6-95db-12a5dcf81553', NULL, 'Peperoncino olio', '1', '2025-11-13 00:33:11.582598+00'),
	('6b8583df-0e84-4362-9cf6-f73260df2a0f', 'c8233e9c-1f13-41e6-95db-12a5dcf81553', NULL, 'Carta forno', '0', '2025-11-13 00:33:11.582598+00'),
	('73ef4203-9a57-47d8-8bd9-8030d3b25e0a', 'c8233e9c-1f13-41e6-95db-12a5dcf81553', NULL, 'Senape', '0', '2025-11-13 00:33:11.582598+00'),
	('ac68ab8d-864f-4987-8594-effd4cfdbfc3', 'c8233e9c-1f13-41e6-95db-12a5dcf81553', NULL, 'Pita', '1', '2025-11-13 00:33:11.582598+00'),
	('480e6f26-289a-4885-9682-5b9ce29550c2', 'c8233e9c-1f13-41e6-95db-12a5dcf81553', NULL, 'Poké e coperchio', '0', '2025-11-13 00:33:11.582598+00'),
	('33dd4c27-941a-4a7c-998d-fd16b697631c', '26d13db1-fb69-4a87-a203-1ddc7425a5b8', NULL, 'Shnitzel', '10', '2025-11-13 00:33:20.692156+00'),
	('35e3e256-bcc6-40bf-a256-8260446a9c56', '26d13db1-fb69-4a87-a203-1ddc7425a5b8', NULL, 'Petti di Pollo', '1', '2025-11-13 00:33:20.692156+00'),
	('b9165b0e-8621-4023-8c09-6ff664870315', '26d13db1-fb69-4a87-a203-1ddc7425a5b8', NULL, 'Bocconcini di Pollo', '2', '2025-11-13 00:33:20.692156+00'),
	('8828d914-7030-4883-8508-3a0575364d02', '26d13db1-fb69-4a87-a203-1ddc7425a5b8', NULL, 'Fettine Panate', '10', '2025-11-13 00:33:20.692156+00'),
	('7c8ae042-5347-4a5a-ac92-cfb915501ec3', '26d13db1-fb69-4a87-a203-1ddc7425a5b8', NULL, 'Straccetti', '1', '2025-11-13 00:33:20.692156+00'),
	('3eb76052-b126-45a9-ae68-7c3e998c4ac1', 'ec4b2baf-9005-43ce-af81-322cb6c72bb8', NULL, 'Pizza bianca', '1', '2025-11-13 00:33:29.160807+00'),
	('9278404f-106d-44c8-9269-a0582f10f92d', '66f96c03-8bd2-40fa-ba94-75f2723c3f20', NULL, 'Rucola', '3', '2025-11-13 00:33:38.138234+00'),
	('9c487acd-a1ba-4129-b09f-5ec82b48945d', '66f96c03-8bd2-40fa-ba94-75f2723c3f20', NULL, 'Songino', '3', '2025-11-13 00:33:38.138234+00'),
	('4ce50adb-cfb8-4b84-a9d9-b94cf7bffd1e', '66f96c03-8bd2-40fa-ba94-75f2723c3f20', NULL, 'Cipolla Rossa', '1', '2025-11-13 00:33:38.138234+00'),
	('876137f9-297a-4e25-9f6b-614725acc3bd', '66f96c03-8bd2-40fa-ba94-75f2723c3f20', NULL, 'Sapone Piatti', '2', '2025-11-13 00:33:38.138234+00'),
	('d076444d-d199-40ca-8877-715f193479cf', '66f96c03-8bd2-40fa-ba94-75f2723c3f20', NULL, 'Lavapavimenti', '2', '2025-11-13 00:33:38.138234+00'),
	('1e9d9301-4915-4722-8c52-fe422076de7b', '66f96c03-8bd2-40fa-ba94-75f2723c3f20', NULL, 'Rotoli carta', '2', '2025-11-13 00:33:38.138234+00'),
	('0a0de7d5-3861-4b73-aab3-69a160116ec1', '66f96c03-8bd2-40fa-ba94-75f2723c3f20', NULL, 'Paprika Affumicata', '2', '2025-11-13 00:33:38.138234+00'),
	('e7c64208-ad14-42b9-b0d7-6e713aa30c9c', '6227c768-91a4-43a6-a4a1-2dbaadf4494a', NULL, 'Cetrioli', '1', '2025-11-13 00:33:50.742068+00'),
	('0dca24a2-44ac-4126-88dd-7792b10733fe', '6227c768-91a4-43a6-a4a1-2dbaadf4494a', NULL, 'Patate', '5', '2025-11-13 00:33:50.742068+00'),
	('a5fea4da-4cda-47a5-93df-f96331a7b73f', '6227c768-91a4-43a6-a4a1-2dbaadf4494a', NULL, 'Lattuga', '4', '2025-11-13 00:33:50.742068+00'),
	('2c5b093c-774b-402f-ae55-a8cee9d3a114', '0b18abef-54eb-485a-b004-617174189dec', NULL, 'Pizza bianca', '2', '2025-11-13 22:16:57.20023+00'),
	('d691799b-8dfa-471b-87a6-fdabb4944815', '24e3b7b3-7971-4fde-afeb-868550acde16', NULL, 'Guanti L', '0', '2025-11-13 22:17:18.36686+00'),
	('1d0e513e-4e07-427b-856e-02c2cd637a16', '24e3b7b3-7971-4fde-afeb-868550acde16', NULL, 'Sale Bustine', '0', '2025-11-13 22:17:18.36686+00'),
	('b312728d-6528-4467-a6fd-822b834a50e5', '24e3b7b3-7971-4fde-afeb-868550acde16', NULL, 'Manitoba', '25', '2025-11-13 22:17:18.36686+00'),
	('bfc5e334-5e4a-48c5-ad4a-a1cbc3418e6d', '6b550d01-96ea-42ea-83dd-2e0f31c44764', NULL, 'Patate', '0', '2025-11-13 22:17:35.026595+00'),
	('a8c2cefd-1e61-49e5-b1a3-dc52a4530743', 'e94faadb-5cec-4281-aeb2-d01b82755029', NULL, 'Shnitzel', '10', '2025-11-13 22:17:57.799505+00'),
	('dd910df4-84c9-4884-b449-d9231c90ba2e', 'e94faadb-5cec-4281-aeb2-d01b82755029', NULL, 'Fuselli Panati', '10', '2025-11-13 22:17:57.799505+00'),
	('897c513f-3773-4f4b-8f2d-8d2933d7dd56', 'e94faadb-5cec-4281-aeb2-d01b82755029', NULL, 'Bocconcini di Pollo', '2', '2025-11-13 22:17:57.799505+00'),
	('0a2be487-6025-4122-b5a2-731dc82300bc', '78602df0-7995-4548-a149-d284a058ce52', NULL, 'Guanti L', '0', '2025-11-13 22:18:50.58217+00'),
	('58c4331b-c8af-4432-8806-e7c68f8aad0f', '78602df0-7995-4548-a149-d284a058ce52', NULL, 'Sale Bustine', '0', '2025-11-13 22:18:50.58217+00'),
	('de5b416f-7eee-4f90-b3a6-22b4b256a900', '78602df0-7995-4548-a149-d284a058ce52', NULL, 'Manitoba', '25', '2025-11-13 22:18:50.58217+00'),
	('9157b9ae-2e9d-4086-8983-3ead5b7ac444', '20c72696-29dc-49c8-8569-bcae78153880', NULL, 'Pizza bianca', '1', '2025-11-14 00:56:51.631072+00'),
	('0a77bffe-863b-40a3-8693-95ad4430058d', 'a60105b6-2b48-4c74-91f3-3512958f6808', NULL, 'Pizza bianca', '1', '2025-11-14 01:06:34.580663+00'),
	('3d9fa0f5-8485-4766-b321-45dd69b73fcb', 'd90366cc-2911-4a89-b149-2dbf36495360', NULL, 'Bomba Piccante', '2', '2025-11-14 01:06:40.268167+00'),
	('53c09527-68a0-4344-8d26-96a12c9e8ead', 'bfb55658-a9aa-44b2-a19b-0db38285c08e', NULL, 'Pizza bianca', '1', '2025-11-14 01:11:46.313357+00'),
	('ec6d2a6f-6388-4482-b8fe-8c6aa27c7c28', '48337778-c028-49cb-b344-2c2ff07f43eb', NULL, 'Bomba Piccante', '2', '2025-11-14 01:11:50.157099+00'),
	('3b221b9e-7762-4e68-a9c4-20b4c2882cf0', '025a984c-a505-4630-813d-bfc780f16e85', NULL, 'Pizza bianca', '4', '2025-11-14 01:23:38.941341+00'),
	('3f5e93e7-2c15-4730-8419-6a30d4c63805', 'f9d17746-18b7-42e7-bd53-6f6968755298', NULL, 'Bocconcini di Pollo', '5', '2025-11-14 01:23:44.28772+00'),
	('c3f8c746-5cf3-48d7-9928-b91e9afb1e1f', '09924428-7297-4bab-810e-bcfb757bfc3a', NULL, 'Sfoglia', '6', '2025-11-14 01:23:47.41231+00'),
	('a79b601a-c9d7-45d0-9111-c8c18e893bca', 'fcf3912c-c4eb-41e0-b500-0870f7a1148c', NULL, 'Pizza bianca', '6', '2025-11-14 01:29:26.23044+00'),
	('da499033-498d-44c3-8cde-d9dbbc650d5f', '4961e6f3-c9ab-4412-8738-bd2dbb2aaffa', NULL, 'Macinato', '6', '2025-11-14 01:29:30.091137+00'),
	('7fb7091f-27e6-41c8-bd43-d09c8c00a994', '9aef50c3-6c94-4d01-ad62-30da32e05efe', NULL, 'Pizza bianca', '1', '2025-11-14 01:31:46.093961+00'),
	('3a92caf3-ab3d-4db4-bb21-086b7dcd68b3', '202f33c9-4926-4960-9c00-d3ae03e7a604', NULL, 'Francesine', '1', '2025-11-14 01:31:50.270072+00'),
	('6f1097f9-7627-44bd-80d9-b04ae60a2b7e', 'caa64b65-c749-4e8f-897e-d83dd3829315', NULL, 'Pizza bianca', '1', '2025-11-14 01:32:54.842996+00'),
	('d3c75b02-1c8e-4fce-90d7-60b63d222d10', '8ef229d6-97b5-4ddb-bbcd-37c9284c848d', NULL, 'Fettine Panate', '1', '2025-11-14 01:32:58.077791+00'),
	('9edf7224-7322-401a-ab37-55e61def57aa', 'ea9dbb3a-927b-448a-8716-f7b912087f49', NULL, 'Pizza bianca', '1', '2025-11-14 01:35:31.28611+00'),
	('d9bb4d83-87e8-47b7-ae5e-3d2ea5f8d416', 'b35a5357-a6d5-41d5-b2ad-e4e5859aa0e2', NULL, 'Shnitzel', '1', '2025-11-14 01:35:43.362258+00'),
	('afba82ca-2e99-4a50-8942-69858bb3c0e2', '98fe2787-3c77-4c61-8768-2453820de3dd', NULL, 'Pizza bianca', '1', '2025-11-14 02:25:28.509859+00'),
	('4baa92e4-24ab-4ef7-89ae-2f71f33f87c0', 'd5f48fca-e31c-487f-84d0-94852527abb9', NULL, 'Paprika Dolce', '2', '2025-11-14 16:32:44.138291+00'),
	('83006c96-718c-49ba-bb18-f1085769f7b5', '5d7ef04e-99ba-4a9e-8835-ad7d8a8e309c', NULL, 'Songino', '2', '2025-11-15 22:34:34.089574+00'),
	('e49dff93-e569-45c1-aac3-03d63715a702', '5d7ef04e-99ba-4a9e-8835-ad7d8a8e309c', NULL, 'Rucola', '2', '2025-11-15 22:34:34.089574+00'),
	('32a74174-103e-49c4-90fb-d5a125da717f', 'b244c00a-a636-4220-8f8c-c88de7de5404', NULL, 'Pizza bianca', '1', '2025-11-15 22:34:40.391312+00'),
	('98fbd6d5-a1c5-4fc3-9127-3ac480740dc2', '7cfbf3ca-3950-4103-af08-268e8ca6131e', NULL, 'BBQ', '0', '2025-11-16 22:13:27.675671+00'),
	('bd4ef813-29e4-4752-b651-d559859fd4bf', '7cfbf3ca-3950-4103-af08-268e8ca6131e', NULL, 'Porchetta', '0', '2025-11-16 22:13:27.675671+00'),
	('a077374b-f427-458f-b702-e9b2734825fa', '7cfbf3ca-3950-4103-af08-268e8ca6131e', NULL, 'Pastrami', '0', '2025-11-16 22:13:27.675671+00'),
	('cb0066db-62bf-438c-b98f-700557b04e1e', '7cfbf3ca-3950-4103-af08-268e8ca6131e', NULL, 'Goldstar', '0', '2025-11-16 22:13:27.675671+00'),
	('58cd8fbb-eab1-4628-96c6-601f509d9f16', '7cfbf3ca-3950-4103-af08-268e8ca6131e', NULL, 'Satola sfizi', '0', '2025-11-16 22:13:27.675671+00'),
	('9ec397b0-8a7d-46f0-9d1a-44ae5bd6a670', '8dfaa9d7-69d4-4bc8-870e-ec08dbd89bc3', NULL, 'Fuselli Panati', '6', '2025-11-16 22:13:35.334326+00'),
	('4334242d-9c03-4bc0-acb3-6465b1a5baa2', '8dfaa9d7-69d4-4bc8-870e-ec08dbd89bc3', NULL, 'Shnitzel', '10', '2025-11-16 22:13:35.334326+00'),
	('db04f854-15dd-49a5-8884-21dc4a0b92c7', '8dfaa9d7-69d4-4bc8-870e-ec08dbd89bc3', NULL, 'Petti di Pollo', '1', '2025-11-16 22:13:35.334326+00'),
	('faa2d0fc-6f0d-4827-8c1e-0b0b30f2c404', '8dfaa9d7-69d4-4bc8-870e-ec08dbd89bc3', NULL, 'Pulled beef', '5', '2025-11-16 22:13:35.334326+00'),
	('3adde114-bf19-4296-8bc3-19976078171b', '946e2a4e-5f7e-482a-9c83-753f9350ce4f', NULL, 'Pizza bianca', '1', '2025-11-16 22:13:44.947891+00'),
	('bb043a9a-8ac3-4b3f-9d3b-7c1c9ca76c64', '15ab20a9-ad39-48db-b493-991f1d794151', NULL, 'Rotoli carta', '2', '2025-11-16 22:14:44.356559+00'),
	('68993dfb-bb76-4685-a90a-9628eac2c5a9', '15ab20a9-ad39-48db-b493-991f1d794151', NULL, 'Guanti L', '2', '2025-11-16 22:14:44.356559+00'),
	('23008394-dce6-4388-8d1a-77272a2a5360', 'b67d8c18-3a59-42c0-a9a5-21aafcb9517a', NULL, 'Sfoglia', '1', '2025-11-16 22:14:54.667636+00'),
	('a8430653-1ff4-4b4d-8b9c-4661515e4a91', 'b67d8c18-3a59-42c0-a9a5-21aafcb9517a', NULL, 'Asado', '1', '2025-11-16 22:14:54.667636+00'),
	('24db1656-3252-46c7-bbca-8b5637d7bf77', 'b67d8c18-3a59-42c0-a9a5-21aafcb9517a', NULL, 'Shawarma', '5', '2025-11-16 22:14:54.667636+00'),
	('65fad2dd-a80c-44f5-9adc-3b6105d091fb', 'afab1537-5327-4c77-834b-ac2b6ce7f9ea', NULL, 'Pizza bianca', '1', '2025-11-17 00:23:49.649389+00'),
	('3910527e-aae4-4bb8-a563-7fe6f3203ab2', 'f709495a-e199-40c7-aea1-033c46a2338c', NULL, 'Peperoncino olio', 'Serve', '2025-11-17 22:00:02.631713+00'),
	('74614356-e093-4131-b058-9864cab96dc2', '7cabf187-0725-4e12-b46d-bad1e058b577', NULL, 'Peperoncino olio', 'Serve', '2025-11-17 22:00:08.906096+00'),
	('945ef778-9856-4fe5-a3ad-32d5bb450b60', '78b39e2e-d7a2-47cc-b933-b9d23dcf475a', NULL, 'Peperoncino olio', 'Serve', '2025-11-17 22:01:06.733941+00'),
	('b1c1772a-0f19-44cb-877f-bad727b02422', 'aa74cc32-28e9-4a0c-b3f2-a2fcc28c238b', NULL, 'Peperoncino olio', 'Serve', '2025-11-17 22:01:20.839485+00'),
	('f724eb91-4355-4d16-b952-c2b37e7d5f2e', '993dd022-3e84-4e46-9f54-598defa8d2c6', NULL, 'Peperoncino olio', 'Serve', '2025-11-17 22:03:33.554274+00'),
	('1931a87b-afb3-4895-972d-4b814532674e', 'd04098a7-6110-466b-bd2c-836445e30ab6', NULL, 'Peperoncino olio', '0', '2025-11-17 22:45:47.93571+00'),
	('770490e2-a71f-420d-af25-7ab5c923f322', 'd63f829e-9b69-4428-979a-1a3df15f1b77', NULL, 'Cipolla Bianca', '1', '2025-11-17 22:45:58.173715+00'),
	('a828c617-ae58-433d-ae2f-4faaa16b534c', '3c163081-52d5-4c4b-9fc7-40099f601dd5', NULL, 'Cipolla Rossa', '1', '2025-11-17 22:46:13.589029+00'),
	('7e553eb2-3872-4b3c-8360-9ea97d8a57f7', 'caaf39dc-c5d0-4ec5-97d5-4da03a045fad', NULL, 'Pizza bianca', '1', '2025-11-18 01:09:08.158451+00'),
	('00185cad-1f9f-4f6e-8c44-fc569e1ac41a', 'fb1858ef-7e32-4652-a3ec-0d08e44647e4', NULL, 'Pizza bianca', '1', '2025-11-18 01:09:19.53487+00'),
	('06dd9ddd-1924-40be-874b-bf2935ee926f', 'b4c7a3ee-c88c-401f-9828-c88398765ccf', NULL, 'Pizza bianca', '1', '2025-11-18 01:15:19.217189+00'),
	('71232b33-d702-45a2-897b-84f9a7174e42', '29f00783-faee-456b-83ec-e222c56d04cf', NULL, 'Pizza bianca', '1', '2025-11-18 01:15:48.57255+00'),
	('cfaa202e-c835-4afc-8d93-da5d63930059', '47baf313-f9ab-4d85-a7e2-cdc46dd1a1ca', NULL, 'Pizza bianca', '1', '2025-11-18 01:23:44.580729+00'),
	('771cc5ee-b5fb-4e51-94aa-d1e560fe9fcb', '24c602ab-0aca-4208-8051-927552f3596b', NULL, 'Pizza bianca', '1', '2025-11-18 01:24:18.007577+00'),
	('a769cb10-4b96-441b-ba12-4ee231aeca32', 'd62a87e4-5398-494e-8417-db58756957bf', NULL, 'Shnitzel', '1', '2025-11-18 01:24:43.961035+00'),
	('e475d2bb-4b3c-4bf6-853b-97017cf2f0ec', 'e0545f26-50f8-4e69-85c0-bca478adc1bd', NULL, 'Pizza bianca', '8', '2025-11-18 01:37:44.673784+00'),
	('5fff1898-1cc6-4d58-9785-f4ad61c1393f', '3bf9f78c-5164-4493-aa58-0be3d9a1dd6f', NULL, 'Pizza bianca', '8', '2025-11-18 01:37:55.850411+00'),
	('72c12d37-e264-4501-9b7f-fd2a09989e16', '5ccce817-90eb-42d6-a714-661e7383f6ba', NULL, 'Pizza bianca', '8', '2025-11-18 01:55:42.761162+00'),
	('000879f1-3cfb-4505-9674-7fb7d32d350d', 'c1fe9f8d-8f7f-4481-979b-7db04b3265c7', NULL, 'Pizza bianca', '1', '2025-11-18 01:57:51.686735+00'),
	('78aa32a9-7685-4389-b56f-7d78cb63cb3a', '1fc3a41d-f8fd-405f-aa98-6bccc6b1dbc5', NULL, 'Pizza bianca', '1', '2025-11-18 10:34:07.614477+00'),
	('94df82c7-7b83-44f3-a510-c0c06461f8ee', '78d2a548-da24-49ca-8d14-20a219331bcb', NULL, 'Pizza bianca', '1', '2025-11-18 10:34:54.008772+00'),
	('199fb81a-fb87-433f-99c2-e8da125e69da', '0600a293-5497-491e-87e0-93e879f04cf2', NULL, 'Pizza bianca', '1', '2025-11-18 12:54:45.338915+00'),
	('8fca714e-5a06-4791-9ede-6c842693f543', '544e909a-a859-49dd-a28e-758c5499bded', NULL, 'Peperoncino olio', '1', '2025-11-18 13:47:10.687079+00'),
	('c199731b-610d-4da8-bca8-5dc64ecf07f3', 'b921c62d-e130-42c5-8fd8-2ecdcaa3e9a3', NULL, 'Carne secca', '1', '2025-11-18 16:33:30.358762+00'),
	('7ba345a5-662e-4ddb-92da-d3d5e0a83d4b', '871297e3-d9f8-478b-b8e9-b8bde4d733d8', NULL, 'Pizza bianca', '1', '2025-11-18 17:33:01.529207+00'),
	('ee1bf166-b353-4b30-81ee-e0da93688ed2', 'ae7e4604-b092-4f7b-b0d6-42b321782c5b', NULL, 'Macinato', '1', '2025-11-18 18:03:20.573918+00'),
	('1236c38a-c2fc-484d-9f92-da83fdec874e', '0a6ed695-e359-43af-9d05-b67d45f0c0fd', NULL, 'Maionese BG', '0', '2025-11-18 21:58:26.332449+00'),
	('25e5068a-d660-410a-8687-6bdf63b25b1f', '0a6ed695-e359-43af-9d05-b67d45f0c0fd', NULL, 'Pita', '1', '2025-11-18 21:58:26.332449+00'),
	('4f67decc-395f-45a4-8cdd-bd3eb05710ce', '0a6ed695-e359-43af-9d05-b67d45f0c0fd', NULL, 'Scatola panino', '0', '2025-11-18 21:58:26.332449+00'),
	('f9abb60b-3258-43eb-b150-4bc14e3c578f', '0af8b071-0d9f-407f-8abd-34d713ebc08d', NULL, 'Shnitzel', '15', '2025-11-18 21:58:33.568172+00'),
	('eb4e4850-3b67-4ae6-a7ea-789af4c62d89', '0af8b071-0d9f-407f-8abd-34d713ebc08d', NULL, 'Petti di Pollo', '1', '2025-11-18 21:58:33.568172+00'),
	('ce458264-5740-48d6-a515-235554dad037', '0af8b071-0d9f-407f-8abd-34d713ebc08d', NULL, 'Bocconcini di Pollo', '1', '2025-11-18 21:58:33.568172+00'),
	('d9ed0492-e75d-4a32-a60c-5b7629761375', '0af8b071-0d9f-407f-8abd-34d713ebc08d', NULL, 'Straccetti', '1', '2025-11-18 21:58:33.568172+00'),
	('f6c45e82-77a2-42fe-b67f-d34c59c6fc35', '0af8b071-0d9f-407f-8abd-34d713ebc08d', NULL, 'Pollo crispy', '1', '2025-11-18 21:58:33.568172+00'),
	('8189ac22-2fff-4c79-882f-f2986ae09916', '98770143-97e7-4f21-97d6-5a1cd6582334', NULL, 'Pizza bianca', '1', '2025-11-18 21:58:39.991832+00'),
	('6353fde7-2ce6-47c0-bdaf-5c56add557c5', '644576ea-addc-4006-8252-a2dac268f3a4', NULL, 'Semola Rimacinata', '2', '2025-11-18 21:58:45.995401+00'),
	('742d7bc8-1ec5-4371-bf7c-8524dc53d548', '644576ea-addc-4006-8252-a2dac268f3a4', NULL, 'Rotoli carta', '2', '2025-11-18 21:58:45.995401+00'),
	('e66857a7-4549-413b-a5b5-e4ad0c45a4df', '5f9aa518-ade0-4221-97bd-bf18b7f5f073', NULL, 'Cetrioli', '1', '2025-11-18 22:27:29.468554+00'),
	('fe333010-4fff-4c8a-8407-bbcc09534e86', '5f9aa518-ade0-4221-97bd-bf18b7f5f073', NULL, 'Patate', '5', '2025-11-18 22:27:29.468554+00'),
	('03f9add8-624c-4dfd-a614-0312d7670afb', '6112fa5b-7a7b-492f-a4d6-b532e82fc24e', NULL, 'Asado', '1', '2025-11-18 22:27:41.868748+00'),
	('9206981f-744c-4078-a277-eaa1fb324dc5', '7a007cde-08e7-4dae-8381-5b87c63b3a70', NULL, 'Bomba Piccante', '1', '2025-11-19 14:11:11.080677+00'),
	('6296113d-d5e6-4750-91d9-dbbd55bb5e02', 'd9cf3185-b6fa-40a3-88e6-86400b25b27f', NULL, 'Bomba Piccante', '1', '2025-11-19 14:11:25.301761+00'),
	('8737cc1d-cb2b-4724-94e7-87273c58cbc8', '6836d021-3641-48d9-8dd9-6bee65f153f8', NULL, 'Pizza bianca', '1', '2025-11-19 15:39:38.926147+00'),
	('5a969326-7849-4a0a-b958-1b71468a9585', '2fd97f2f-4821-4f79-992f-1f03d7a9e1d6', NULL, 'Pizza bianca', '1', '2025-11-19 17:05:40.772756+00'),
	('d97d19fa-fd29-4279-bfb8-62929bafdd3a', '86bbbef8-ff15-40b9-b27e-c7c46124d85c', NULL, 'Pizza bianca', '1', '2025-11-19 17:06:14.552918+00'),
	('80627a91-fd46-45e8-87c1-f93b63444296', '5aa7f1d9-97a3-4164-916a-f18fd50c02b2', NULL, 'Cicoria', '1', '2025-11-19 17:06:17.466059+00'),
	('7dc8f4e9-86b6-46de-bec6-edb1b225cbc5', 'bc8f025c-ebfb-47bd-be77-325931a5dc74', NULL, 'Peperoncino olio', '2', '2025-11-19 17:12:03.583042+00'),
	('e0eceabd-c0c2-4985-b25c-2adc354c576a', '28a651bb-15cd-4bc8-8275-2515e63da225', NULL, 'Bresaola', '2', '2025-11-19 17:12:35.654638+00'),
	('977ecd52-5f01-49e3-9cb5-80b24ea9bd59', '2f2ac058-13a1-4ff5-86ee-a2e30a881aee', NULL, 'Salsa Chilly', '2', '2025-11-19 17:12:38.237521+00'),
	('c3fef8c0-72f0-4281-bfcd-de5936551e0c', '2fc7695f-cf75-4260-8408-6cf9f2e5a4af', NULL, 'Pizza bianca', '4', '2025-11-19 17:34:56.593856+00'),
	('d0b7ef30-27a8-46fa-ad7c-8acb828e8971', '3abcf165-ec53-42dd-a521-506f75771988', NULL, 'Sale Bustine', '6', '2025-11-19 17:35:01.866955+00'),
	('594fd473-01c7-460b-bbb9-86d8e16c6d94', 'd5335181-9826-4336-93aa-36414a776596', NULL, 'Pizza bianca', '4', '2025-11-19 17:37:37.395483+00'),
	('f35f55eb-05bc-45e7-9f16-be50d69dae9c', '69a5027a-c35d-4280-83d5-37567b9cbc5e', NULL, 'Macinato', '5', '2025-11-19 17:37:42.019994+00'),
	('f40d9b92-4e15-4cb4-b98e-1e6c3e0fdb56', 'c336d186-0cd1-4a6f-8921-3ecda4aa01cf', NULL, 'Pizza bianca', '4', '2025-11-19 18:55:30.702223+00'),
	('e009b7e7-0d4d-4b6d-9cfa-4fcd67e3f2eb', '2e8ab5b2-0b62-4328-b8e5-ea294c1ff230', NULL, 'Senape', '5', '2025-11-19 18:55:35.032525+00'),
	('9d93380a-d869-4986-9abf-633b0637dbe5', '9ed16e5e-f2f4-4c85-aec1-66588df09fc1', NULL, 'Peperoncino olio', '4', '2025-11-19 18:55:59.954946+00'),
	('beba66a1-bb01-4fdc-97b2-699a87c41335', '832bd04e-42bd-4383-b2d3-41dddac82de9', NULL, 'Bresaola', '4', '2025-11-19 18:56:04.01071+00'),
	('0241614c-39f9-4e29-9305-b44f58baadf5', 'c6e13563-fc4a-4aac-a24a-dba3e639f606', NULL, 'Pizza bianca', '5', '2025-11-19 19:02:34.850371+00'),
	('1143d3f5-c6ef-41a0-9b67-6a3c7ec341ce', '0729479b-f624-4979-99f0-959f522059e9', NULL, 'Crema tartufo', '4', '2025-11-19 19:02:37.047591+00'),
	('45856a06-e642-4ac4-a80f-0451d84acca3', 'f8ea7362-4f2d-4299-b521-2554902ab1bb', NULL, 'Pizza bianca', '3', '2025-11-19 20:17:13.941531+00'),
	('c60b5f67-c38b-414a-83af-f2473860e711', '01442300-79d7-4f51-9780-d5be011b2b3a', NULL, 'Asado', '3', '2025-11-19 20:17:16.497158+00'),
	('b69081c5-e3d9-4655-8a9d-e96a81d081db', 'f5ce4266-c78e-4a45-b3c2-cf05bce4cf89', NULL, 'Songino', '2', '2025-11-19 21:41:01.462135+00'),
	('bc314529-d8ba-4119-96ee-33c5c57d7359', 'f5ce4266-c78e-4a45-b3c2-cf05bce4cf89', NULL, 'Rucola', '2', '2025-11-19 21:41:01.462135+00'),
	('cc5f11d9-720c-47f7-bb57-a6d288fa8969', 'f5ce4266-c78e-4a45-b3c2-cf05bce4cf89', NULL, 'Cavolo Rosso', '2', '2025-11-19 21:41:01.462135+00'),
	('df423841-c43b-41aa-9645-16818fcdbf18', 'f5ce4266-c78e-4a45-b3c2-cf05bce4cf89', NULL, 'Manitoba', '25', '2025-11-19 21:41:01.462135+00'),
	('8852def4-cfb3-4551-8b10-2e1701d9753c', '9c57249e-eecb-42af-9249-fee6051f37b3', NULL, 'Patate', '5', '2025-11-19 21:41:19.972877+00'),
	('24369761-eb69-4a8a-b715-50d1049e2361', '9c57249e-eecb-42af-9249-fee6051f37b3', NULL, 'Lattuga', '5', '2025-11-19 21:41:19.972877+00'),
	('1c7fc06a-7587-479a-97e9-fae880ad605e', 'c4ee7b2c-47db-4dcb-b9df-3dc01e01370f', NULL, 'Bresaola', '0', '2025-11-19 21:41:32.155895+00'),
	('9773c197-0f77-47ae-a015-b64d3ec74a6d', 'c4ee7b2c-47db-4dcb-b9df-3dc01e01370f', NULL, 'Shawarma', '5', '2025-11-19 21:41:32.155895+00'),
	('a4d46468-cca4-4d7f-bed6-081947e82ddc', 'c4ee7b2c-47db-4dcb-b9df-3dc01e01370f', NULL, 'Roast-beef', '0', '2025-11-19 21:41:32.155895+00'),
	('1f05e12f-68d2-4e19-a651-612e31e92209', 'be765c70-2b80-4431-82d2-e85155e4b5f1', NULL, 'Fuselli Panati', '10', '2025-11-19 21:41:39.248584+00'),
	('3a0ae034-27b4-470b-9201-2dc91b73c16d', 'be765c70-2b80-4431-82d2-e85155e4b5f1', NULL, 'Shnitzel', '15', '2025-11-19 21:41:39.248584+00'),
	('2003fcac-7f40-4dad-991c-fa6f195cb7e3', 'be765c70-2b80-4431-82d2-e85155e4b5f1', NULL, 'Francesine', '3', '2025-11-19 21:41:39.248584+00'),
	('5009534a-4550-47e7-8995-15b12d9c01bb', 'be765c70-2b80-4431-82d2-e85155e4b5f1', NULL, 'Bocconcini di Pollo', '3', '2025-11-19 21:41:39.248584+00'),
	('78b5940b-d53a-4286-a593-b5c785851604', 'be765c70-2b80-4431-82d2-e85155e4b5f1', NULL, 'Fettine Panate', '10', '2025-11-19 21:41:39.248584+00'),
	('98a6249e-1313-4e60-bae0-5465f6e06981', 'be765c70-2b80-4431-82d2-e85155e4b5f1', NULL, 'Pulled beef', '5', '2025-11-19 21:41:39.248584+00'),
	('7f2668cb-e733-4e26-99fb-9972fd412244', '871cdc4c-663f-4d61-a2aa-02dc2ffe8f14', NULL, 'Pizza bianca', '1', '2025-11-19 21:41:46.982379+00'),
	('883efb61-1d41-46f5-9600-c49724c52397', '4381e8c9-39a7-4381-b8bc-9e6eebd38c33', NULL, 'Bresaola', '5', '2025-11-19 22:44:42.884699+00'),
	('d1809ec9-08d5-4452-8b8f-157614c92a14', '8a19b6e5-e1ee-48a9-a543-7a6669d91ce9', NULL, 'Sale Bustine', '5', '2025-11-19 23:30:45.309858+00'),
	('afa4631d-4d7c-4909-8b23-9d350723438e', 'cc0502fe-ea1b-4c58-b712-4fb2369c54f6', NULL, 'Pizza bianca', '1', '2025-11-20 01:13:43.426242+00'),
	('26bc3b7b-45d5-4ba1-8f83-1406348fe7cc', '5b1cd51d-5748-4638-a7b0-e08579533e13', NULL, 'Pizza bianca', '1', '2025-11-20 02:36:48.079647+00'),
	('6e4cc774-c170-403c-bbdb-d018765e211f', '66eff3b5-3aae-417a-b695-a686f5e0b311', NULL, 'Sale Bustine', '3', '2025-11-20 18:35:37.839836+00'),
	('224b63d3-6ba4-439d-a206-edca63898928', '9ba7cad7-dce0-4dbb-bc7a-aae74f8dd588', NULL, 'Bomba Piccante', '2', '2025-11-20 18:35:40.609126+00'),
	('0fb4150a-ba05-4483-85c1-755bb8ba85db', '934a9280-5cbb-4465-802b-211b1016ac96', NULL, 'Cicoria', '2', '2025-11-20 21:07:38.819076+00'),
	('05e6b485-f6dd-4b4b-865d-902f0001ce94', '2895553f-ba12-4db6-bdb6-a5df757a9c31', NULL, 'Asado', '1', '2025-11-20 21:07:48.470001+00'),
	('da29ff9f-d393-4bbe-981b-f86b37814bc9', '01a8fc77-30dd-4e32-ab6b-24aade59ad6f', NULL, 'Pizza bianca', '2', '2025-11-20 21:07:55.249309+00'),
	('46855971-ffea-4953-a1de-72b1b9d0af98', '33477fce-e43d-4c99-ad9c-592f28aa5ae7', NULL, 'Fuselli Panati', '5', '2025-11-20 21:08:01.654973+00'),
	('bee9bfe9-d3e5-4b57-ab7d-a048ba9a133d', '33477fce-e43d-4c99-ad9c-592f28aa5ae7', NULL, 'Shnitzel', '15', '2025-11-20 21:08:01.654973+00'),
	('d87ec9cd-5f64-423a-a3b0-ab380072e48d', '33477fce-e43d-4c99-ad9c-592f28aa5ae7', NULL, 'Fettine Panate', '5', '2025-11-20 21:08:01.654973+00'),
	('0d15d331-6763-4a56-b295-c295836aa4e5', '33477fce-e43d-4c99-ad9c-592f28aa5ae7', NULL, 'Straccetti', '1', '2025-11-20 21:08:01.654973+00'),
	('366d4459-8572-4709-a4d1-eebb3f30065c', '33477fce-e43d-4c99-ad9c-592f28aa5ae7', NULL, 'Pollo crispy', '0', '2025-11-20 21:08:01.654973+00'),
	('2220d1fd-745f-4164-98d7-f2a74d0f4327', '244f253a-8945-46be-9083-f5eab929363f', NULL, 'Bomba Piccante', '0', '2025-11-20 21:08:08.816601+00'),
	('955f1898-0849-4096-9009-cf189b8eaf6e', '2af5626c-5407-443e-a20e-4978431a431e', NULL, 'Pizza bianca', '2', '2025-11-21 17:39:16.920721+00'),
	('d30766c8-b1d0-41e1-a1d5-deccfd33d537', 'a2f2bd46-0926-4027-95b1-a02bdfdbd1b2', NULL, 'Fettine Panate', '6', '2025-11-21 17:39:28.650759+00'),
	('7b9776b5-2547-4a62-a702-1712f0b486a2', '815629f1-f929-4327-b0b0-135b2bd221bd', NULL, 'Pepe Bustine', '2', '2025-11-21 17:39:41.333346+00'),
	('a98a0e4d-6ba7-4cf7-96ac-7a89cab912aa', 'c56dbb16-556d-4008-930d-b5683a1bfbc1', NULL, 'Maionese BG', '3', '2025-11-21 18:07:00.864659+00'),
	('d8c15dc5-aa18-40d2-9283-642658af0a25', 'b5bdaacc-3497-45a0-8df0-2fb9d8226b52', NULL, 'Bresaola', '7', '2025-11-21 18:07:10.121884+00'),
	('e2b0b64d-db39-4beb-8ada-8e495ba0bdc7', '48a3779f-6816-407c-ac0c-91ae543a7a86', NULL, 'Grappolo', '3', '2025-11-21 19:11:43.269307+00'),
	('2f430226-a900-496a-a657-4e68c1afe4a4', '3b6937f1-7c29-4a56-afa4-c9fb984e6a7f', NULL, 'Carne secca', '2', '2025-11-21 19:11:56.767325+00'),
	('55ea0bf4-db8a-4ed8-a4bb-8014c0d9b6ca', 'df84d05b-8039-4aaf-9d86-480506652f5a', NULL, 'Pita', '1', '2025-11-23 23:16:50.078377+00'),
	('8958f2c5-e992-4fd5-a144-a24f92729196', 'df84d05b-8039-4aaf-9d86-480506652f5a', NULL, 'Cheddar', '2', '2025-11-23 23:16:50.078377+00'),
	('97357ab9-bef4-4748-a8fc-358dec22887d', 'aefed5cf-532a-475a-af4d-4adfab27ce84', NULL, 'Fuselli Panati', '6', '2025-11-23 23:16:58.121465+00'),
	('9e8fbd4e-fd1e-4b68-95aa-5c0d703dc02b', 'aefed5cf-532a-475a-af4d-4adfab27ce84', NULL, 'Fettine Panate', '10', '2025-11-23 23:16:58.121465+00'),
	('4dbf622d-8987-48c9-a033-4851117b82b4', 'aefed5cf-532a-475a-af4d-4adfab27ce84', NULL, 'Pollo crispy', '1', '2025-11-23 23:16:58.121465+00'),
	('3f6095bd-441e-42ce-874d-129493419b96', 'aefed5cf-532a-475a-af4d-4adfab27ce84', NULL, 'Pulled beef', '5', '2025-11-23 23:16:58.121465+00'),
	('4a90d359-7e3e-4a89-b6d7-fe37145db533', '1fe4e682-5d4e-400f-8076-d7a2dba32447', NULL, 'Pizza bianca', '1', '2025-11-23 23:17:09.967008+00'),
	('3a413dfd-8fc8-409d-9422-ff9aa9260b12', '4726311a-f1f6-46d1-b7fb-7eeab77c3cf3', NULL, 'Manitoba', '25', '2025-11-23 23:17:19.608617+00'),
	('57e414b1-b0fc-4cbd-b26b-34974025468d', '126fb7e0-5eae-4525-a19d-2dafa6ef1cab', NULL, 'Grappolo', '1', '2025-11-23 23:17:40.904086+00'),
	('6bb42af2-3595-467d-96f6-d912a743b81a', '126fb7e0-5eae-4525-a19d-2dafa6ef1cab', NULL, 'Patate', '5', '2025-11-23 23:17:40.904086+00'),
	('e3d79c63-ac99-4dea-a47e-b120b54700be', '2e5fcd8c-f38c-4393-bb84-eb53c9330657', NULL, 'Shawarma', '5', '2025-11-23 23:17:50.562886+00'),
	('f7d6678f-e960-40bb-80e5-1e11d473e7ac', 'fc763b09-49f1-419f-8d63-0bbaa910830f', NULL, 'Porchetta', '2', '2025-11-24 01:50:15.135657+00'),
	('b12ab826-4bf9-4701-943b-a2eb12f2a4dc', 'e8a32a79-0bdd-4eac-aa4f-45cadf5b4114', NULL, 'Pizza bianca', '3', '2025-11-24 01:50:19.090061+00'),
	('9fc9832d-de50-41d9-b7b9-cddd1632fe2a', '2a25833a-32ef-46ea-83b5-f22df6667de0', NULL, 'Porchetta', '2', '2025-11-24 01:56:20.580451+00'),
	('4509f176-7be2-4f18-b614-f2f19b1f1870', '7cc3213b-52e5-45b5-9c16-d9ca234678ea', NULL, 'Pizza bianca', '3', '2025-11-24 01:56:25.819604+00'),
	('9784ec0a-0501-4be2-a5d7-ea44ba65570e', '9e745ca5-0fce-4a7d-902e-c490f4960d59', NULL, 'Pulled Beef', '1', '2025-11-24 11:05:48.373513+00'),
	('6d97637a-4a77-4bdd-802e-4ce0e62ec96a', 'e83fc2fa-2bbc-40bf-98fa-68ed48cd56dd', NULL, 'Pizza bianca', '2', '2025-11-24 11:05:57.892362+00'),
	('bb03188f-23e6-4e40-b4a0-bf393cdbc76d', 'bd9f6df9-db7a-4352-a954-984225560996', NULL, 'Pizza bianca', '4', '2025-11-24 15:59:59.950542+00'),
	('12db1496-f758-45de-a46c-859131fa39d9', 'e7dc77cd-c926-46e6-a902-5037bf2bfe11', NULL, 'Shnitzel', '1', '2025-11-24 16:00:03.941224+00'),
	('4f376ace-4372-403f-b197-96d6d1cda843', 'e7dc77cd-c926-46e6-a902-5037bf2bfe11', NULL, 'Macinato', '2', '2025-11-24 16:00:03.941224+00'),
	('7ad6431e-f488-4aba-aaa8-8beca5ce5468', 'baebb9e2-2a94-4bc0-9778-b5d0f2789826', NULL, 'Peperoncino olio', '4', '2025-11-24 16:00:06.44748+00'),
	('7eedba25-bd72-41a0-b623-4beadef27d8e', 'e0de79b9-3eff-45a4-8f09-b19a753d32f5', NULL, 'Pizza bianca', '1', '2025-11-24 21:43:30.75066+00'),
	('dfde055f-f8f5-4ac1-b098-31eb8945ac29', 'f57921e5-067f-4866-ba5c-00e138177405', NULL, 'Goldstar', '0', '2025-11-24 21:43:37.835806+00'),
	('2667e280-bb94-471f-9a46-11181e0d1e8a', 'f57921e5-067f-4866-ba5c-00e138177405', NULL, 'Scatola panino', '0', '2025-11-24 21:43:37.835806+00'),
	('64491cd8-bb59-4cc1-a108-feff0775b598', 'f57921e5-067f-4866-ba5c-00e138177405', NULL, 'Busta SF', '0', '2025-11-24 21:43:37.835806+00'),
	('b9377192-3822-41de-9211-c65a83ad3c65', 'f7b4c110-c57f-4981-8331-bac302a19d38', NULL, 'Francesine', '3', '2025-11-24 21:43:46.545667+00'),
	('7d7e0dab-d0ea-4b5f-8b0e-de25897d6ca9', 'f7b4c110-c57f-4981-8331-bac302a19d38', NULL, 'Straccetti', '1', '2025-11-24 21:43:46.545667+00'),
	('9280ba53-1773-403c-b8fd-cfc8f141d8d8', 'bc2cae0c-1770-4a74-8e58-c385266b6222', NULL, 'Rucola', '2', '2025-11-24 21:43:59.749392+00'),
	('76c5e384-601c-47f8-8beb-39516af075f9', '45b440f2-6491-4375-9c59-b86569ca815e', NULL, 'Sfoglia', '1', '2025-11-24 21:44:08.045768+00'),
	('1d3509de-e8ae-4d48-a7d4-40a03f559a1a', 'b9dd5122-9a99-48c3-ab67-236ae564003b', NULL, 'Lattuga', '4', '2025-11-24 21:44:15.01558+00'),
	('11b1c7d0-79f9-4d6c-b2a5-4d106966fc7b', 'b65f83a6-664a-4a14-8e63-adaf750d1aa9', NULL, 'Pizza bianca', '1', '2025-11-25 12:30:31.16935+00'),
	('5e30e145-24a3-4126-bd26-45f754ab79e5', '38ab057a-b313-404c-a00e-66617b3ee891', NULL, 'Pastrami', '0', '2025-11-25 21:32:39.47846+00'),
	('1e385783-3fe5-48de-bcf3-2049d616406c', '38ab057a-b313-404c-a00e-66617b3ee891', NULL, 'BBQ', '0', '2025-11-25 21:32:39.47846+00'),
	('2e158036-75bf-401b-8e5e-2268d05c5121', '7a5eff14-1487-44d1-9325-896e75032fbf', NULL, 'Shnitzel', '10', '2025-11-25 21:32:46.794287+00'),
	('cc3668c8-0949-46c5-9af4-aeb40f37e0b6', '7a5eff14-1487-44d1-9325-896e75032fbf', NULL, 'Fuselli Panati', '6', '2025-11-25 21:32:46.794287+00'),
	('f4177609-0908-4ae8-88d3-73859a04dfe5', '4305b9eb-d7e3-4d86-a05c-7f3ce5ba3089', NULL, 'Rotoli carta', '2', '2025-11-25 21:32:53.738948+00'),
	('188909fd-cb4f-4c6d-8413-d1e7fb8419c1', 'd4fea80d-b356-4d07-86c3-a6aa76fd495f', NULL, 'Pizza bianca', '1', '2025-11-25 21:33:12.379612+00'),
	('fe5474bd-d2a1-48cb-823a-eecbf71f7d7d', 'aecb728c-0747-4103-9f45-b0c4a9536bfc', NULL, 'BBQ', '0', '2025-11-26 22:04:39.020108+00'),
	('28edaeb8-b9c9-47bf-ac5b-df4e9089bae8', 'aecb728c-0747-4103-9f45-b0c4a9536bfc', NULL, 'Bomba Piccante', '0', '2025-11-26 22:04:39.020108+00'),
	('505d9a23-8a34-41ee-82f6-34fac011a713', 'c1553b67-3290-4cff-b6f2-731f32325a8b', NULL, 'Carne secca', '0', '2025-11-26 22:04:48.125313+00'),
	('c4000a1b-b7a3-4595-8b5e-5823495f2893', '9189bc23-25e1-4f87-a60f-86f89b3cee7c', NULL, 'Straccetti', '1', '2025-11-26 22:05:00.121913+00'),
	('a9b82cb7-89f5-4122-8028-1cbe9a6bdf08', '9189bc23-25e1-4f87-a60f-86f89b3cee7c', NULL, 'Petti di Pollo', '1', '2025-11-26 22:05:00.121913+00'),
	('402611ff-95a5-4e04-be57-aeea03cb80de', '9189bc23-25e1-4f87-a60f-86f89b3cee7c', NULL, 'Pollo crispy', '0', '2025-11-26 22:05:00.121913+00'),
	('eb7048e8-54d2-49c1-9d13-b632eb1d858d', 'c0b7acbd-34bb-4416-b8da-5ff4da2187f0', NULL, 'Pizza bianca', '1', '2025-11-26 22:05:11.009828+00'),
	('aeb4d57d-acbb-448b-8bb0-07d9c436f16b', 'c3b6e25e-d210-4a73-afb0-0c2a43e0ad56', NULL, 'Cicoria', '2', '2025-11-26 22:05:18.011095+00'),
	('9c8b4a42-4fc3-4c4d-b79a-494545e5d90f', 'b20523a0-8b3b-412c-8e07-8995b1deef82', NULL, 'Guanti L', '2', '2025-11-26 22:05:30.485824+00'),
	('e741febf-992d-4d8f-a298-7fdfdaa981de', 'b20523a0-8b3b-412c-8e07-8995b1deef82', NULL, 'Rucola', '2', '2025-11-26 22:05:30.485824+00'),
	('61a01e0d-4bb4-4522-a06b-76f3b7d547bc', 'b20523a0-8b3b-412c-8e07-8995b1deef82', NULL, 'Rotoli carta', '2', '2025-11-26 22:05:30.485824+00'),
	('ede2910b-056c-444c-8f76-365fe1816e0e', 'b20523a0-8b3b-412c-8e07-8995b1deef82', NULL, 'Cipolla Rossa', '2', '2025-11-26 22:05:30.485824+00'),
	('94b1f44c-f80f-4336-a746-9b604e06f5ba', 'b20523a0-8b3b-412c-8e07-8995b1deef82', NULL, 'Lavapavimenti', '2', '2025-11-26 22:05:30.485824+00'),
	('8041b41c-ec92-41c5-9430-982f20123418', 'b20523a0-8b3b-412c-8e07-8995b1deef82', NULL, 'Sapone Piatti', '2', '2025-11-26 22:05:30.485824+00'),
	('bf0a6a28-076f-4cf1-8610-3acce0e904a1', '39b3a363-af9b-4243-96b5-08b795726a4a', NULL, 'Maionese BG', '55', '2025-11-27 02:05:42.927742+00'),
	('6ac5b3b5-f51c-471d-8eb7-434af599d7e9', 'bb318d9a-8d11-4a0b-a810-a98b62a73cd0', NULL, 'Macinato', '0', '2025-11-27 04:25:35.625728+00'),
	('bb2667d1-5c3b-4ac0-89f7-583e05de933d', 'e63c4d25-c2d4-4082-8fc2-b00f89264853', NULL, 'Pizza bianca', '7', '2025-11-27 04:53:07.26296+00'),
	('66741e88-fa62-4eb0-9843-fec6ec9defc8', '5bc6385a-08b5-4431-83f7-dd18763f5d6d', NULL, 'Pizza bianca', '0', '2025-11-27 05:36:09.569401+00'),
	('991af779-3846-4d0d-bbf2-b24d55c061c0', 'ac873ff7-a5d4-4840-afbc-a39998ab77fa', NULL, 'Shnitzel', '15', '2025-11-27 22:10:27.231845+00'),
	('cc961bb1-f038-45ac-af61-1a2f88eab4b0', 'ac873ff7-a5d4-4840-afbc-a39998ab77fa', NULL, 'Fuselli Panati', '10', '2025-11-27 22:10:27.231845+00'),
	('80ec27fa-6078-420a-ae99-b6f93fbba5b8', 'ac873ff7-a5d4-4840-afbc-a39998ab77fa', NULL, 'Fettine Panate', '10', '2025-11-27 22:10:27.231845+00'),
	('1f31e46d-71e9-4718-860b-7d31a6728c3b', 'ac873ff7-a5d4-4840-afbc-a39998ab77fa', NULL, 'Pollo crispy', '1', '2025-11-27 22:10:27.231845+00'),
	('5dce567c-c98b-4fbd-bf70-ee6befcca08c', 'ac873ff7-a5d4-4840-afbc-a39998ab77fa', NULL, 'Pulled beef', '5', '2025-11-27 22:10:27.231845+00'),
	('a56a5379-62b3-4bc7-8fa4-711d7aba38a3', 'ac873ff7-a5d4-4840-afbc-a39998ab77fa', NULL, 'Bocconcini di Pollo', '2', '2025-11-27 22:10:27.231845+00'),
	('b29f4cc4-f2c2-41fe-9175-619feb09f9dc', '09fd7137-cf70-4c47-a13d-d64374c6d546', NULL, 'Pizza bianca', '2', '2025-11-27 22:10:35.657896+00'),
	('8ab10f03-5bba-49a9-aefd-c501cfc170ce', '1b3b5153-f098-4cf8-8de6-b7d0450fb6f0', NULL, 'Patate', '5', '2025-11-27 22:10:42.407786+00'),
	('18390fbf-429e-432d-a5ff-b5adc239d7b1', '15240c47-9775-411b-a897-c3af8040f6a4', NULL, 'Pizza bianca', '1', '2025-11-29 22:17:08.743875+00'),
	('08ad4202-3024-40d9-838c-64f9507bf7bc', 'c70a596f-af04-4262-94bc-e6519485baaf', NULL, 'Rotoli carta', '2', '2025-11-29 22:17:16.376024+00'),
	('824d4260-5d5d-4ad6-b529-490eefaa97dd', 'c70a596f-af04-4262-94bc-e6519485baaf', NULL, 'Tovaglioli neri 24x24', '1', '2025-11-29 22:17:16.376024+00'),
	('580a1046-5486-4841-aafc-35ed26b89cd5', 'c70a596f-af04-4262-94bc-e6519485baaf', NULL, 'Manitoba', '25', '2025-11-29 22:17:16.376024+00'),
	('0f292d36-05c2-4be8-a5b6-6a9f15227db9', 'c70a596f-af04-4262-94bc-e6519485baaf', NULL, 'Semola Rimacinata', '4', '2025-11-29 22:17:16.376024+00'),
	('68efe419-d0b3-418a-8955-6a68840bd7e0', 'c70a596f-af04-4262-94bc-e6519485baaf', NULL, 'Songino', '2', '2025-11-29 22:17:16.376024+00'),
	('cdc1bb57-37c7-4d6f-b4f5-1953b29029fc', 'c70a596f-af04-4262-94bc-e6519485baaf', NULL, 'Rucola', '2', '2025-11-29 22:17:16.376024+00'),
	('b2a249a5-578a-4e43-8b0e-785b289dc8ac', 'e319f972-3a6d-4634-b06c-4ef97357b68a', NULL, 'Pizza bianca', '1', '2025-11-30 23:09:10.381161+00'),
	('6dcc214e-9e3a-4d45-ac22-ab09542268b1', '5fd1c0c1-417c-49ff-8de1-b56dae92a593', NULL, 'Scatola panino', '0', '2025-11-30 23:09:18.45316+00'),
	('6ee050cd-6972-409f-8f4d-04dc0510d31a', '5fd1c0c1-417c-49ff-8de1-b56dae92a593', NULL, 'Satola sfizi', '0', '2025-11-30 23:09:18.45316+00'),
	('9d3affc5-cf8c-4990-8667-caf1905abbc9', '5fd1c0c1-417c-49ff-8de1-b56dae92a593', NULL, 'Ketchup', '0', '2025-11-30 23:09:18.45316+00'),
	('cebd584a-b594-4ed4-b9a8-33eef8637171', '5fd1c0c1-417c-49ff-8de1-b56dae92a593', NULL, 'Maionese BG', '0', '2025-11-30 23:09:18.45316+00'),
	('68c40dc3-3a37-4a5d-847b-2b027f94e687', '5fd1c0c1-417c-49ff-8de1-b56dae92a593', NULL, 'Pomodoro barattolo', '0', '2025-11-30 23:09:18.45316+00'),
	('682aac7d-2458-4c41-82da-0e926d8bf265', '5fd1c0c1-417c-49ff-8de1-b56dae92a593', NULL, 'Goldstar', '0', '2025-11-30 23:09:18.45316+00'),
	('83a05c94-3c8d-47f2-9694-8e2cf6af17c9', '5fd1c0c1-417c-49ff-8de1-b56dae92a593', NULL, 'Cetriolini', '0', '2025-11-30 23:09:18.45316+00'),
	('914e3eea-c4cf-4698-b4bb-f216517d40d5', '65b73ca8-677a-4ab8-bee3-09d9f8bc7d8a', NULL, 'Petti di Pollo', '1', '2025-11-30 23:09:26.952342+00'),
	('d7aaa10d-106f-4b20-8be6-144e7ce46221', '65b73ca8-677a-4ab8-bee3-09d9f8bc7d8a', NULL, 'Fuselli Panati', '4', '2025-11-30 23:09:26.952342+00'),
	('1d16d593-6b10-43c3-9b83-dff10517d739', '65b73ca8-677a-4ab8-bee3-09d9f8bc7d8a', NULL, 'Fettine Panate', '6', '2025-11-30 23:09:26.952342+00'),
	('8173d347-81d2-4f8b-ae71-9bce88638bb7', '72b3275a-dbd3-4cd3-a175-1ae96944cd37', NULL, 'Guanti L', '2', '2025-11-30 23:09:35.578321+00'),
	('c1d55b98-016f-4128-a8b0-4fdc3b2df93f', '72b3275a-dbd3-4cd3-a175-1ae96944cd37', NULL, 'Cavolo Rosso', '2', '2025-11-30 23:09:35.578321+00'),
	('128d7dba-0863-4a92-b0fb-f3fd10f30a69', 'ec195217-582a-4843-b7ad-b73443bf614b', NULL, 'Patate', '5', '2025-11-30 23:10:00.965687+00'),
	('35d564c4-7af9-45e5-ae6e-f40dbebd19c1', '30011c3d-3d5e-45df-a55d-324b8a531b7a', NULL, 'Pizza bianca', '5', '2025-12-01 14:06:31.874709+00'),
	('85dd7ad6-5950-4465-858d-7885f54b1b32', '5eecdd77-b692-4d20-a28d-dfed53f240ef', NULL, 'Shnitzel', '6', '2025-12-01 14:06:54.562654+00'),
	('d7be0688-5a09-48b9-80cc-cc31cda109d7', 'f9388d90-163e-4b7a-a650-8372cd14e73c', NULL, 'Pizza bianca', '7', '2025-12-01 14:08:08.433398+00'),
	('58f18919-28fd-4e73-bd16-29e26666802a', '25976a97-4c4c-45d7-b521-839e8792d55a', NULL, 'Pizza bianca', '8', '2025-12-01 14:09:00.699593+00'),
	('8a45f59a-69c3-4566-8e6d-d49e683f61bf', '77a1f859-1983-4ec6-8916-3ae1c7b34069', NULL, 'Pizza bianca', '3', '2025-12-01 14:12:09.403098+00'),
	('0b427d3b-f3f6-4e5d-988b-ad2fcf747911', '250eece7-078b-42f5-ab45-f201f447d72b', NULL, 'Pizza bianca', '6', '2025-12-01 14:14:21.546491+00'),
	('f6e3bf5a-fd86-4d4b-8475-37341eb377db', '0296cba1-e0f7-4e38-bece-e64bbe356ca6', NULL, 'Pizza bianca', '8', '2025-12-02 00:11:49.142091+00'),
	('1592a5dc-dc25-4fdd-b52e-138f46285657', '0963d40c-53d9-47fe-96f8-1483b69b40a8', NULL, 'Sfoglia', '6', '2025-12-02 00:11:52.28647+00');


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."permissions" ("id", "name", "description") VALUES
	('d57a696d-7ce8-4778-aa5c-df6680dd7fe2', 'orders:send', 'Can send immediate orders'),
	('8164cb3f-ce1f-4497-8778-2b7fb001c3b7', 'orders:schedule', 'Can schedule future orders'),
	('20755b23-8197-4a94-bd8d-3b16d90806f9', 'orders:view_all_history', 'Can view all orders history (otherwise only their own)'),
	('789248d3-aef6-438b-a5d0-95ebafd60bc0', 'suppliers:manage', 'Can create/edit/delete suppliers'),
	('e95e69b1-cfb8-4c1a-9818-3b6e5e519422', 'analytics:view', 'Can view dashboard/statistics'),
	('d878a1bb-a3b8-4389-a464-e5934fe363cb', 'settings:view', 'Can access settings page'),
	('eaef565d-ed1d-4816-ad3a-1656d3116a5c', 'profiles:manage', 'Can manage profiles and permissions (OWNER only)');


--
-- Data for Name: profile_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."profile_permissions" ("profile_id", "permission_id") VALUES
	('3b9a2f1f-2754-4925-b188-feff643bd8e0', 'eaef565d-ed1d-4816-ad3a-1656d3116a5c'),
	('0d3e180a-8a01-4ec8-9941-5f92bb162103', 'eaef565d-ed1d-4816-ad3a-1656d3116a5c'),
	('7aa3e75d-8fe4-49a4-974d-20f673621606', 'eaef565d-ed1d-4816-ad3a-1656d3116a5c'),
	('dbe57273-b05b-4486-8991-0563bb2e602e', 'd57a696d-7ce8-4778-aa5c-df6680dd7fe2'),
	('dbe57273-b05b-4486-8991-0563bb2e602e', '8164cb3f-ce1f-4497-8778-2b7fb001c3b7'),
	('dbe57273-b05b-4486-8991-0563bb2e602e', '20755b23-8197-4a94-bd8d-3b16d90806f9'),
	('dbe57273-b05b-4486-8991-0563bb2e602e', '789248d3-aef6-438b-a5d0-95ebafd60bc0'),
	('dbe57273-b05b-4486-8991-0563bb2e602e', 'e95e69b1-cfb8-4c1a-9818-3b6e5e519422'),
	('dbe57273-b05b-4486-8991-0563bb2e602e', 'd878a1bb-a3b8-4389-a464-e5934fe363cb'),
	('53ee25b9-c461-4ab4-893b-fb3a4e4dd1b8', '20755b23-8197-4a94-bd8d-3b16d90806f9'),
	('53ee25b9-c461-4ab4-893b-fb3a4e4dd1b8', '8164cb3f-ce1f-4497-8778-2b7fb001c3b7'),
	('147715a0-d234-459a-933a-483244a26776', '20755b23-8197-4a94-bd8d-3b16d90806f9'),
	('147715a0-d234-459a-933a-483244a26776', '789248d3-aef6-438b-a5d0-95ebafd60bc0'),
	('147715a0-d234-459a-933a-483244a26776', '8164cb3f-ce1f-4497-8778-2b7fb001c3b7'),
	('147715a0-d234-459a-933a-483244a26776', 'd57a696d-7ce8-4778-aa5c-df6680dd7fe2'),
	('147715a0-d234-459a-933a-483244a26776', 'd878a1bb-a3b8-4389-a464-e5934fe363cb'),
	('147715a0-d234-459a-933a-483244a26776', 'e95e69b1-cfb8-4c1a-9818-3b6e5e519422'),
	('147715a0-d234-459a-933a-483244a26776', 'eaef565d-ed1d-4816-ad3a-1656d3116a5c'),
	('3b9a2f1f-2754-4925-b188-feff643bd8e0', 'd57a696d-7ce8-4778-aa5c-df6680dd7fe2'),
	('3b9a2f1f-2754-4925-b188-feff643bd8e0', '8164cb3f-ce1f-4497-8778-2b7fb001c3b7'),
	('3b9a2f1f-2754-4925-b188-feff643bd8e0', '20755b23-8197-4a94-bd8d-3b16d90806f9'),
	('3b9a2f1f-2754-4925-b188-feff643bd8e0', '789248d3-aef6-438b-a5d0-95ebafd60bc0'),
	('3b9a2f1f-2754-4925-b188-feff643bd8e0', 'e95e69b1-cfb8-4c1a-9818-3b6e5e519422'),
	('3b9a2f1f-2754-4925-b188-feff643bd8e0', 'd878a1bb-a3b8-4389-a464-e5934fe363cb'),
	('7aa3e75d-8fe4-49a4-974d-20f673621606', 'd57a696d-7ce8-4778-aa5c-df6680dd7fe2'),
	('7aa3e75d-8fe4-49a4-974d-20f673621606', '8164cb3f-ce1f-4497-8778-2b7fb001c3b7'),
	('7aa3e75d-8fe4-49a4-974d-20f673621606', '20755b23-8197-4a94-bd8d-3b16d90806f9'),
	('7aa3e75d-8fe4-49a4-974d-20f673621606', '789248d3-aef6-438b-a5d0-95ebafd60bc0'),
	('7aa3e75d-8fe4-49a4-974d-20f673621606', 'e95e69b1-cfb8-4c1a-9818-3b6e5e519422'),
	('7aa3e75d-8fe4-49a4-974d-20f673621606', 'd878a1bb-a3b8-4389-a464-e5934fe363cb'),
	('0d3e180a-8a01-4ec8-9941-5f92bb162103', 'd57a696d-7ce8-4778-aa5c-df6680dd7fe2'),
	('0d3e180a-8a01-4ec8-9941-5f92bb162103', '8164cb3f-ce1f-4497-8778-2b7fb001c3b7'),
	('0d3e180a-8a01-4ec8-9941-5f92bb162103', '20755b23-8197-4a94-bd8d-3b16d90806f9'),
	('0d3e180a-8a01-4ec8-9941-5f92bb162103', '789248d3-aef6-438b-a5d0-95ebafd60bc0'),
	('0d3e180a-8a01-4ec8-9941-5f92bb162103', 'e95e69b1-cfb8-4c1a-9818-3b6e5e519422'),
	('0d3e180a-8a01-4ec8-9941-5f92bb162103', 'd878a1bb-a3b8-4389-a464-e5934fe363cb');


--
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."profiles" ("id", "updated_at", "first_name", "last_name", "role", "is_approved", "is_admin", "company_id", "onboarding_completed") VALUES
	('7b4b20cc-a236-4766-9680-59d917b8f5eb', '2025-09-25 14:49:42.706725+00', 'Alessandro', 'Di Porto', 'zitto coglione', true, true, '03d15439-51ea-4166-8e85-2c84fd16080d', true),
	('c23a8c58-925a-47ce-9491-9e0db8b5c16a', '2025-09-22 12:17:07.138552+00', 'Ruben', 'Ouazana', 'Direttore', true, true, 'b4e74a2c-ad72-4635-a77c-c4a8cd0f57ec', true),
	('8a233ec1-9d01-47d9-9f2e-a40814138c44', '2025-11-23 22:04:30.914652+00', 'Alberto', 'Ouazana', 'Proprietario', false, false, 'ae85980a-571a-4a63-8039-387d55fbd3fd', true),
	('7c263c3e-11b2-468e-a74d-98910c429842', '2025-09-25 14:52:43.048269+00', NULL, NULL, NULL, false, false, 'fca229ba-bd84-466f-a75b-e229c81cf177', false),
	('b0dfdcee-ff52-4efd-9ed5-6452f98945fe', '2025-10-13 18:28:06.790819+00', NULL, NULL, NULL, false, false, '9effd27d-2c09-4cf8-8f75-1be4e706b568', false);


--
-- Data for Name: push_subscriptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."push_subscriptions" ("id", "user_id", "subscription", "created_at") VALUES
	(1, 'b0dfdcee-ff52-4efd-9ed5-6452f98945fe', '{"keys": {"auth": "0-sDGTHQ4aRfhv3HjltsmQ", "p256dh": "BPJQFyMP7HfyjQ18vtTJbwTvg6KXelZ2sup6ocKZOS-msH-Cll_FrvOC1FDOpPfONZjMsOmotIQqYQXejAgr2lU"}, "endpoint": "https://web.push.apple.com/QInEydmthOf4GRZQZwgJUyun9htwxQUnwbfhODdtYLNMYOMNJQdsm4cf1ruCwPEOuWbkGu9enf16rpVMjAOepyAFZDN3DbUn1s4Htbgh59vU7IB37iWVnQzjcxWgd0Dzo8tgha6CwkOESPuYP3VyL7lZl_OsW3GsKBfGHUmd5ZY", "expirationTime": null}', '2025-11-20 18:03:05.704975+00'),
	(2, 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '{"keys": {"auth": "T-VluCxi8clX3p-ZpUndnw", "p256dh": "BNOoMUQaXFUhzd3nGhCOX-A0rQXD9YGxefaqpBGLFOovHOYWycYOqk9TGIOM399PEz5_FUgf2yeUbq8cohaBTRM"}, "endpoint": "https://web.push.apple.com/QFlbRe8ICEzazywIwPpZtd65dVAyf6S_IEbCFwSgMt4EPJJ9gVVCBcUZlvKhzM8wcOmmOr46IXe9jLsHiI4GhQjeITn8YePCDc7hXrCL6eHUzzXLEqGzQ7RRXODnvXHx8-5BIxO4LxPAOKvK-tKyMbD7VxVW1yCDIEBseuhWk7A", "expirationTime": null}', '2025-11-20 18:03:05.704975+00'),
	(3, 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '{"keys": {"auth": "-HnQRjp5SKtChAzcsuPXTQ", "p256dh": "BKVp3lgUVHiP1O_zqbzb_DtGXxWf98TYgu7ZWXFbMFC7O-QmnUm-0LO8LmeUseQ_9lwVodg1aGtxs9IDW8M-e90"}, "endpoint": "https://fcm.googleapis.com/fcm/send/ePmQ6t_AG1k:APA91bEdneqJxTlq0Eb_WkYFToomBZEMQyq2-catNi4-sVUL_79IVK_THpG1VKI_CobrqJib5B4Gtv35Fr_bucWEUaFt2Df0jrhihbPiniwQ8yl6RUhkUmHtqGqa2VwTnwYzBF8uWk4I", "expirationTime": null}', '2025-11-20 18:04:54.390335+00'),
	(7, 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '{"keys": {"auth": "-oEbZ6KtLMllfdT6UVF5vw", "p256dh": "BNrUDSo1RW1LskYX7wOwaX1RkNnRfv7jc31N0kRzawVbWf3faNEWEIVyeUGUg1HohgFI2YcI8uWPYE4tLe_eXrE"}, "endpoint": "https://fcm.googleapis.com/fcm/send/ehToQZKX9Tc:APA91bFxfg1whGo4qhrhOzJeJoJx2ANcA2AYTDYKKYuJ9dZu_qyDU5ggybLVQhvLSo_BoUURj9KAxFRGzF9BANZ-_FV8wMsD7bDYJFrfXoDLnC5BaIBqR7nHuRuc_N0F5MkE2mK-rfYN", "expirationTime": null}', '2025-11-21 16:54:45.640527+00'),
	(9, 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '{"keys": {"auth": "CURJvk9QPgWxsqjPwduHvg", "p256dh": "BMyzsv3Zcq5SqfoClbhKTfUqiTunFW22vyipFMBXazBfEi5dk7HIGxg5DHyxV3u0LFmWl4GZAXR-DeK8qMIw1y8"}, "endpoint": "https://web.push.apple.com/QGRwmeSWzB43frXqVwlMXXYZWujYjwHuE2MSrHK77Kp0r3LlKLN2DXrnP66Y7pHBP0wRSS7VbWJ3JA3IvtSDpo8OwAS8CBbj0b0CsxB5tGWRRp87zSwwzoD64YlYoSMPrUEtxSmaQY8LWBUJQ0LtMoQvWwu4oPBfSBHfXFk8VTc", "expirationTime": null}', '2025-11-21 18:57:30.399108+00'),
	(10, 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '{"keys": {"auth": "bIaDX2DJZigofgLbUKs5_Q", "p256dh": "BHMXi3lF-XHdlKcu_FtSC0RPSPPwa9eAV_Rw-9aqNIvvuDTl4S4XzMJ_XvCKePMZaQJdrQlhmbtu7meITN9fUWA"}, "endpoint": "https://fcm.googleapis.com/fcm/send/d_WkTnzVCq8:APA91bFh2HuZ79AC8FC2I_aAl3NaFTirdwXNA-k8FGPsvYRFVhbAeuCMfKVETN4YfGrNXJ3XNv2AWw7ihf9XqQ988vvGy35cGeuJUF1mh8GzBw8IWvizabYMKq7asMcw1fiQNL_MnDva", "expirationTime": null}', '2025-11-22 14:15:31.508632+00'),
	(12, 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '{"keys": {"auth": "6SJ8La4CAAkJmjNf909QZw", "p256dh": "BLO1BdPj7p6f6YD68hN72dgYsAy1zah9v29Qvr_rRdrAE20ODGahiIBc63TB7Z6ej7lzi2AFrh8GWL76BxfA_iM"}, "endpoint": "https://fcm.googleapis.com/fcm/send/cNK2OB9n6ig:APA91bEGvv8JNhxDcykbE_uokk_EBMsLl8JpyZ1DSxWpby102QUHdsaLfO7ZDdNZb64lUKtiySl5XHDeNS4reR6NZQPD8MNr9QEp6L9jWn3EPPJHHE-hryxQSNgFRR00ek2_mKrkcZ-c", "expirationTime": null}', '2025-11-24 21:34:26.02496+00'),
	(13, 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '{"keys": {"auth": "gUk6obkWpibckPRxd5E61A", "p256dh": "BNbpW9qK2tXoVVRBKCmsPa2WWfSIVqQwPv73doVt_z907QLh25dD4C0kENePb4qff9bCrjTmrei58R0OFTjwsto"}, "endpoint": "https://web.push.apple.com/QE-XwzPLyA1YT5Pb5ABvz3LypRZGrbvNfaVxMPj9Wramx0IYM-LGAGvpjAOIM2z19dbE0X_XsQTsmDoboXwGqdaD2OUczcF8hGIf28E4DuMlWt9iRB-2FHhcDmFunBFy9YKZwUA90kvW2uNDbJmtA9c2P1GzyYS5uHJpofOI0ds", "expirationTime": null}', '2025-11-25 12:36:52.378754+00'),
	(14, 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '{"keys": {"auth": "MVmBrUaGGOF093iVpLhDHg", "p256dh": "BN08m3EuaSLWEWfXglx5iukvJv9s0DeOZMOlxlLD4Y1Duahp3wIHA9ZVJnCZVEiulvP4FZQtJDDQ7kNRDIczmZY"}, "endpoint": "https://web.push.apple.com/QFsIMormeCHVZzlSdrxQM2YzkQX50cfRgCD_z08rKW2jTo2J8oz_2zzULoP5K8Wk8B4pv7R_iKPr7nkrHY88MvI1tU3J09NXdqh6WOMsOmNg19iKmglwAeyIu9EU6G9vRV6Poybbp4CR3p9xZogPB9ZGSzhaRGBn-nfR2Pw5QMA", "expirationTime": null}', '2025-11-25 17:27:33.067665+00'),
	(17, 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '{"keys": {"auth": "ctQ1E7bLbghwCdJMgXMauw", "p256dh": "BFQXARvVCNimCyaU9l8EYX011SJD8rSleAcs394fF-ehmqnNv32R_tvgsVRR40tz3KMArW6q0NYy15FBP-eAALM"}, "endpoint": "https://fcm.googleapis.com/fcm/send/ddgSlFwJeYE:APA91bE-yJ3DUws4V2Tcy6Q2FJp0Ty9Tw1-ZraL5d3ir_9AJYZNUWnOlHM9DfjIkro2fe01c1JL-dk_rO1i57CmnGyEXPfYwua15L0MiBfxwKctyyYURSxPYBjGNJXhq1awEg1aTiOYM", "expirationTime": null}', '2025-11-27 00:47:22.664095+00'),
	(19, 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '{"keys": {"auth": "ithXAqGu_iHxiMfA_gs3zQ", "p256dh": "BOglqLc7L9UPthufBSQZKSEwnKu3rJYcx-Irg5sv6GOsNdyHDJuIpNsaMgsfmE76Bf5dt0pPDsPgECBKZM_xA9k"}, "endpoint": "https://fcm.googleapis.com/fcm/send/fKrHsBhdR7c:APA91bEzu7mmSZ-6hKA4Xdo2PReXItHRwinAzTuBOVKAjXWF_sYQZR9bZ9M_m41s437vfV9GwfAu1ZlonL8Aa1mULotzAYuRM14hT5l92KAY9-YAJCBYp5XUxsutP6CebQrGQ-0JYfWB", "expirationTime": null}', '2025-11-27 01:15:37.89618+00'),
	(21, 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '{"keys": {"auth": "zKTX8Hw7helC7BSIe8wcog", "p256dh": "BMHZulqb_aH2U8almh57cy1uhHm1MusmuKhgZTB6meOJmzjX0bxhSX6UXDHzkhPGa4mFf13NX6ZPIaym1Xdm1Y4"}, "endpoint": "https://fcm.googleapis.com/fcm/send/eaaBkSMvrbs:APA91bEwrznJ4_FTyR-mr84xzMtJ5aUDdWkVlfz_oSb5uDzpq55AGT27pRbZS_LlFrzkPYQNww1keJPMptGBpyX6EbTf45-Px2X29wkieoKuXhtC986_oN3XuOR6s5UPCrnqkBj9811O", "expirationTime": null}', '2025-11-27 05:35:17.159292+00'),
	(22, 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '{"keys": {"auth": "_mvTUKUfWVZ_Aq9ZkCiaxg", "p256dh": "BF_TOTOSoA0JivydsmpriH4ZFvUFWLsQRISiVZkEjkr3W6PIM-ELZbd2imkV4sXCu4Xf7MEYfvHbGR9jmb1MORI"}, "endpoint": "https://fcm.googleapis.com/fcm/send/dtJDo98QsUU:APA91bEYv6wZhZ-wZR6FHK4HUbvkt6310nZVFIJdd8LQJiBZHq3QOFTfHhGYocgApnj_xHak5v_wB8YwG3mpeOfAFTeiWpoCGqM8RcMNd1yN0_tZJmY5bSodogTw_oLDtF3QipzM-xk2", "expirationTime": null}', '2025-11-27 05:47:32.656827+00'),
	(23, 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '{"keys": {"auth": "Zs-LBV7OkqSNSk9vcge9_g", "p256dh": "BIrO1SeQKM7heYCNHZ7z65KnmL2bwGyTyhGVqLOcb94jMY-HB0g5ChECuSYcxNxCZHJj17acZihgl9Dvwmvxf1s"}, "endpoint": "https://fcm.googleapis.com/fcm/send/e05rHYJcCd0:APA91bFfe3RFq2QIl1GiR5bf3y7H4dsBy-_4d8lLmTWMERaJjfZlW5wwEGcGEHZSBemGKGKiSmW39wuHoAahHp7hP1NnnctC3Cy_71S_wn9_iyKWnOli5A8McBDsDy8oORsJJwYsvLhb", "expirationTime": null}', '2025-11-27 06:10:16.68529+00'),
	(24, 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '{"keys": {"auth": "U2xaT_aJRV9L8pSVBCWfuA", "p256dh": "BE5Zj-QIPK6i-eeCWeSoWi_E4sDbYfjRFM8d3hRB2aWfm9eosooGSiJs2X0jf-kLya69req1WlGwIXDoeaRYJ5k"}, "endpoint": "https://web.push.apple.com/QMxPHGclvmN7Q5c-u1J99wUqc2lOnArUqKDXeAMnA3Gbh74NE3yKu1xNg2JqlweAChgK30JAY8YpU1YkCYSeuAZ2e5Fm0v02U5oOMt4dQFWkZB7Cq7eW3bc2qREsYgXimDDJoqF3p_7iTJRek0zB-rxALnDiEIIRjzRzJZyLUD4", "expirationTime": null}', '2025-11-27 06:26:21.807172+00'),
	(25, 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '{"keys": {"auth": "ZFICeFDPyYMahi0O_ZxBKg", "p256dh": "BB3vqljEzLBn8Lk8L6bMc3XoOIkcI41m_klys3A6-1PQ7LU9kRADPNunl4qaRd77Aaim8PgGX_cdHn2qjTGapcI"}, "endpoint": "https://web.push.apple.com/QEtfBsXdOD-4MJbGsfka3ZvGTCMs-JeKbpTv2ltLOfb6yNi2nJNQwPFGnuXTKxTT8wET6yJivQL6hJ-0RbnjXxU9nUnSHsTmFLHZmDVeyBY2o6E9Eepez7NwzEqWT2tWVtnflhuvYo-P2-q8FtZkZRRxSpCkw5MTdB5uC6dYO3w", "expirationTime": null}', '2025-11-27 06:31:29.388054+00'),
	(27, 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '{"keys": {"auth": "lAax-hH7VtlOfCWfzVkfHQ", "p256dh": "BNtcnFjSh53gatNc0Y_oDAazSqavb4UOHtzGpXpdqLEIidQrCJfX0DcvFhbrpAB2WVhyllP26Z7oEKcmi13J-u0"}, "endpoint": "https://web.push.apple.com/QNRsxjW_pxmrGqZgC9lcj19T-egvUS5YB-qM4bgGh8nSRpnaRonvtJKgSb5IBqz46zDtmaxxEPv7v2u4MwpnYNnL-512yoPGm0_GVCPqxArWgcHWdwcFB0DQaZUpknEzsBmwFWoxxKkZ1B06t3avL3_prMdsC2BXrthLyNkp0Vw", "expirationTime": null}', '2025-11-29 22:10:50.77916+00');


--
-- Data for Name: scheduled_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."scheduled_orders" ("id", "user_id", "supplier_id", "order_data", "is_sent", "created_at", "reminder_type", "scheduled_at") VALUES
	('f5c79904-2f70-4e81-8ae9-001fc4ee9a61', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '"{\"items\":{\"Sale Bustine\":\"1\",\"Pepe Bustine\":\"\",\"Olio Bustine\":\"\",\"Songino\":\"\",\"Rucola\":\"\",\"Cavolo Rosso\":\"\",\"Cipolla Rossa\":\"\",\"Quasar Vetri\":\"\",\"Sgrassatore Chanteclair\":\"\",\"Sapone Piatti\":\"\",\"Lavapavimenti\":\"\",\"Tris Posate Monouso\":\"\",\"Semola Rimacinata\":\"\",\"Tovaglioli neri 24x24\":\"\",\"Rotoli carta\":\"\",\"Guanti L\":\"\",\"Manitoba\":\"\",\"Paprika Dolce\":\"\",\"Paprika Affumicata\":\"\"},\"additional_items\":\"\"}"', true, '2025-09-24 17:09:00.619578+00', 'simple', '2025-09-24 17:09:00+00'),
	('e9aca9ec-3662-4a4a-9034-2c9d711080cd', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '"{\"items\":{\"Sale Bustine\":\"1\",\"Pepe Bustine\":\"\",\"Olio Bustine\":\"\",\"Songino\":\"\",\"Rucola\":\"\",\"Cavolo Rosso\":\"\",\"Cipolla Rossa\":\"\",\"Quasar Vetri\":\"\",\"Sgrassatore Chanteclair\":\"\",\"Sapone Piatti\":\"\",\"Lavapavimenti\":\"\",\"Tris Posate Monouso\":\"\",\"Semola Rimacinata\":\"\",\"Tovaglioli neri 24x24\":\"\",\"Rotoli carta\":\"\",\"Guanti L\":\"\",\"Manitoba\":\"\",\"Paprika Dolce\":\"\",\"Paprika Affumicata\":\"\"},\"additional_items\":\"\"}"', true, '2025-09-24 17:09:29.421549+00', 'simple', '2025-09-24 17:10:00+00'),
	('e94cc800-06c4-4685-bc33-e094fc7ec618', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '"{\"items\":{\"Sale Bustine\":\"4\"},\"additional_items\":\"\"}"', true, '2025-09-24 17:20:35.135763+00', 'simple', '2025-09-25 17:21:00+00'),
	('3060a11d-52c1-4dfd-b8f5-724ae3c4f190', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '"{\"items\":{\"Olio Bustine\":\"1\"},\"additional_items\":\"\"}"', true, '2025-09-24 17:59:52.535072+00', 'simple', '2025-09-24 18:00:00+00'),
	('28aa72cb-8174-4c95-b518-ed0a8ee35ce3', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '"{\"items\":{\"Sale Bustine\":\"1\",\"Pepe Bustine\":\"1\"},\"additional_items\":\"\"}"', true, '2025-09-24 18:24:01.073922+00', 'simple', '2025-09-24 18:25:00+00'),
	('e3b214a6-03df-49cd-85bb-5a7cfa2c09f7', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'df99037c-1085-4760-bbbf-cac576ba9e6f', '"{\"items\":{\"Cetrioli\":\"1\"},\"additional_items\":\"\"}"', true, '2025-09-24 19:12:18.537302+00', 'simple', '2025-09-24 19:13:00+00'),
	('076ec66a-6fc1-4dbf-9dbf-8915c6075261', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', '"{\"items\":{\"Carne secca\":\"1\"},\"additional_items\":\"\"}"', true, '2025-09-25 19:15:40.141174+00', 'simple', '2025-09-25 19:16:00+00'),
	('af2039bf-017b-4b38-8045-ec00b5c581f9', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', '"{\"items\":{\"Carne secca\":\"1\"},\"additional_items\":\"\"}"', true, '2025-09-25 19:36:10.391853+00', 'simple', '2025-09-25 19:36:00+00'),
	('b74d29bf-6523-429f-b6b7-693c90b98021', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'df99037c-1085-4760-bbbf-cac576ba9e6f', '"{\"items\":{\"Cetrioli\":\"1\"},\"additional_items\":\"\"}"', true, '2025-09-25 19:38:18.708821+00', 'simple', '2025-09-25 19:39:00+00'),
	('7f2d0c85-a380-44bd-91f8-90f2135785d2', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', '"{\"items\":{\"Carne secca\":\"1\"},\"additional_items\":\"\"}"', true, '2025-09-25 19:49:01.285305+00', 'simple', '2025-09-25 19:48:00+00'),
	('c1836411-a5dc-4444-97bd-931e40e1770d', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'df99037c-1085-4760-bbbf-cac576ba9e6f', '"{\"items\":{\"Cetrioli\":\"1\"},\"additional_items\":\"\"}"', true, '2025-09-25 19:49:32.390502+00', 'simple', '2025-09-25 19:50:00+00'),
	('6b73ace9-9a13-423b-9e22-272eb6917b19', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', '"{\"items\":{\"Carne secca\":\"1\"},\"additional_items\":\"\"}"', true, '2025-09-25 20:02:42.631516+00', 'simple', '2025-09-25 20:03:00+00'),
	('79db74f8-463a-4479-9a6e-00ddcfd9e797', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', '"{\"items\":{\"Carne secca\":\"1\"},\"additional_items\":\"\"}"', true, '2025-09-25 20:15:13.505529+00', 'simple', '2025-09-25 20:16:00+00'),
	('307effcb-8333-4a64-9710-63f68e89c844', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', '"{\"items\":{\"Carne secca\":\"1\"},\"additional_items\":\"\"}"', true, '2025-09-25 20:19:25.639918+00', 'simple', '2025-09-25 20:20:00+00'),
	('9b5f2ab9-68a4-4c28-b77a-87b74c35c208', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '"{\"items\":{\"Sale Bustine\":\"1\"},\"additional_items\":\"\"}"', true, '2025-10-09 17:32:10.969966+00', 'simple', '2025-10-09 17:45:00+00'),
	('594b924c-1c3c-493e-a44b-67866fbe32a9', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', '"{\"items\":{\"Pizza bianca\":\"1\"},\"additional_items\":\"\"}"', true, '2025-10-09 18:26:08.100741+00', 'simple', '2025-10-09 18:30:00+00'),
	('e76fa1f7-53b2-481e-9958-aa125995eecc', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', '"{\"items\":{\"Pizza bianca\":\"1\"},\"additional_items\":\"\"}"', true, '2025-10-09 19:19:22.863417+00', 'simple', '2025-10-09 19:30:00+00'),
	('e5946438-d91f-4b4b-85c0-fcee482fe598', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', '"{\"items\":{\"Pizza bianca\":\"2\"},\"additional_items\":\"\"}"', true, '2025-10-09 19:22:44.14401+00', 'simple', '2025-10-09 19:30:00+00'),
	('afa3926c-d23a-4a55-9e7b-82f37c7ac490', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', '"{\"items\":{\"Bomba Piccante\":\"2\"},\"additional_items\":\"\"}"', true, '2025-10-09 19:23:10.03935+00', 'simple', '2025-10-09 19:30:00+00'),
	('85a5ec9a-5ef3-4868-afc5-95a1076de1d0', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', '"{\"items\":{\"Bomba Piccante\":\"2\"},\"additional_items\":\"\"}"', true, '2025-10-09 19:53:39.085635+00', 'simple', '2025-10-09 20:00:00+00'),
	('dd11480d-7fb4-4915-83bf-3d40ba68ba5b', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '"{\"items\":{\"Sale Bustine\":\"1\",\"Pepe Bustine\":\"1\"},\"additional_items\":\"\"}"', true, '2025-10-09 20:07:21.447523+00', 'simple', '2025-10-09 20:15:00+00'),
	('42c10956-dbc1-4d00-b414-4ec9bc31d880', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', '"{\"items\":{\"Pizza bianca\":\"1\"},\"additional_items\":\"\"}"', true, '2025-10-10 08:43:21.18308+00', 'simple', '2025-10-10 08:45:00+00'),
	('c59db6d1-bc17-4270-94c3-e2bbebf22850', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', '"{\"items\":{\"Pizza bianca\":\"2\"},\"additional_items\":\"\"}"', true, '2025-10-10 09:41:39.062886+00', 'simple', '2025-10-10 09:45:00+00'),
	('3923b0f1-4e2e-4325-b3c3-c6d03de42c43', '7b4b20cc-a236-4766-9680-59d917b8f5eb', '9567d72a-7060-4a1d-b913-7d342aa2b352', '"{\"items\":{\"glock\":\"10 pezzi\"},\"additional_items\":\"\"}"', true, '2025-10-10 09:41:42.907852+00', 'simple', '2025-10-10 09:45:00+00'),
	('fb75479a-676f-4789-9b38-ee067f36d915', '7b4b20cc-a236-4766-9680-59d917b8f5eb', '9567d72a-7060-4a1d-b913-7d342aa2b352', '"{\"items\":{\"glock\":\"10 pz\"},\"additional_items\":\"\"}"', true, '2025-10-10 09:46:43.631884+00', 'simple', '2025-10-10 10:00:00+00'),
	('4ec88f7a-1654-4042-9edb-89463c860a1d', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', '"{\"items\":{\"Fuselli Panati\":\"1\"},\"additional_items\":\"\"}"', true, '2025-10-10 09:49:11.414757+00', 'simple', '2025-10-10 10:00:00+00'),
	('3a228daf-724e-46ce-8450-ce2f269dff2a', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', '"{\"items\":{\"Bomba Piccante\":\"1\"},\"additional_items\":\"\"}"', true, '2025-10-10 18:58:24.498162+00', 'simple', '2025-10-10 19:00:00+00'),
	('13c0ae76-cc50-4c93-bfa8-32806cf67c96', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '"{\"items\":{\"Sale Bustine\":\"1\"},\"additional_items\":\"\"}"', true, '2025-10-11 12:29:34.511667+00', 'simple', '2025-10-11 12:30:00+00'),
	('31adfc76-a376-4749-9fc3-495e0df52f49', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', '"{\"items\":{\"Fuselli Panati\":\"1\"},\"additional_items\":\"\"}"', true, '2025-10-11 13:29:34.53993+00', 'simple', '2025-10-11 13:30:00+00'),
	('9cd60d7f-1d54-4dfe-b547-3d8a15164dee', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', '"{\"items\":{\"Fuselli Panati\":\"1\"},\"additional_items\":\"\"}"', true, '2025-10-11 13:34:07.622099+00', 'simple', '2025-10-11 13:45:00+00'),
	('c3698343-81e5-4e2c-9c44-1c7f0a4419c4', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', '"{\"items\":{\"Bomba Piccante\":\"5\"},\"additional_items\":\"\",\"email_subject\":\"\"}"', true, '2025-11-14 01:47:03.912773+00', 'simple', '2025-11-14 02:00:00+00'),
	('03f22357-e1ef-4155-a988-4b05c373c1a4', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '"{\"items\":{\"Pepe Bustine\":\"2\"},\"additional_items\":\"\"}"', true, '2025-10-12 15:19:20.279063+00', 'simple', '2025-10-12 15:30:00+00'),
	('ffb6beb4-a158-494c-bbf0-1b379af2a88b', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', '"{\"items\":{\"Carne secca\":\"2\"},\"additional_items\":\"\"}"', true, '2025-10-12 16:30:49.93832+00', 'simple', '2025-10-12 16:45:00+00'),
	('620dd8ef-f852-4bea-abcf-87635a9ae7cf', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', '"{\"items\":{\"Olio oliva\":\"2\"},\"additional_items\":\"\"}"', true, '2025-10-12 16:34:40.916673+00', 'simple', '2025-10-12 16:45:00+00'),
	('41319106-0512-4b65-82a8-c508b2cf2fcd', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', '"{\"items\":{\"Peperoncino olio\":\"4\"},\"additional_items\":\"\"}"', true, '2025-10-12 16:59:35.829127+00', 'simple', '2025-10-12 17:00:00+00'),
	('0ead8f88-0eb0-42e0-91df-59d600aaf455', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', '"{\"items\":{\"Pizza bianca\":\"2\"},\"additional_items\":\"\"}"', true, '2025-10-12 16:58:39.112378+00', 'simple', '2025-10-12 17:00:00+00'),
	('72bb4831-43fa-456e-aa27-8de706ee6d32', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', '"{\"items\":{\"Fuselli Panati\":\"5\"},\"additional_items\":\"\"}"', true, '2025-10-12 17:04:33.485684+00', 'simple', '2025-10-12 17:15:00+00'),
	('da3f0624-9e87-43df-ae18-b5a8971dd451', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '"{\"items\":{\"Olio Bustine\":16,\"Songino\":10,\"Quasar Vetri\":7},\"additional_items\":\"\"}"', true, '2025-10-12 17:05:41.823105+00', 'simple', '2025-10-12 17:15:00+00'),
	('27ea3681-8552-42fe-82c5-6fb4661368b2', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', '"{\"items\":{\"Pizza bianca\":\"1,5\"},\"additional_items\":\"\",\"email_subject\":\"\"}"', true, '2025-11-17 22:05:13.386389+00', 'simple', '2025-11-17 22:30:00+00'),
	('d8496528-b3f0-4d11-b842-25d818017be0', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', '"{\"items\":{\"Pizza bianca\":\"1\"},\"additional_items\":\"\",\"email_subject\":\"\"}"', true, '2025-11-17 23:24:28.151036+00', 'simple', NULL),
	('67a4e8fa-5719-431e-acad-6a35e2f0879a', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', '"{\"items\":{\"Pizza bianca\":\"1\"},\"additional_items\":\"\",\"email_subject\":\"\"}"', true, '2025-11-17 23:28:44.261455+00', 'simple', NULL),
	('10329cfc-cf07-4dd8-a65e-ad5fd7fc1387', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '"{\"items\":{\"Pepe Bustine\":\"3\"},\"additional_items\":\"\"}"', true, '2025-10-12 17:28:34.020663+00', 'simple', '2025-10-12 17:30:00+00'),
	('ce5d5493-9f1c-4040-a653-1b16338e1ef7', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', '"{\"items\":{\"Fuselli Panati\":\"5\",\"Macinato\":6},\"additional_items\":\"\"}"', true, '2025-10-13 00:40:00.002417+00', 'simple', '2025-10-13 00:45:00+00'),
	('f55d900e-8a31-4c51-91ce-1474ac481a6a', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', '"{\"items\":{\"Fuselli Panati\":\"5\",\"Shnitzel\":9},\"additional_items\":\"\"}"', true, '2025-10-12 17:46:16.034511+00', 'simple', '2025-10-12 18:15:00+00'),
	('c597c0ab-2f5b-4654-9b59-72710b5aab52', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', '"{\"items\":{\"Fuselli Panati\":8,\"Macinato\":10},\"additional_items\":\"\"}"', true, '2025-10-12 18:22:10.538609+00', 'simple', '2025-10-12 18:30:00+00'),
	('885554c1-4ed7-46ac-bcd5-74e3b1776b57', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', '"{\"items\":{\"Pizza bianca\":\"2\"},\"additional_items\":\"\"}"', true, '2025-10-12 18:31:06.655126+00', 'simple', '2025-10-12 18:45:00+00'),
	('9b637825-53ab-4f9d-941b-19d5ab3b7f53', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', '"{\"items\":{\"Pizza bianca\":\"2\"},\"additional_items\":\"\"}"', true, '2025-10-12 18:48:38.246434+00', 'simple', '2025-10-12 19:00:00+00'),
	('3d8a6117-e2e4-491b-902f-7a4cbabb7c1e', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '"{\"items\":{\"Sale Bustine\":\"2\"},\"additional_items\":\"\"}"', true, '2025-10-12 18:48:50.238525+00', 'simple', '2025-10-12 19:00:00+00'),
	('734b282b-7b8f-42c1-ab80-1ccaa4c7059f', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'df99037c-1085-4760-bbbf-cac576ba9e6f', '"{\"items\":{\"Grappolo\":\"2\"},\"additional_items\":\"\"}"', true, '2025-10-12 18:49:01.497045+00', 'simple', '2025-10-12 19:00:00+00'),
	('520ef8cc-1fef-4381-86b8-48654f722a22', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', '"{\"items\":{\"Carne secca\":\"2\"},\"additional_items\":\"\"}"', true, '2025-10-12 18:49:13.561252+00', 'simple', '2025-10-12 19:00:00+00'),
	('5608aff2-c080-406b-a3a4-3c832e90f71d', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '"{\"items\":{\"Sale Bustine\":\"3\"},\"additional_items\":\"\"}"', true, '2025-10-12 18:49:30.804723+00', 'simple', '2025-10-12 19:00:00+00'),
	('8cc98cc1-d845-4161-9900-c3c3749a8518', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', '"{\"items\":{\"Bomba Piccante\":\"3\"},\"additional_items\":\"\"}"', true, '2025-10-12 19:25:36.956848+00', 'simple', '2025-10-12 19:30:00+00'),
	('a81f6db5-6629-4bf4-8591-d1363f5b13b3', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', '"{\"items\":{\"Pizza bianca\":\"2\"},\"additional_items\":\"\"}"', true, '2025-10-13 00:52:33.977731+00', 'simple', '2025-10-13 01:00:00+00'),
	('a20af3fe-ffc2-4472-b7ec-e7e6aae0561f', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', '"{\"items\":{\"Francesine\":\"8\",\"Shnitzel\":2},\"additional_items\":\"\"}"', true, '2025-10-13 00:52:54.144724+00', 'simple', '2025-10-13 01:00:00+00'),
	('b6e76869-3e45-4026-b104-aff4b3bcd0c0', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', '"{\"items\":{\"Fuselli Panati\":\"2\",\"Shnitzel\":2},\"additional_items\":\"\"}"', true, '2025-10-12 20:35:59.435166+00', 'simple', '2025-10-12 20:45:00+00'),
	('871ffc86-f59a-4298-85f7-89c10798372d', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', '"{\"items\":{\"Pizza bianca\":6},\"additional_items\":\"\"}"', true, '2025-10-12 20:35:43.520939+00', 'simple', '2025-10-12 20:45:00+00'),
	('4563dc49-35f7-4eee-95fb-3af5df4d9d88', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '"{\"items\":{\"Sale Bustine\":\"2\"},\"additional_items\":\"\"}"', true, '2025-10-12 21:19:13.051707+00', 'simple', '2025-10-12 21:30:00+00'),
	('1f706835-af0b-43fb-a52b-4800f9515b37', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', '"{\"items\":{\"Bomba Piccante\":\"3\"},\"additional_items\":\"\"}"', true, '2025-10-12 21:45:59.792459+00', 'simple', '2025-10-12 22:00:00+00'),
	('5e49ca7e-573d-4688-b180-e9b03a10509c', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', '"{\"items\":{\"Pizza bianca\":\"2\"},\"additional_items\":\"\"}"', true, '2025-10-12 23:44:10.616747+00', 'simple', '2025-10-12 23:45:00+00'),
	('083dd144-5f94-41eb-bf30-3854f3cb9c48', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', '"{\"items\":{\"Bomba Piccante\":\"2\",\"Crema tartufo\":4},\"additional_items\":\"\"}"', true, '2025-10-12 23:55:59.859459+00', 'simple', '2025-10-13 00:00:00+00'),
	('dc63df5d-4c32-41f8-ab13-0197a6b3be34', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '"{\"items\":{\"Sale Bustine\":\"2\"},\"additional_items\":\"\"}"', true, '2025-10-13 00:11:31.592538+00', 'simple', '2025-10-13 00:15:00+00'),
	('966f7577-df44-4abc-93ad-dae4ea36e9c4', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', '"{\"items\":{\"Maionese BG\":\"3\"},\"additional_items\":\"\"}"', true, '2025-10-13 16:11:53.412945+00', 'simple', '2025-10-13 16:15:00+00'),
	('0271b98e-f7a9-48e9-aedd-ad8b37494d27', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'df99037c-1085-4760-bbbf-cac576ba9e6f', '"{\"items\":{\"Prezzemolo\":\"4\"},\"additional_items\":\"\"}"', true, '2025-10-13 16:12:03.518658+00', 'simple', '2025-10-13 16:15:00+00'),
	('6b633a1c-08ab-4705-be3e-96310f51b777', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '"{\"items\":{\"Sale Bustine\":\"3\"},\"additional_items\":\"\"}"', true, '2025-10-13 08:18:44.102003+00', 'simple', '2025-10-13 08:30:00+00'),
	('004a50ef-b4c9-4362-9db2-ecc93767ae71', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', '"{\"items\":{\"Fuselli Panati\":\"3\",\"Francesine\":3},\"additional_items\":\"\"}"', true, '2025-10-13 08:18:32.844639+00', 'simple', '2025-10-13 08:30:00+00'),
	('303bda03-3d2c-4651-b85a-22329b2fb998', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', '"{\"items\":{\"Bomba Piccante\":\"3\"},\"additional_items\":\"\"}"', true, '2025-10-13 08:49:01.033438+00', 'simple', '2025-10-13 09:00:00+00'),
	('6c5ad7af-54e6-4e80-ba16-012da45f7eb6', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '"{\"items\":{\"Pepe Bustine\":\"3\"},\"additional_items\":\"\"}"', true, '2025-10-13 08:49:12.915116+00', 'simple', '2025-10-13 09:00:00+00'),
	('56c8fec9-26c7-4db1-b3af-31b9fb3a9e23', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', '"{\"items\":{\"Pizza bianca\":\"5\"},\"additional_items\":\"\"}"', true, '2025-10-13 08:49:20.816312+00', 'simple', '2025-10-13 09:00:00+00'),
	('2ab48a89-7444-4bb0-943f-6c1ad79d2848', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', '"{\"items\":{\"Porchetta\":\"2\"},\"additional_items\":\"\"}"', true, '2025-10-13 09:27:07.443624+00', 'simple', '2025-10-13 09:30:00+00'),
	('a5ee2179-f537-418f-9aef-3b44f108d221', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', '"{\"items\":{\"Pizza bianca\":\"2\"},\"additional_items\":\"\"}"', true, '2025-10-13 16:35:59.799588+00', 'simple', '2025-10-13 16:45:00+00'),
	('c96e493f-0c73-495e-ae68-9b38df1c3a56', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', '"{\"items\":{\"Bomba Piccante\":\"2\"},\"additional_items\":\"\",\"email_subject\":\"\"}"', true, '2025-11-13 22:34:16.044494+00', 'simple', '2025-11-13 22:45:00+00'),
	('9821dd51-6b38-48e1-8bdb-4afcdc06c0aa', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', '"{\"items\":{\"Pizza bianca\":\"4\"},\"additional_items\":\"\",\"email_subject\":\"\"}"', true, '2025-11-14 01:47:04.091712+00', 'simple', '2025-11-14 02:00:00+00'),
	('45adc151-7a5c-4d17-bd7b-8403aabecfb2', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', '"{\"items\":{\"Bomba Piccante\":\"2\"},\"additional_items\":\"\",\"email_subject\":\"\"}"', true, '2025-11-14 11:12:53.788265+00', 'simple', '2025-11-14 11:15:00+00'),
	('46e858e9-71a0-46f4-8d1f-63fc0f8c2175', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', '"{\"items\":{\"Pizza bianca\":\"1\"},\"additional_items\":\"\"}"', true, '2025-10-20 21:45:46.764686+00', 'simple', '2025-10-20 22:00:00+00'),
	('330d6e36-682d-4ae8-ab30-6aa1bb88c133', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '"{\"items\":{\"Cipolla Rossa\":\"1 kg\"},\"additional_items\":\"\",\"email_subject\":\"\"}"', true, '2025-11-17 22:05:13.481054+00', 'simple', '2025-11-17 22:30:00+00'),
	('3366b624-f92a-438a-9061-b5ba6d61d5e0', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', '"{\"items\":{\"Pizza bianca\":\"1\"},\"additional_items\":\"\",\"email_subject\":\"\"}"', true, '2025-11-17 23:25:18.060691+00', 'simple', NULL),
	('58749744-ebc9-4b1f-8018-4daa53a83c55', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', '"{\"items\":{\"Pizza bianca\":\"1\"},\"additional_items\":\"\",\"email_subject\":\"\"}"', true, '2025-11-17 22:55:10.936442+00', 'simple', '2025-11-17 23:00:00+00'),
	('b10cc68a-579a-40f7-9ee3-d3dd8c5f52a1', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', '"{\"items\":{\"Pizza bianca\":\"1\"},\"additional_items\":\"\",\"email_subject\":\"\"}"', true, '2025-11-17 23:28:51.866761+00', 'simple', NULL),
	('f181d987-9045-4390-a216-6ccf53956728', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', '"{\"items\":{\"Pizza bianca\":\"2\"},\"additional_items\":\"\"}"', true, '2025-10-21 01:13:34.519953+00', 'simple', '2025-10-21 01:15:00+00'),
	('a159b235-48b3-4acb-aa27-a2dee88c6e6d', '7c263c3e-11b2-468e-a74d-98910c429842', 'cd0d2dd8-82b6-48f4-9620-fb4129d3bf40', '"{\"items\":{\"l\":\"8\"},\"additional_items\":\"\"}"', false, '2025-10-20 15:39:53.655508+00', 'simple', '2025-10-20 15:45:00+00'),
	('2aac050f-f5cd-40aa-b286-23224ffcbb0f', '7c263c3e-11b2-468e-a74d-98910c429842', 'a0fd8b52-6014-4920-9409-2abb93ca0f3a', '"{\"items\":{\"po\":\"8\"},\"additional_items\":\"\"}"', false, '2025-10-20 15:39:53.788094+00', 'simple', '2025-10-20 15:45:00+00'),
	('a62a38dd-1a71-4ec4-8b28-4a69c060a47e', '7c263c3e-11b2-468e-a74d-98910c429842', 'cd0d2dd8-82b6-48f4-9620-fb4129d3bf40', '"{\"items\":{\"l\":\"8\"},\"additional_items\":\"\"}"', false, '2025-10-20 15:39:59.231921+00', 'simple', '2025-10-20 15:45:00+00'),
	('c2772f38-815d-4ba5-9a1e-559ba89e7fb1', '7c263c3e-11b2-468e-a74d-98910c429842', 'a0fd8b52-6014-4920-9409-2abb93ca0f3a', '"{\"items\":{\"po\":\"8\"},\"additional_items\":\"\"}"', false, '2025-10-20 15:39:59.334737+00', 'simple', '2025-10-20 15:45:00+00'),
	('b21869ca-68d7-4cef-adc1-72810105fb13', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', '"{\"items\":{\"Pizza bianca\":\"1\"},\"additional_items\":\"\"}"', true, '2025-10-21 01:26:35.104823+00', 'simple', '2025-10-21 01:30:00+00'),
	('dad7d479-7eb6-4f14-8c93-5af62737ab0d', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', '"{\"items\":{\"Pizza bianca\":\"2\"},\"additional_items\":\"\"}"', true, '2025-10-21 12:38:48.353373+00', 'simple', '2025-10-21 12:45:00+00'),
	('4829cc1c-caf1-4fd5-90e2-1c7a3076d06f', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', '"{\"items\":{\"Pizza bianca\":\"2\"},\"additional_items\":\"\"}"', true, '2025-10-21 13:43:02.033528+00', 'simple', '2025-10-21 13:45:00+00'),
	('cef34f6e-687b-4148-bb00-b342eb6e9d25', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'df99037c-1085-4760-bbbf-cac576ba9e6f', '"{\"items\":{\"Cetrioli\":\"3\"},\"additional_items\":\"\"}"', true, '2025-10-21 14:23:31.788959+00', 'simple', '2025-10-21 14:30:00+00'),
	('0c1214b4-80b0-4cb6-be35-3feb9c291c2c', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', '"{\"items\":{\"Pizza bianca\":\"2\"},\"additional_items\":\"\"}"', true, '2025-10-21 15:13:17.771013+00', 'simple', '2025-10-21 15:15:00+00'),
	('0a3cda31-987c-451c-bf6e-990dd389bbb7', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '5778f4ad-dc14-4318-b283-5fc6bfd7a258', '"{\"items\":{\"Carne secca\":\"2\"},\"additional_items\":\"\"}"', true, '2025-10-21 15:26:58.26982+00', 'simple', '2025-10-21 15:30:00+00'),
	('d41f32bb-7246-44cb-aecc-80ac7efaca73', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', '"{\"items\":{\"Pizza bianca\":\"2\"},\"additional_items\":\"\"}"', true, '2025-10-21 15:27:07.356349+00', 'simple', '2025-10-21 15:30:00+00'),
	('2cdd4820-008d-4f4f-b5ec-4015ba394ec2', '7b4b20cc-a236-4766-9680-59d917b8f5eb', '9567d72a-7060-4a1d-b913-7d342aa2b352', '"{\"items\":{\"glock\":\"1\"},\"additional_items\":\"\",\"email_subject\":\"\"}"', false, '2025-10-27 10:59:22.896185+00', 'simple', '2025-10-27 11:00:00+00'),
	('9d1e7d79-bdf8-4a97-a28f-f74fabbe9353', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', '"{\"items\":{\"Pizza bianca\":\"1\"},\"additional_items\":\"\",\"email_subject\":\"\"}"', true, '2025-11-17 23:27:00.058853+00', 'simple', NULL),
	('d1528d83-23b1-48a2-a61c-244328da2a9e', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', '"{\"items\":{\"Pizza bianca\":\"1\"},\"additional_items\":\"\",\"email_subject\":\"\"}"', true, '2025-11-17 23:29:11.001419+00', 'simple', NULL),
	('da39fa16-1fd4-48e7-af89-4f88c827172d', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', '"{\"items\":{\"Pizza bianca\":\"1\"},\"additional_items\":\"\",\"email_subject\":\"\"}"', true, '2025-10-28 02:05:34.383081+00', 'simple', '2025-10-28 02:15:00+00'),
	('8fc23383-7153-4be3-b6ac-bb4e73ebdac7', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', '"{\"items\":{\"Pizza bianca\":\"1\"},\"additional_items\":\"\",\"email_subject\":\"\"}"', true, '2025-11-17 23:18:25.538879+00', 'simple', '2025-11-17 23:30:00+00'),
	('bca387ea-28aa-4574-8d59-a9c3702f9187', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'f5304bc9-32bf-486e-8d34-d719028d51f4', '"{\"items\":{\"Pepe Bustine\":\"3\"},\"additional_items\":\"\",\"email_subject\":\"Per Ruben Srl entro le 10: \"}"', true, '2025-10-29 18:11:07.125416+00', 'simple', '2025-10-29 18:15:00+00'),
	('7b55f5d7-ccf7-4f51-b7da-d2bb30a28e8d', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'c92614fe-d6e6-4b10-9dd9-2101e25ee96f', '"{\"items\":{\"Fuselli Panati\":\"4\"},\"additional_items\":\"\",\"email_subject\":\"\"}"', true, '2025-10-29 18:26:15.062904+00', 'simple', '2025-10-29 18:30:00+00'),
	('8506e666-1c28-47c6-aa57-5575a728248e', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', '"{\"items\":{\"Pizza bianca\":\"7\"},\"additional_items\":\"\",\"email_subject\":\"\"}"', true, '2025-11-14 01:11:10.209928+00', 'simple', '2025-11-14 01:15:00+00'),
	('9655d476-9ee3-4646-bc63-2d83c0f824e4', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'df99037c-1085-4760-bbbf-cac576ba9e6f', '"{\"items\":{\"Zucchine\":\"2\"},\"additional_items\":\"\",\"email_subject\":\"\"}"', true, '2025-11-14 11:12:53.985051+00', 'simple', '2025-11-14 11:15:00+00'),
	('cd2a8498-a0ed-4865-beac-245cde3034bb', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', '"{\"items\":{\"Peperoncino olio\":\"Serve\"},\"additional_items\":\"\",\"email_subject\":\"\"}"', true, '2025-11-17 22:05:13.274997+00', 'simple', '2025-11-17 22:30:00+00'),
	('204a99bf-3897-4117-b468-f860dc0d1261', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'df99037c-1085-4760-bbbf-cac576ba9e6f', '"{\"items\":{\"Grappolo\":\"1 cassa \",\"Cipolla Bianca\":\"1 cassa\"},\"additional_items\":\"\",\"email_subject\":\"\"}"', true, '2025-11-17 22:05:13.582317+00', 'simple', '2025-11-17 22:30:00+00'),
	('01eca1d2-3c60-430e-8e66-239364e29297', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', '"{\"items\":{\"Pizza bianca\":\"1\"},\"additional_items\":\"\",\"email_subject\":\"\"}"', true, '2025-11-18 00:36:12.62828+00', 'simple', '2025-11-18 00:45:00+00'),
	('38901df2-0736-45c5-b901-cac69333907c', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', '"{\"items\":{\"Pizza bianca\":\"1\"},\"additional_items\":\"\",\"email_subject\":\"\"}"', true, '2025-11-18 00:58:54.757011+00', 'simple', '2025-11-18 01:00:00+00'),
	('0078f580-e79e-47d2-8f6c-08698590e4ba', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', '"{\"items\":{\"Pizza bianca\":\"1\"},\"additional_items\":\"\",\"email_subject\":\"\"}"', true, '2025-11-18 00:37:30.457273+00', 'simple', NULL),
	('f83b595a-9285-44dd-918e-4988f334bcf3', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', '"{\"items\":{\"Pizza bianca\":\"1\"},\"additional_items\":\"\",\"email_subject\":\"\"}"', true, '2025-11-18 00:43:21.077033+00', 'simple', NULL),
	('7e51725f-7c75-4a40-875a-319536979d3b', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', '"{\"items\":{\"Pizza bianca\":\"1\"},\"additional_items\":\"\",\"email_subject\":\"\"}"', true, '2025-11-18 01:57:45.870334+00', 'simple', '2025-11-18 02:00:00+00'),
	('f562149a-d739-449f-b203-b4b79cfa6199', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', '"{\"items\":{\"Pizza bianca\":\"4\"},\"additional_items\":\"\",\"email_subject\":\"\"}"', true, '2025-11-27 23:25:17.216536+00', 'simple', '2025-11-27 23:30:00+00'),
	('7fe4b12d-37a9-4f91-8cd6-a40d56ab5e0d', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', '377eb876-bdd8-417e-b7c4-c473371e9edf', '"{\"items\":{\"Peperoncino olio\":\"1\"},\"additional_items\":\"\",\"email_subject\":\"\"}"', true, '2025-11-18 13:52:48.989207+00', 'simple', NULL),
	('d0dc1118-126e-44be-a308-744054123b44', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', '"{\"items\":{\"Pizza bianca\":\"1\"},\"additional_items\":\"\",\"email_subject\":\"\"}"', true, '2025-11-19 16:39:33.907795+00', 'simple', NULL),
	('d4809e3f-e17d-433a-be01-e13f1036cc35', 'c23a8c58-925a-47ce-9491-9e0db8b5c16a', 'a54ab5d3-bcc0-49dd-80cc-00e88e4fdfbb', '"{\"items\":{\"Pizza bianca\":\"1\"},\"additional_items\":\"\",\"email_subject\":\"\"}"', true, '2025-11-19 16:39:43.198087+00', 'simple', NULL);


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: buckets_analytics; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: buckets_vectors; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: prefixes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: vector_indexes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('"auth"."refresh_tokens_id_seq"', 879, true);


--
-- Name: push_subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."push_subscriptions_id_seq"', 27, true);


--
-- PostgreSQL database dump complete
--

-- \unrestrict Wj1Pl7CSiSc3uV4eZuWIDhKNysMsU2rEDPOtyEPc1C2qubG7nVR3KMz3auyHkgI

RESET ALL;
