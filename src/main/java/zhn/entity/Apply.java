package zhn.entity;

import javax.xml.crypto.Data;

/**
 * @Author:zhn
 * @Date:2018/12/22
 */
public class Apply {
    private int id;
    private int tid;//所申请物品在wuping表里的id
    private String userId;//申请人在users表中的id
    private String updatetime;//申请时间
    private int flag;//申请状态：0未确认 1已通过 2未通过
    private String reason;//申请原因
    private String content;//对所申请物品的描述
    private Wuping wuping; //所申请的物品信息
    private User user;    //申请人信息

    public User getUser() {
        return user;
    }

    public void setUser( User user ) {
        this.user = user;
    }

    public Wuping getWuping() {
        return wuping;
    }

    public void setWuping( Wuping wuping ) {
        this.wuping = wuping;
    }

    public int getId() {
        return id;
    }

    public void setId( int id ) {
        this.id = id;
    }

    public int getTid() {
        return tid;
    }

    public void setTid( int tid ) {
        this.tid = tid;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId( String userId ) {
        this.userId = userId;
    }

    public String getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime( String updatetime ) {
        this.updatetime = updatetime;
    }

    public int getFlag() {
        return flag;
    }

    public void setFlag( int flag ) {
        this.flag = flag;
    }

    public String getReason() {
        return reason;
    }

    public void setReason( String reason ) {
        this.reason = reason;
    }

    public String getContent() {
        return content;
    }

    public void setContent( String content ) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "Apply{" +
                "id=" + id +
                ", tid=" + tid +
                ", userId='" + userId + '\'' +
                ", updatetime='" + updatetime + '\'' +
                ", flag=" + flag +
                ", reason='" + reason + '\'' +
                ", content='" + content + '\'' +
                ", wuping=" + wuping +
                ", user=" + user +
                '}';
    }
}
