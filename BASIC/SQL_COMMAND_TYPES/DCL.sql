-- **Granting SELECT and INSERT Permissions on USERS to John**
-- **Concedendo Permissões SELECT e INSERT em USERS para John**
GRANT SELECT, INSERT ON USERS TO John;

-- **Revoking SELECT Permission on USERS from John**
-- **Revogando Permissão SELECT em USERS de John**
REVOKE SELECT ON USERS FROM John;

-- **Denying DELETE Permission on USERS to Marie**
-- **Negando Permissão DELETE em USERS para Marie**
DENY DELETE ON USERS TO Marie;
