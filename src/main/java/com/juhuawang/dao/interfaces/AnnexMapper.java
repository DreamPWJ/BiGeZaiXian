package com.juhuawang.dao.interfaces;

import com.juhuawang.model.Annex;

import java.util.List;
import java.util.Map;

public interface AnnexMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Annex record);

    int insertSelective(Annex record);

    Annex selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Annex record);

    int updateByPrimaryKey(Annex record);

    /**
     * 批量增加三证信息
     * @param annexlist
     */
    void addBatchAnnex(List<Annex> annexlist);

    /**
     * 查看三证是否上传和状态
     * @param guestId
     * @return
     */
    List<Annex> getAnnexByguestId(long guestId);

    /**
     * 查看三证是否上传成功
     * @param guestId
     * @return
     */
    List<Annex> getSuccessAnnexByguestId(long guestId);


    /**
     * 查看三证是否审核通过成功
     */
    Map<String,Object> getAuditSuccessAnnexByguestId(long guestId);

    /**
     * 我的聚化信息展示
     */

    Map<String,Object> getUserCenter(long guestId);
    /**
     * 基本资料信息展示
     */
    Map<String, Object> getBasicInformation(long userId);
}