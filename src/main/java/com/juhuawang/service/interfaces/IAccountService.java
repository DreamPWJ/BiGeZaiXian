package com.juhuawang.service.interfaces;

import com.juhuawang.model.Annex;
import com.juhuawang.model.FinanceApply;

import java.util.List;
import java.util.Map;

/**
 * Created by pwj  on 2015/8/10 0010.
 * 账号管理的Service接口
 */
public interface IAccountService {

    /**
     * 批量增加三证信息方法
     *
     * @param urlList
     */
    public void addBatchAnnex(List<String> urlList, long userid);

    /**
     * 查看三证是否上传和状态
     *
     * @param guestId
     * @return
     */
    List<Annex> getAnnexByguestId(long guestId);

    /**
     * 查看三证是否上传成功
     *
     * @param guestId
     * @return
     */
    List<Annex> getSuccessAnnexByguestId(long guestId);

    /**
     * 查看三证是否审核通过成功
     */
    Map<String, Object> getAuditSuccessAnnexByguestId(long guestId);

    /**
     * 我的聚化信息展示
     */

    Map<String, Object> getUserCenter(long guestId);

    /**
     * 基本资料信息展示
     */
    Map<String, Object> getBasicInformation(long userId);

    void saveFinanceApply(FinanceApply financeApply);
}
