/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author SONPC
 */
public class Imformation {
     private long informationID;
    private String logo;
    private String hotline;
    private String facebook;
    private String linkfacebook;
    private String timeopen;
    private String address;
    private String email;
    private String sitename;
    private String mota;
    private String icon;
    private String keyword;
    private String googleapi;
    private String xlocation;
    private String ylocation;
    private boolean hotshow;
    private boolean newshow;
    private boolean topweekshow;
    
    public  Imformation(){
        
    }

    public Imformation(long informationID, String logo, String hotline, String facebook, String linkfacebook, String timeopen, String address, String email, String sitename, String mota, String icon, String keyword, String googleapi, String xlocation, String ylocation, boolean hotshow, boolean newshow, boolean topweekshow) {
        this.informationID = informationID;
        this.logo = logo;
        this.hotline = hotline;
        this.facebook = facebook;
        this.linkfacebook = linkfacebook;
        this.timeopen = timeopen;
        this.address = address;
        this.email = email;
        this.sitename = sitename;
        this.mota = mota;
        this.icon = icon;
        this.keyword = keyword;
        this.googleapi = googleapi;
        this.xlocation = xlocation;
        this.ylocation = ylocation;
        this.hotshow = hotshow;
        this.newshow = newshow;
        this.topweekshow = topweekshow;
    }

    public long getInformationID() {
        return informationID;
    }

    public void setInformationID(long informationID) {
        this.informationID = informationID;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getHotline() {
        return hotline;
    }

    public void setHotline(String hotline) {
        this.hotline = hotline;
    }

    public String getFacebook() {
        return facebook;
    }

    public void setFacebook(String facebook) {
        this.facebook = facebook;
    }

    public String getLinkfacebook() {
        return linkfacebook;
    }

    public void setLinkfacebook(String linkfacebook) {
        this.linkfacebook = linkfacebook;
    }

    public String getTimeopen() {
        return timeopen;
    }

    public void setTimeopen(String timeopen) {
        this.timeopen = timeopen;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSitename() {
        return sitename;
    }

    public void setSitename(String sitename) {
        this.sitename = sitename;
    }

    public String getMota() {
        return mota;
    }

    public void setMota(String mota) {
        this.mota = mota;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getGoogleapi() {
        return googleapi;
    }

    public void setGoogleapi(String googleapi) {
        this.googleapi = googleapi;
    }

    public String getXlocation() {
        return xlocation;
    }

    public void setXlocation(String xlocation) {
        this.xlocation = xlocation;
    }

    public String getYlocation() {
        return ylocation;
    }

    public void setYlocation(String ylocation) {
        this.ylocation = ylocation;
    }

    public boolean getHotshow() {
        return hotshow;
    }

    public void setHotshow(boolean hotshow) {
        this.hotshow = hotshow;
    }

    public boolean getNewshow() {
        return newshow;
    }

    public void setNewshow(boolean newshow) {
        this.newshow = newshow;
    }

    public boolean getTopweekshow() {
        return topweekshow;
    }

    public void setTopweekshow(boolean topweekshow) {
        this.topweekshow = topweekshow;
    }
    
    
}
