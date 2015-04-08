    
	SELECT		p.name AS UserName, 
				p.type_desc AS UserType, 
				CASE WHEN p.is_disabled = 1 THEN 'Yes' END AS [Disabled],
				pp.name AS ServerRole, 
				pp.type_desc AS RoleType,
				p.create_date AS CreateDate,
				p.modify_date AS ModifyDate
 
	FROM		sys.server_role_members roles 
	JOIN		sys.server_principals p ON roles.member_principal_id = p.principal_id 
	JOIN		sys.server_principals pp ON roles.role_principal_id = pp.principal_id

	ORDER BY	p.name