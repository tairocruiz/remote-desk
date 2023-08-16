CREATE TABLE [academic_departments] (
  [id] bigint(20) PRIMARY KEY NOT NULL,
  [name] varchar(180) NOT NULL,
  [HOD] varchar(100) DEFAULT (NULL),
  [contact] varchar(15) NOT NULL,
  [created_at] timestamp DEFAULT (NULL),
  [updated_at] timestamp DEFAULT (NULL)
)
GO

CREATE TABLE [academic_supervisors] (
  [id] bigint(20) PRIMARY KEY NOT NULL,
  [status] tinyint(1) NOT NULL,
  [capacity] int(10) DEFAULT (NULL),
  [user_id] bigint(20) NOT NULL,
  [created_at] timestamp DEFAULT (NULL),
  [updated_at] timestamp DEFAULT (NULL)
)
GO

CREATE TABLE [activity_log] (
  [id] bigint(20) PRIMARY KEY NOT NULL,
  [log_name] varchar(255) DEFAULT (NULL),
  [description] text NOT NULL,
  [subject_type] varchar(255) DEFAULT (NULL),
  [event] varchar(255) DEFAULT (NULL),
  [subject_id] bigint(20) DEFAULT (NULL),
  [causer_type] varchar(255) DEFAULT (NULL),
  [causer_id] bigint(20) DEFAULT (NULL),
  [properties] longtext DEFAULT (NULL),
  [batch_uuid] char(36) DEFAULT (NULL),
  [created_at] timestamp DEFAULT (NULL),
  [updated_at] timestamp DEFAULT (NULL)
)
GO

CREATE TABLE [documents] (
  [id] bigint(20) PRIMARY KEY NOT NULL,
  [name] varchar(120) NOT NULL,
  [slug] varchar(120) NOT NULL,
  [descriptions] text NOT NULL,
  [docs_path] varchar(255) NOT NULL,
  [created_at] timestamp DEFAULT (NULL),
  [updated_at] timestamp DEFAULT (NULL)
)
GO

CREATE TABLE [industrial_departments] (
  [id] bigint(20) PRIMARY KEY NOT NULL,
  [name] varchar(100) NOT NULL,
  [descriptions] mediumtext DEFAULT (NULL),
  [created_at] timestamp DEFAULT (NULL),
  [updated_at] timestamp DEFAULT (NULL)
)
GO

CREATE TABLE [industrial_logs] (
  [id] bigint(20) PRIMARY KEY NOT NULL,
  [student_id] bigint(20) NOT NULL,
  [date] timestamp NOT NULL DEFAULT (current_timestamp()),
  [description] text NOT NULL,
  [photo] varchar(255) DEFAULT (NULL),
  [status] nvarchar(255) NOT NULL CHECK ([status] IN ('approved', 'remarked', 'pending')) NOT NULL,
  [created_at] timestamp DEFAULT (NULL),
  [updated_at] timestamp DEFAULT (NULL)
)
GO

CREATE TABLE [industrial_supervisors] (
  [id] bigint(20) PRIMARY KEY NOT NULL,
  [status] tinyint(1) NOT NULL,
  [phone] varchar(15) DEFAULT (NULL),
  [user_id] bigint(20) NOT NULL,
  [created_at] timestamp DEFAULT (NULL),
  [updated_at] timestamp DEFAULT (NULL)
)
GO

CREATE TABLE [locations] (
  [id] bigint(20) PRIMARY KEY NOT NULL,
  [region] varchar(80) NOT NULL,
  [district] varchar(80) NOT NULL,
  [ward] varchar(80) DEFAULT (NULL),
  [created_at] timestamp DEFAULT (NULL),
  [updated_at] timestamp DEFAULT (NULL)
)
GO

CREATE TABLE [operates] (
  [id] bigint(20) PRIMARY KEY NOT NULL,
  [industrial_department_id] bigint(20) NOT NULL,
  [site_id] bigint(20) NOT NULL,
  [created_at] timestamp DEFAULT (NULL),
  [updated_at] timestamp DEFAULT (NULL)
)
GO

