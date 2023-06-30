package com.myproject.mycode.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myproject.mycode.dao.AdminDAO;
import com.myproject.mycode.model.AdminModel;
import com.myproject.mycode.model.MemberModel;

@Service
public class AdminService {
	
	@Autowired
	private AdminDAO dao;
	
	public AdminModel adminCheck(String admin_id) {
		// TODO Auto-generated method stub
		return dao.adminCheck(admin_id);
	}

	public List<MemberModel> getMemberList(MemberModel users) {
		// TODO Auto-generated method stub
		return dao.getMemberList(users);
	}

	public int getMemberCount(MemberModel users) {
		// TODO Auto-generated method stub
		return dao.getMemberCount(users);
	}

	public MemberModel getMember(String id) {
		// TODO Auto-generated method stub
		return dao.getMember(id);
	}

	public void userDelete(String id) {
		// TODO Auto-generated method stub
		dao.userDelete(id);
	}

	public int getMemberNormalCount(MemberModel users) {
		// TODO Auto-generated method stub
		return dao.getMemberNormalCount(users);
	}

	public int getMemberbanCount(MemberModel users) {
		// TODO Auto-generated method stub
		return dao.getMemberbanCount(users);
	}

	public List<MemberModel> getMemberNormalList(MemberModel users) {
		// TODO Auto-generated method stub
		return dao.getMemberNormalList(users);
	}

	public List<MemberModel> getMemberBanList(MemberModel users) {
		// TODO Auto-generated method stub
		return dao.getMemberBanList(users);
	}

	public void deleteUserSingo(String nick) {
		// TODO Auto-generated method stub
		dao.deleteUserSingo(nick);
	}

}
