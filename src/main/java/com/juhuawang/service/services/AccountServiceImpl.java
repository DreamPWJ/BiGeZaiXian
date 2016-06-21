package com.juhuawang.service.services;

import com.juhuawang.dao.interfaces.AnnexMapper;
import com.juhuawang.dao.interfaces.FinanceApplyMapper;
import com.juhuawang.model.Annex;
import com.juhuawang.model.FinanceApply;
import com.juhuawang.service.interfaces.IAccountService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by pwj  on 2015/8/10 0010.
 * 账号管理的Service接口的实现类
 */
@Service
public class AccountServiceImpl implements IAccountService {

    @Resource
    AnnexMapper annexMapper;
    @Resource
    FinanceApplyMapper financeApplyMapper;

    /**
     * 批量增加三证信息方法
     *
     * @param urlList
     */
    @Override
    public void addBatchAnnex(List<String> urlList, long userid) {
        List<Annex> annexList = new ArrayList<Annex>();
        int i = 1;
        for (String url : urlList) {
            Annex annex = new Annex();
            annex.setGuestid(userid);
            annex.setAnnexcode("00" + i);
            annex.setCharterurl(url);
            annexList.add(annex);
            i++;
        }
        //批量保存
        annexMapper.addBatchAnnex(annexList);
    }


    /**
     * 查看三证是否上传和状态
     *
     * @param guestId
     * @return
     */
    @Override
    public List<Annex> getAnnexByguestId(long guestId) {
        return annexMapper.getAnnexByguestId(guestId);
    }

    /**
     * 查看三证是否上传成功
     *
     * @param guestId
     * @return
     */
    @Override
    public List<Annex> getSuccessAnnexByguestId(long guestId) {
        return annexMapper.getSuccessAnnexByguestId(guestId);
    }
    /**
     * 查看三证是否审核通过成功
     */
    @Override
    public Map<String,Object> getAuditSuccessAnnexByguestId(long guestId){
        try {
            return annexMapper.getAuditSuccessAnnexByguestId(guestId);
        }catch (NullPointerException e){
            return null;
        }
    }
    /**
     * 我的聚化信息展示
     */
    @Override
    public Map<String,Object> getUserCenter(long guestId) {
        return annexMapper.getUserCenter(guestId);
    }

    /**
     * 基本资料信息展示
     */
    @Override
   public Map<String, Object> getBasicInformation(long userId){
        return annexMapper.getBasicInformation(userId);
    }
    @Override
    public  void saveFinanceApply(FinanceApply financeApply){
        financeApplyMapper.insertSelective(financeApply) ;
    }
}
