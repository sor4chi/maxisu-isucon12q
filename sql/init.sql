DELETE FROM tenant WHERE id > 100;
DELETE FROM visit_history WHERE created_at >= '1654041600';
UPDATE id_generator SET id=2678400000 WHERE stub='a';
ALTER TABLE id_generator AUTO_INCREMENT=2678400000;

-- FROM OUR CODE ---
INSERT INTO visit_history_tmp SELECT * FROM visit_history;
TRUNCATE visit_history;
INSERT INTO visit_history SELECT player_id, tenant_id, competition_id, min(created_at) AS created_at, min(updated_at) AS updated_at FROM visit_history_tmp GROUP BY player_id, tenant_id, competition_id;
ALTER TABLE `visit_history` ADD INDEX `tenant_id_competition_id_idx` (`tenant_id`, `competition_id`, `player_id`, `created_at`);
