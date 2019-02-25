UPDATE carshare.`member`
		SET dirver_apply=now()
		WHERE member_no= 1;
		
SELECT member_no,
		kakao_id, naver_id, name, u_intro, d_intro, phone,
		nickname, photo,
		jop, driver, jumin, grade_no, my_fee, email,
		dirver_enrollment, dirver_apply
		FROM carshare.`member`
		WHERE member_no= 1;