CREATE TABLE [organisations] (
  [id] bigint(20) PRIMARY KEY NOT NULL,
  [name] varchar(100) NOT NULL,
  [created_at] timestamp DEFAULT (NULL),
  [updated_at] timestamp DEFAULT (NULL)
)
GO

CREATE TABLE [permissions] (
  [id] bigint(20) PRIMARY KEY NOT NULL,
  [name] varchar(255) NOT NULL,
  [guard_name] varchar(255) NOT NULL,
  [created_at] timestamp DEFAULT (NULL),
  [updated_at] timestamp DEFAULT (NULL)
)
GO

CREATE TABLE [programmes] (
  [id] bigint(20) PRIMARY KEY NOT NULL,
  [name] varchar(120) NOT NULL,
  [short_code] varchar(4) NOT NULL,
  [level] varchar(120) NOT NULL,
  [academic_department_id] bigint(20) NOT NULL,
  [created_at] timestamp DEFAULT (NULL),
  [updated_at] timestamp DEFAULT (NULL)
)
GO

CREATE TABLE [project_logs] (
  [id] bigint(20) PRIMARY KEY NOT NULL,
  [student_id] bigint(20) NOT NULL,
  [date] date NOT NULL,
  [descriptions] text NOT NULL,
  [next_step] varchar(120) DEFAULT (NULL),
  [attachment] varchar(120) DEFAULT (NULL),
  [photo] varchar(120) DEFAULT (NULL),
  [status] nvarchar(255) NOT NULL CHECK ([status] IN ('approved', 'remarked', 'pending')) NOT NULL,
  [created_at] timestamp DEFAULT (NULL),
  [updated_at] timestamp DEFAULT (NULL)
)
GO

CREATE TABLE [report_attachments] (
  [id] bigint(20) PRIMARY KEY NOT NULL,
  [student_id] bigint(20) NOT NULL,
  [attachment_path] varchar(180) NOT NULL,
  [created_at] timestamp DEFAULT (NULL),
  [updated_at] timestamp DEFAULT (NULL)
)
GO

CREATE TABLE [roles] (
  [id] bigint(20) PRIMARY KEY NOT NULL,
  [name] varchar(255) NOT NULL,
  [guard_name] varchar(255) NOT NULL,
  [created_at] timestamp DEFAULT (NULL),
  [updated_at] timestamp DEFAULT (NULL)
)
GO

CREATE TABLE [role_has_permissions] (
  [permission_id] bigint(20) NOT NULL,
  [role_id] bigint(20) NOT NULL,
  PRIMARY KEY ([permission_id], [role_id])
)
GO

CREATE TABLE [sites] (
  [id] bigint(20) PRIMARY KEY NOT NULL,
  [location_id] bigint(20) NOT NULL,
  [organisation_id] bigint(20) NOT NULL,
  [created_at] timestamp DEFAULT (NULL),
  [updated_at] timestamp DEFAULT (NULL)
)
GO

CREATE TABLE [students] (
  [id] bigint(20) PRIMARY KEY NOT NULL,
  [phone] varchar(15) NOT NULL,
  [year] int(1) DEFAULT (NULL),
  [user_id] bigint(20) NOT NULL,
  [programme_id] bigint(20) NOT NULL,
  [task_id] bigint(20) DEFAULT (NULL),
  [academic_supervisor_id] bigint(20) NOT NULL,
  [industrial_supervisor_id] bigint(20) DEFAULT (NULL),
  [operate_id] bigint(20) DEFAULT (NULL),
  [created_at] timestamp DEFAULT (NULL),
  [updated_at] timestamp DEFAULT (NULL)
)
GO

CREATE TABLE [tasks] (
  [id] bigint(20) PRIMARY KEY NOT NULL,
  [name] varchar(100) NOT NULL,
  [status] tinyint(1) NOT NULL,
  [created_at] timestamp DEFAULT (NULL),
  [updated_at] timestamp DEFAULT (NULL)
)
GO

