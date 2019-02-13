INSERT INTO carshare.`member`
(id, u_intro, d_intro, phone, nikname, photo, jop, driver, grade_no, my_fee)
VALUES('test', 'test', 'test', 'test', 'test', 'test', 'test', 0, null, 0);


SELECT id, u_intro, d_intro, phone, nikname, photo,
		jop, driver, grade_no, my_fee
		FROM carshare.`member`
		WHERE id='test';