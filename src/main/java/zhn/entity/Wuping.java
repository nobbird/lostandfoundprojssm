package zhn.entity;

/**
 * @Author:zhn
 * @Date:2018/12/10
 */

import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;

/**
 * 商品实体类
 */
public class Wuping implements Serializable {
    private int id;
    private int flag;//用来区分发布的是失物还是招领，0代表失物，1代表招领
    private String userId;//发布者id
    private String title;//发布启事的标题
    private String content;//启事内容
    private String types;//东西类型
    private String losttime;//东西丢失或者捡到的时间
    private String updatetime;//启事的发布时间
    private String state;//物品状态：0未找到  1已找到  2未被领取 3已被领取
    private String images;//图片路径
    private MultipartFile file;
    private User user;


    public int getId() {

        return id;
    }

    public void setId( int id ) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId( String userId ) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle( String title ) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent( String content ) {
        this.content = content;
    }

    public String getTypes() {
        return types;
    }

    public void setTypes( String types ) {
        this.types = types;
    }

    public String getLosttime() {
        return losttime;
    }

    public void setLosttime( String losttime ) {
        this.losttime = losttime;
    }

    public String getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime( String updatetime ) {
        this.updatetime = updatetime;
    }

    public String getState() {
        return state;
    }

    public void setState( String state ) {
        this.state = state;
    }

    public int getFlag() {
        return flag;
    }

    public void setFlag( int flag ) {
        this.flag = flag;
    }

    public String getImages() {
        return images;
    }

    public void setImages( String images ) {
        this.images = images;
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile( MultipartFile file ) {
        this.file = file;
    }

    public User getUser() {
        return user;
    }

    public void setUser( User user ) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Wuping{" +
                "id=" + id +
                ", flag=" + flag +
                ", userId='" + userId + '\'' +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", types='" + types + '\'' +
                ", losttime='" + losttime + '\'' +
                ", updatetime='" + updatetime + '\'' +
                ", state='" + state + '\'' +
                ", images='" + images + '\'' +
                ", file=" + file +
                ", user=" + user +
                '}';
    }
}
