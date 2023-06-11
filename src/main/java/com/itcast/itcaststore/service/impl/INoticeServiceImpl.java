package com.itcast.itcaststore.service.impl;

import com.itcast.itcaststore.domain.Notice;
import com.itcast.itcaststore.mapper.NoticeMapper;
import com.itcast.itcaststore.service.INoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class INoticeServiceImpl implements INoticeService {
    @Autowired
    private NoticeMapper noticeMapper;
    @Override
    public List<Notice> getAllNotices() {
        return noticeMapper.getAllNotices();
    }

    @Override
    public void addNotice(Notice notice) {
        noticeMapper.addNotice(notice);
    }

    @Override
    public Notice findNoticeById(String n_id) {
        return noticeMapper.findNoticeById(n_id);
    }

    @Override
    public void updateNotice(Notice notice) {
        noticeMapper.updateNotice(notice);
    }

    @Override
    public void deleteNotice(String n_id) {
        noticeMapper.deleteNotice(n_id);
    }

    @Override
    public Notice getRecentNotice() {
        return noticeMapper.getRecentNotice();
    }
}
