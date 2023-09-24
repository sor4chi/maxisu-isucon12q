DELETE FROM tenant WHERE id > 100;
DELETE FROM visit_history WHERE created_at >= '1654041600';
UPDATE id_generator SET id=2678400000 WHERE stub='a';
ALTER TABLE id_generator AUTO_INCREMENT=2678400000;

-- FROM OUR CODE ---
ALTER TABLE `visit_history` ADD INDEX `tenant_id_competition_id_idx` (`tenant_id`, `competition_id`, `player_id`, `created_at`);
