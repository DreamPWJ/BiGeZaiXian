package com.juhuawang.controller;

import com.juhuawang.model.FinanceApply;
import com.juhuawang.service.interfaces.IAccountService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

/**
 * 聚融宝相关
 */
@Controller
@RequestMapping("/jurongbao")
public class JurongbaoController {

    @Resource
    IAccountService accountService;

    /**
     * 聚融宝页面
     */
    @RequestMapping("/toJuRongBao")
    public String toJuRongBao(Model model) {
        model.addAttribute("headTitle", "聚融宝");
        model.addAttribute("type","1");
        return "mobilephone/juRongBao/toJuRongBao";
    }

    /**
     * 聚融宝申请主页面
     */
    @RequestMapping("/toJrbApplyMain")
    public String toJrbApplyMain(Model model) {
        model.addAttribute("headTitle", "聚融宝");
        model.addAttribute("type","2");
        return "mobilephone/juRongBao/toJrbApplyMain";
    }

    /**
     * 聚融宝申请进度
     */
    @RequestMapping("/toJrbApplyProgress")
    public String toJrbApplyProgress(Model model) {
        model.addAttribute("headTitle", "聚融宝申请进度");
        return "mobilephone/juRongBao/toJrbApplyProgress";
    }

    /**
     * 聚融宝申请进度-审核中
     */
    @RequestMapping("/toJrbApplyProgressChecking")
    public String toJrbApplyProgressChecking(Model model) {
        model.addAttribute("headTitle", "聚融宝申请进度");
        return "mobilephone/juRongBao/toJrbApplyProgressChecking";
    }

    /**
     * 聚融宝申请进度-审核通过
     */
    @RequestMapping("/toJrbApplyCheckPass")
    public String toJrbApplyCheckPass(Model model) {
        model.addAttribute("headTitle", "聚融宝申请进度");
        return "mobilephone/juRongBao/toJrbApplyCheckPass";
    }

    /**
     * 聚融宝申请进度-审核失败
     */
    @RequestMapping("/toJrbApplyCheckFail")
    public String toJrbApplyCheckFail(Model model) {
        model.addAttribute("headTitle", "聚融宝申请进度");
        return "mobilephone/juRongBao/toJrbApplyCheckFail";
    }

    /**
     * 我的聚融宝
     */
    @RequestMapping("/toMyJurongbao")
    public String toMyJurongbao(Model model) {
        model.addAttribute("headTitle", "我的聚融宝");
        model.addAttribute("type", "3");
        return "mobilephone/juRongBao/toMyJurongbao";
    }

    /**
     * 聚融宝-还贷
     */
    @RequestMapping("/toRepayment")
    public String toRepayment(Model model) {
        model.addAttribute("headTitle", "聚融宝还贷");
        model.addAttribute("type", "4");
        return "mobilephone/juRongBao/toRepayment";
    }

    /**
     * 聚融宝-还款明细
     */
    @RequestMapping("/toJrbRepaymentDetail")
    public String toJrbRepaymentDetail(Model model) {
        model.addAttribute("headTitle", "还款明细");
        return "mobilephone/juRongBao/toJrbRepaymentDetail";
    }

    /**
     * 聚融宝-额度申请历史记录
     */
    @RequestMapping("/toJrbApplyRecord")
    public String toJrbApplyRecord(Model model) {
        model.addAttribute("headTitle", "额度申请历史记录");
        return "mobilephone/juRongBao/toJrbApplyRecord";
    }

    /**
     * 聚融宝-待还款项
     */
    @RequestMapping("/toJrbNoPay")
    public String toJrbNoPay(Model model) {
        model.addAttribute("headTitle", "待还款项");
        return "mobilephone/juRongBao/toJrbNoPay";
    }

    /**
     * 聚融宝-已还款项
     */
    @RequestMapping("/toJrbHasPayed")
    public String toJrbHasPayed(Model model) {
        model.addAttribute("headTitle", "已还款项");
        return "mobilephone/juRongBao/toJrbHasPayed";
    }

    /**
     * 聚融宝-订单明细
     */
    @RequestMapping("/toJrbOrderDetail")
    public String toJrbOrderDetail(Model model) {
        model.addAttribute("headTitle", "订单明细");
        return "mobilephone/juRongBao/toJrbOrderDetail";
    }

    /**
     * 聚融宝-已贷款项
     */
    @RequestMapping("/toJrbHasLoan")
    public String toJrbHasLoan(Model model) {
        model.addAttribute("headTitle", "已贷款项");
        return "mobilephone/juRongBao/toJrbHasLoan";
    }

    /**
     * 聚融宝-审核中
     */
    @RequestMapping("/toJrbCheckingList")
    public String toJrbCheckingList(Model model) {
        model.addAttribute("headTitle", "审核中");
        return "mobilephone/juRongBao/toJrbCheckingList";
    }

    /**
     * 聚融宝-冻结款项
     */
    @RequestMapping("/toJrbFrozenProvision")
    public String toJrbFrozenProvision(Model model) {
        model.addAttribute("headTitle", "冻结款项");
        return "mobilephone/juRongBao/toJrbFrozenProvision";
    }

    /**
     * 聚融宝-订单明细
     */
    @RequestMapping("/toJrbOrderCheckFail")
    public String toJrbOrderCheckFail(Model model) {
        model.addAttribute("headTitle", "订单明细");
        return "mobilephone/juRongBao/toJrbOrderCheckFail";
    }

    /**
     * 聚融宝-手续费
     */
    @RequestMapping("/toJrbPoundage")
    public String toJrbPoundage(Model model) {
        model.addAttribute("headTitle", "手续费");
        return "mobilephone/juRongBao/toJrbPoundage";
    }

    /**
     * 聚融宝-还款
     */
    @RequestMapping("/toJrbConfirmRepayment")
    public String toJrbConfirmRepayment(Model model) {
        model.addAttribute("headTitle", "还款");
        return "mobilephone/juRongBao/toJrbConfirmRepayment";
    }

    @RequestMapping("/saveFinanceApply")
    public void saveFinanceApply(FinanceApply financeApply,HttpServletResponse response){
        accountService.saveFinanceApply(financeApply);
    }
}
