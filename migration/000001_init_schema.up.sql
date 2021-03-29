/* table user
name
email
lastLogin
 */
CREATE TABLE "coyo_users" (
  "id" Serial PRIMARY KEY,
  "name" VARCHAR, 
  "email" VARCHAR,
  "last_login" TIMESTAMP
);

