-- 트레이너 자동 탈퇴 프로시저
create or replace procedure auto_delete_trainer
is begin
    
    update tb_trainer set trainer_etr = 'Q' 
    where tb_trainer.trainer_no in (select tb_trainer.trainer_no
                from tb_trainer 
                where tb_trainer.trainer_no in (select t.trainer_no
                from tb_trainer t inner join tb_pt p on t.trainer_no = p.trainer_no
                inner join tb_pt_calendar c on p.pt_no = c.pt_no
                where pt_calendar_reservation_state = 'T' and trainer_etr ='I'
                group by t.trainer_no
                having max(c.pt_calendar_start_time) < sysdate));

    commit;
    
    update tb_member set member_absence = 'Y', member_leave_date = sysdate
    where member_no in
    (select t.member_no from tb_member m join tb_trainer t on m.member_no = t.member_no where trainer_etr = 'Q');
    
    commit;
    
end;
/