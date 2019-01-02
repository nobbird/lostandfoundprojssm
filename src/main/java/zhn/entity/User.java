package zhn.entity;

/**
 * @Author:zhn
 * @Date:2018/12/5
 */
public class User {

        private int id;
        private String username;
        private String userpass;
        private String usernumb;
        private String usertel;
        private String useremail;
        public int getId() {
            return id;
        }
        public void setId(int id) {
            this.id = id;
        }
        public String getUsername() {
            return username;
        }
        public void setUsername(String username) {
            this.username = username;
        }
        public String getUserpass() {
            return userpass;
        }
        public void setUserpass(String userpass) {
            this.userpass = userpass;
        }
        public String getUsernumb() { return usernumb; }
        public void setUsernumb(String usernumb){ this.usernumb=usernumb;}
        public String getUsertel() {
            return usertel;
        }
        public void setUsertel(String usertel){ this.usertel=usertel;}
        public String getUseremail() { return useremail; }
        public void setUseremail(String useremail){this.useremail=useremail;}


    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", userpass='" + userpass + '\'' +
                ", usernumb='" + usernumb + '\'' +
                ", usertel='" + usertel + '\'' +
                ", useremail='" + useremail + '\'' +
                '}';
    }
}
