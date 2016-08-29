DELIMITER //

CREATE PROCEDURE simplep1 (OUT param1 INT)
BEGIN
	SELECT count(*) FROM user_types;
END//

DELIMITER ;


DELIMITER //

CREATE PROCEDURE simplep2 ()
BEGIN
	SELECT * FROM user_types;
END//

DELIMITER ;




DELIMITER //

CREATE PROCEDURE getRentalDetails (IN nic varchar(10),IN cid int(6))
BEGIN
	SELECT ren_id,usr_first_name,usr_last_name,utp_name,mov_name,ren_date,ren_expected_return_date,ren_fee 
	FROM users,user_types,rentals,movie_copies,movies
	WHERE usr_nic=nic AND usr_utp_id= utp_id AND mcp_id=cid AND 
	;
END//

DELIMITER ;




SELECT usr_first_name,usr_last_name,utp_name
FROM users 
INNER JOIN user_types
ON usr_type_id = utp_id;


DELIMITER //

CREATE PROCEDURE getUserInfo (IN nic varchar(10))
BEGIN
	SELECT * FROM users
	WHERE usr_nic=nic;
END//

DELIMITER ;


DROP PROCEDURE getRentalInfo;
DELIMITER //

CREATE PROCEDURE getRentalInfo (IN nic varchar(10),IN cid varchar(6))
BEGIN
	SELECT * FROM movie_rentals,()
	WHERE ren_user_id 
	IN (SELECT usr_id 
			FROM users
			WHERE usr_nic=nic)
	AND ren_movie_copy_id=cid;

	
END//

DELIMITER ;

