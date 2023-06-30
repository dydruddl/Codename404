package com.myproject.mycode.dao;

import java.util.List;

import com.myproject.mycode.model.AdminModel;
import com.myproject.mycode.model.MemberModel;

public interface AdminDAO {
	
	public AdminModel adminCheck(String admin_id);

	List<MemberModel> getMemberList(MemberModel users);

	int getMemberCount(MemberModel users);

	MemberModel getMember(String id);

	void userDelete(String id);

	public int getMemberNormalCount(MemberModel users);

	public int getMemberbanCount(MemberModel users);

	public List<MemberModel> getMemberNormalList(MemberModel users);

	public List<MemberModel> getMemberBanList(MemberModel users);

	public void deleteUserSingo(String nick);

	
}
