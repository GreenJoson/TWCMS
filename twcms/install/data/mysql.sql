# �û����ɸ��� uid ��Χ���з���
DROP TABLE IF EXISTS pre_user;
CREATE TABLE pre_user (
  uid int(10) unsigned NOT NULL AUTO_INCREMENT,		# �û�ID
  username char(16) NOT NULL DEFAULT '',		# �û���
  password char(32) NOT NULL DEFAULT '',		# ����	md5(md5() + salt)
  salt char(8) NOT NULL DEFAULT '',			# ��������ַ���������������
  groupid smallint(5) unsigned NOT NULL DEFAULT '0',	# �û���
  email char(40) NOT NULL DEFAULT '',			# EMAIL
  homepage char(40) NOT NULL DEFAULT '',		# ��ҳ��URL��������
  intro text NOT NULL,					# ���˽���
  regip int(10) unsigned NOT NULL DEFAULT '0',		# ע��IP
  regdate int(10) unsigned NOT NULL DEFAULT '0',	# ע������
  loginip int(10) unsigned NOT NULL DEFAULT '0',	# ��½IP
  logindate int(10) unsigned NOT NULL DEFAULT '0',	# ��½����
  lastip int(10) unsigned NOT NULL DEFAULT '0',		# �ϴε�½IP
  lastdate int(10) unsigned NOT NULL DEFAULT '0',	# �ϴε�½����
  contents int(10) unsigned NOT NULL DEFAULT '0',	# ������
  uploads int(10) unsigned NOT NULL DEFAULT '0',	# �ϴ���
  comments int(10) unsigned NOT NULL DEFAULT '0',	# ������
  logins int(10) unsigned NOT NULL DEFAULT '0',		# ��½��
  PRIMARY KEY (uid),
  UNIQUE KEY username(username),
  KEY email(email)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

# ��̨�����û����
DROP TABLE IF EXISTS pre_user_group;
CREATE TABLE pre_user_group (
  groupid smallint(5) unsigned NOT NULL AUTO_INCREMENT,		# �û���ID
  groupname char(20) NOT NULL DEFAULT '',			# �û�����
  system tinyint(1) unsigned NOT NULL DEFAULT '0',		# �Ƿ���ϵͳ���� (1Ϊϵͳ���壬0Ϊ�Զ���)
  purviews text NOT NULL,					# ��̨Ȩ�� (Ϊ��ʱ������)
  PRIMARY KEY (groupid)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

# �ϴ�������
DROP TABLE IF EXISTS pre_attach;
CREATE TABLE pre_attach (
  aid int(10) unsigned NOT NULL AUTO_INCREMENT,		# ����ID
  cid smallint(5) unsigned NOT NULL DEFAULT '0',	# ����ID
  mid tinyint(1) unsigned NOT NULL DEFAULT '0',		# ģ��ID
  uid int(10) unsigned NOT NULL DEFAULT '0',		# �û�ID
  id int(10) unsigned NOT NULL DEFAULT '0',		# ����ID
  filename char(80) NOT NULL DEFAULT '',		# �ļ�ԭ��
  filetype char(7) NOT NULL DEFAULT '',			# �ļ�����
  filesize int(10) unsigned NOT NULL DEFAULT '0',	# �ļ���С
  filepath char(150) NOT NULL DEFAULT '',		# �ļ�·��
  dateline int(10) unsigned NOT NULL DEFAULT '0',	# �ϴ�ʱ��
  downloads int(10) unsigned NOT NULL DEFAULT '0',	# ���ش���
  isimage tinyint(1) unsigned NOT NULL DEFAULT '0',	# �Ƿ���ͼƬ (1ΪͼƬ��0Ϊ�ļ�����Ҫ�����Ƿ��ǿ����صĸ���)
  PRIMARY KEY (aid),
  KEY id (id, aid),
  KEY uid (uid, aid)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

# ������Ŀ��
DROP TABLE IF EXISTS pre_category;
CREATE TABLE pre_category (
  cid smallint(5) unsigned NOT NULL AUTO_INCREMENT,	# ����ID
  mid tinyint(1) unsigned NOT NULL DEFAULT '0',		# ����ģ��ID
  type tinyint(1) unsigned NOT NULL DEFAULT '0',	# �������� (1Ϊ�б�2ΪƵ����3Ϊ����)
  upid int(10) NOT NULL DEFAULT '0',			# �ϼ�ID
  name char(30) NOT NULL DEFAULT '',			# ��������
  alias char(50) NOT NULL DEFAULT '',			# Ψһ���� (���ֻ����Ӣ�ġ����֡��»��ߣ����Ҳ�����50���ַ�������α��̬)
  intro char(255) NOT NULL DEFAULT '',			# �������
  cate_tpl char(80) NOT NULL DEFAULT '',		# ����ҳģ��
  show_tpl char(80) NOT NULL DEFAULT '',		# ����ҳģ��
  count int(10) unsigned NOT NULL DEFAULT '0',		# ������
  orderby smallint(5) NOT NULL DEFAULT '0',		# ����
  seo_title char(80) NOT NULL DEFAULT '',		# SEO����
  seo_keywords char(80) NOT NULL DEFAULT '',		# SEO�ؼ���
  seo_description char(150) NOT NULL DEFAULT '',	# SEO����
  PRIMARY KEY (cid),
  UNIQUE KEY alias (alias)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

# ����ģ�ͱ�
DROP TABLE IF EXISTS pre_model;
CREATE TABLE pre_model (
  mid tinyint(1) unsigned NOT NULL AUTO_INCREMENT,	# ģ��ID (���������ȫվ��Ӧ�ó���255��ģ��)
  name char(10) NOT NULL DEFAULT '',			# ģ������
  tablename char(20) NOT NULL DEFAULT '',		# ģ�ͱ��� (��: tw_cms_xxx)
  index_tpl char(80) NOT NULL DEFAULT '',		# Ĭ��Ƶ��ҳģ��
  cate_tpl char(80) NOT NULL DEFAULT '',		# Ĭ���б�ҳģ��
  show_tpl char(80) NOT NULL DEFAULT '',		# Ĭ������ҳģ��
  system tinyint(1) unsigned NOT NULL DEFAULT '0',	# �Ƿ���ϵͳ���� (1Ϊϵͳ���壬0Ϊ�Զ���)
  PRIMARY KEY (mid),
  UNIQUE KEY tablename (tablename)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

# Ψһ����������α��̬ (ֻ�������ݵı�������������������� kv ��)
DROP TABLE IF EXISTS pre_unique_alias;
CREATE TABLE pre_unique_alias (
  alias char(50) NOT NULL,				# Ψһ���� (ֻ����Ӣ�ġ����֡��»���)
  mid tinyint(1) unsigned NOT NULL DEFAULT '0',		# ģ��ID
  id int(10) unsigned NOT NULL DEFAULT '0',		# ����ID
  PRIMARY KEY (alias)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

# ��ҳ��
DROP TABLE IF EXISTS pre_cms_page;
CREATE TABLE pre_cms_page (
  cid smallint(5) unsigned NOT NULL,			# ����ID
  content mediumtext NOT NULL,				# ��ҳ����
  PRIMARY KEY (cid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

# ���±� (�ɸ��� id ��Χ����)
DROP TABLE IF EXISTS pre_cms_article;
CREATE TABLE pre_cms_article (
  cid smallint(5) unsigned NOT NULL DEFAULT '0',	# ����ID (���/��ʱ�����ȿ��ǵ������һ�ű�)
  id int(10) unsigned NOT NULL AUTO_INCREMENT,		# ����ID
  title char(80) NOT NULL DEFAULT '',			# ����
  color char(6) NOT NULL DEFAULT '',			# ������ɫ
  alias char(50) NOT NULL DEFAULT '',			# Ӣ�ı��� (����α��̬)
  tags varchar(80) NOT NULL DEFAULT '',			# tags���� (,�ŷָ�)
  intro varchar(255) NOT NULL DEFAULT '',		# ���ݽ���
  pic varchar(255) NOT NULL DEFAULT '',			# ͼƬ��ַ
  uid int(10) unsigned NOT NULL DEFAULT '0',		# �û�ID
  author varchar(20) NOT NULL DEFAULT '',		# ����
  source varchar(150) NOT NULL DEFAULT '',		# ��Դ
  dateline int(10) unsigned NOT NULL DEFAULT '0',	# ����ʱ��
  lasttime int(10) unsigned NOT NULL DEFAULT '0',	# ����ʱ��
  ip int(10) unsigned NOT NULL DEFAULT '0',		# IP
  type tinyint(1) unsigned NOT NULL DEFAULT '0',	# ���� (0Ϊ���� 1Ϊ���� 2Ϊ�ݸ� 3Ϊ����)
  iscomment tinyint(1) unsigned NOT NULL DEFAULT '0',	# �Ƿ��ֹ���� (1Ϊ��ֹ 0Ϊ����)
  comments int(10) unsigned NOT NULL DEFAULT '0',	# ������
  seo_title varchar(80) NOT NULL DEFAULT '',		# SEO����/������
  seo_keywords varchar(80) NOT NULL DEFAULT '',		# SEO�ؼ��� (û��дʱ��ȡtags)
  seo_description varchar(255) NOT NULL DEFAULT '',	# SEO���� (û��дʱ��ȡ����ժҪ)
  PRIMARY KEY  (id),
  KEY cid_id (cid,id),
  KEY cid_dateline (cid,dateline)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

# �������ݱ� (�������ֶα��ɸ��� id ��Χ����)
DROP TABLE IF EXISTS pre_cms_article_data;
CREATE TABLE pre_cms_article_data (
  id int(10) unsigned NOT NULL DEFAULT '0',		# ����ID
  content mediumtext NOT NULL,				# ����
  PRIMARY KEY  (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

# ���²鿴�����������������дѹ��
DROP TABLE IF EXISTS pre_cms_article_views;
CREATE TABLE pre_cms_article_views (
  id int(10) unsigned NOT NULL DEFAULT '0',		# ����ID
  cid smallint(5) unsigned NOT NULL DEFAULT '0',	# ����ID
  views int(10) unsigned NOT NULL DEFAULT '0',		# �鿴����
  PRIMARY KEY  (id),
  KEY cid (cid,views),
  KEY views (views)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

# ����������۱�����ʹ�ã�������С�������� (������ʱ��д��)
DROP TABLE IF EXISTS pre_cms_article_lastcomment;
CREATE TABLE pre_cms_article_lastcomment (
  id int(10) unsigned NOT NULL DEFAULT '0',		# ����ID
  cid smallint(5) unsigned NOT NULL DEFAULT '0',	# ����ID
  lastdate int(10) unsigned NOT NULL DEFAULT '0',	# �ظ�ʱ��
  PRIMARY KEY  (id),
  KEY cid (cid,lastdate),
  KEY lastdate (lastdate)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

# �������۱�
DROP TABLE IF EXISTS pre_cms_article_comment;
CREATE TABLE pre_cms_article_comment (
  id int(10) unsigned NOT NULL DEFAULT '0',		# ����ID (Ϊ��ʱ����ʾ��ǰ̨,��δ���)
  commentid int(10) unsigned NOT NULL AUTO_INCREMENT,	# ����ID
  uid int(10) unsigned NOT NULL DEFAULT '0',		# �û�ID
  author char(30) NOT NULL DEFAULT '',			# ���ߣ����ܲ����� username
  content text NOT NULL,				# ��������
  ip int(10) unsigned NOT NULL DEFAULT '0',		# IP
  dateline int(10) unsigned NOT NULL DEFAULT '0',	# ����ʱ��
  PRIMARY KEY  (id,commentid),
  KEY ip (ip,id)	# ����������ˮ���
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

# ���±�ǩ��
DROP TABLE IF EXISTS pre_cms_article_tag;
CREATE TABLE pre_cms_article_tag (
  tagid int(10) unsigned NOT NULL AUTO_INCREMENT,	# tagID
  name char(10) NOT NULL DEFAULT '',			# tag����
  count int(10) unsigned NOT NULL DEFAULT '0',		# tag����
  content text NOT NULL,				# tag����
  PRIMARY KEY  (tagid),
  UNIQUE KEY name (name)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

# ���±�ǩ���ݱ�
DROP TABLE IF EXISTS pre_cms_article_tag_data;
CREATE TABLE pre_cms_article_tag_data (
  tagid int(10) unsigned NOT NULL,			# tagID
  id int(10) unsigned NOT NULL DEFAULT '0',		# ����ID
  PRIMARY KEY  (tagid,id)				# ����Ҫ��id
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

# �־ñ���� key value ���� (����������Ϣ)
DROP TABLE IF EXISTS pre_kv;
CREATE TABLE pre_kv (
  k char(32) NOT NULL DEFAULT '',			# ����
  v text NOT NULL DEFAULT '',				# ����
  expiry int(10) unsigned NOT NULL DEFAULT '0',		# ����ʱ��
  PRIMARY KEY(k)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

# �����
DROP TABLE IF EXISTS pre_cache;
CREATE TABLE pre_cache (
  k char(32) NOT NULL DEFAULT '',			# ����
  v text NOT NULL DEFAULT '',				# ����
  expiry int(10) unsigned NOT NULL DEFAULT '0',		# ����ʱ��
  PRIMARY KEY(k)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

# ��¼�������������
DROP TABLE IF EXISTS pre_framework_count;
CREATE TABLE pre_framework_count (
  name char(32) NOT NULL DEFAULT '',			# ����
  count int(10) unsigned NOT NULL DEFAULT '0',		# ������
  PRIMARY KEY (name)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

# ��¼����������ID
DROP TABLE IF EXISTS pre_framework_maxid;
CREATE TABLE pre_framework_maxid (
  name char(32) NOT NULL DEFAULT '',			# ����
  maxid int(10) unsigned NOT NULL DEFAULT '0',		# ���ID
  PRIMARY KEY (name)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;