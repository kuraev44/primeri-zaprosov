/* Запрос №1. Соединение двух связанных таблиц с объединением для null-значений и отбором значений по одному из неключевых полей*/
SELECT 
    racer.name, racing_team.name, racing_team.sponor
FROM
    racer,
    racing_team
WHERE
    racer.racing_team_idracing_team = racing_team.idracing_team and racing_team.sponor='Русал'
UNION SELECT 
    racer.name, ' ', ' '
FROM
    racer
WHERE
    racer.racing_team_idracing_team IS NULL;
    
/*Запрос №2. Соединение трёх таблиц с отбором значений по одному из неключевых полей*/
SELECT 
    racing_team.name as 'Команда', place as 'Место на этапе', result as 'Очки на этапе', start as 'Дата начала этапа'
FROM
    racing.racing_team_has_stage,
    racing_team,
    stage
WHERE
    racing_team.idracing_team = racing_team_has_stage.racing_team_idracing_team
        AND stage.idstage = racing_team_has_stage.stage_idstage
        AND stage.`year` = '2025-01-01'
        order by 2;
        
/*Запрос №3. Запрос со связью гонщиков с командой, которая участвует в конкретных этапах (отбор при помощи оператора IN)*/
        
SELECT 
    *
FROM
    racer,
    racing_team_has_stage,
    stage
WHERE
    racing_team_has_stage.racing_team_idracing_team = racer.racing_team_idracing_team
        AND racing_team_has_stage.stage_idstage = stage.idstage
        AND stage_idstage IN (1 , 3);