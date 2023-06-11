package com.itcast.itcaststore.service;

import com.itcast.itcaststore.domain.Notice;

import java.util.List;

public interface INoticeService {
    List<Notice> getAllNotices();
    void addNotice(Notice notice);
    Notice findNoticeById(String n_id);
    void updateNotice(Notice notice);
    void deleteNotice(String n_id);
    Notice getRecentNotice();

}