CREATE TABLE [users] (
  [id] bigint(20) PRIMARY KEY NOT NULL,
  [role_id] bigint(20) DEFAULT (NULL),
  [name] varchar(100) DEFAULT (NULL),
  [username] varchar(100) NOT NULL,
  [email] varchar(100) DEFAULT (NULL),
  [password] varchar(255) NOT NULL,
  [email_verified_at] timestamp DEFAULT (NULL),
  [remember_token] varchar(100) DEFAULT (NULL),
  [created_at] timestamp DEFAULT (NULL),
  [updated_at] timestamp DEFAULT (NULL)
)
GO

ALTER TABLE [academic_supervisors] ADD FOREIGN KEY ([user_id]) REFERENCES [users] ([id]) ON DELETE NO ACTION ON UPDATE CASCADE
GO

ALTER TABLE [industrial_logs] ADD FOREIGN KEY ([student_id]) REFERENCES [students] ([id]) ON DELETE NO ACTION ON UPDATE CASCADE
GO

ALTER TABLE [industrial_supervisors] ADD FOREIGN KEY ([user_id]) REFERENCES [users] ([id]) ON DELETE NO ACTION ON UPDATE CASCADE
GO

ALTER TABLE [operates] ADD FOREIGN KEY ([industrial_department_id]) REFERENCES [industrial_departments] ([id]) ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE [operates] ADD FOREIGN KEY ([site_id]) REFERENCES [sites] ([id]) ON DELETE NO ACTION ON UPDATE CASCADE
GO

ALTER TABLE [programmes] ADD FOREIGN KEY ([academic_department_id]) REFERENCES [academic_departments] ([id]) ON DELETE NO ACTION ON UPDATE CASCADE
GO

ALTER TABLE [project_logs] ADD FOREIGN KEY ([student_id]) REFERENCES [students] ([id]) ON DELETE NO ACTION ON UPDATE CASCADE
GO

ALTER TABLE [report_attachments] ADD FOREIGN KEY ([student_id]) REFERENCES [students] ([id]) ON DELETE NO ACTION ON UPDATE CASCADE
GO

ALTER TABLE [role_has_permissions] ADD FOREIGN KEY ([permission_id]) REFERENCES [permissions] ([id]) ON DELETE CASCADE
GO

ALTER TABLE [role_has_permissions] ADD FOREIGN KEY ([role_id]) REFERENCES [roles] ([id]) ON DELETE CASCADE
GO

ALTER TABLE [sites] ADD FOREIGN KEY ([location_id]) REFERENCES [locations] ([id]) ON DELETE NO ACTION ON UPDATE CASCADE
GO

ALTER TABLE [sites] ADD FOREIGN KEY ([organisation_id]) REFERENCES [organisations] ([id]) ON DELETE NO ACTION ON UPDATE CASCADE
GO

ALTER TABLE [students] ADD FOREIGN KEY ([user_id]) REFERENCES [users] ([id]) ON DELETE NO ACTION ON UPDATE CASCADE
GO

ALTER TABLE [students] ADD FOREIGN KEY ([programme_id]) REFERENCES [programmes] ([id]) ON DELETE NO ACTION ON UPDATE CASCADE
GO

ALTER TABLE [students] ADD FOREIGN KEY ([task_id]) REFERENCES [tasks] ([id]) ON DELETE NO ACTION ON UPDATE CASCADE
GO

ALTER TABLE [students] ADD FOREIGN KEY ([academic_supervisor_id]) REFERENCES [academic_supervisors] ([id]) ON DELETE NO ACTION ON UPDATE CASCADE
GO

ALTER TABLE [students] ADD FOREIGN KEY ([industrial_supervisor_id]) REFERENCES [industrial_supervisors] ([id]) ON DELETE NO ACTION ON UPDATE CASCADE
GO

ALTER TABLE [students] ADD FOREIGN KEY ([operate_id]) REFERENCES [operates] ([id]) ON DELETE NO ACTION ON UPDATE CASCADE
GO

ALTER TABLE [users] ADD FOREIGN KEY ([role_id]) REFERENCES [roles] ([id]) ON DELETE NO ACTION ON UPDATE CASCADE
GO
