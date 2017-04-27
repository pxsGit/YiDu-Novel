package org.yidu.novel.entity;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.yidu.novel.action.InfoAction;
import org.yidu.novel.action.ReaderAction;
import org.yidu.novel.constant.YiDuConstants;
import org.yidu.novel.entity.base.BaseTChapter;

public class TChapter extends BaseTChapter {
    private static final long serialVersionUID = 1L;

    /* [CONSTRUCTOR MARKER BEGIN] */
    public TChapter() {
        super();
    }

    /**
     * Constructor for primary key
     */
    public TChapter(int chapterno) {
        super(chapterno);
    }

    /* [CONSTRUCTOR MARKER END] */

    public Boolean getIsvip() {
        return isIsvip();
    }

    public Boolean getDeleteflag() {
        return isDeleteflag();
    }

    /**
     * 获得子目录 <br>
     * 默认是小说号/1000
     * 
     * @return 子目录
     */
    public Integer getSubdir() {
        return getArticleno() / YiDuConstants.SUB_DIR_ARTICLES;
    }

    /**
     * 获取小说介绍页URL
     * 
     * @return 小说介绍页URL
     */
    public String getInfoUrl() {
        HttpServletResponse response = ServletActionContext.getResponse();
        return response.encodeURL(InfoAction.URL + "?subdir=" + getSubdir() + "&articleno=" + getArticleno());
    }

    /**
     * 获取章节URL
     * 
     * @return 章节URL
     */
    public String getUrl() {
        HttpServletResponse response = ServletActionContext.getResponse();
        String url = response.encodeURL(ReaderAction.URL + "?subdir=" + getSubdir() + "&articleno=" + getArticleno()
                + "&chapterno=" + getChapterno());

        return url;
    }

    /**
     * 获取章节URL
     * 
     * @return 章节URL
     */
    public String getThumbnailUrl() {
        HttpServletResponse response = ServletActionContext.getResponse();
        return response.encodeURL(ReaderAction.URL + "?chapterno=" + getChapterno());
    }

}