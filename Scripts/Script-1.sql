create
or replace
view `driverApply` as select
    m.member_no, m.name, m.phone, m.jumin ,m.dirver_apply, c.relationship_carowner,c.insurance_card,c.car_card,l.license_photo
from
    ((`member` `m`
join `car_info` `c` on
    ((`m`.`member_no` = `c`.`member_no`)))
join `license_info` `l` on
    ((`m`.`member_no` = `l`.`member_no`)))
   ORDER BY m.dirver_apply ASC;
    
   
   select * from driverApply;
   
  SELECT member_no, name, phone, jumin, dirver_apply,
		relationship_carowner, insurance_card, car_card, license_photo
		FROM carshare.driverapply;
		
	
SELECT member_no, kakao_id, naver_id, name, u_intro,
		d_intro, phone, nickname, photo, jop, driver, jumin, grade_no, my_fee,
		email, dirver_enrollment, dirver_apply
		FROM carshare.`member`
		WHERE dirver_enrollment is null and dirver_apply is not null;
		
SELECT member_no, car_name, car_number, insurance_date,
		insurance_boonean, relationship_carowner, car_owner, insurance_card,
		car_card
		FROM carshare.car_info
		WHERE member_no = #{memberNo} AND
		car_name ='';