package com.itcast.itcaststore.mapper;

import com.itcast.itcaststore.domain.Notice;

import java.util.List;

public interface NoticeMapper {
    List<Notice> getAllNotices();
    void addNotice(Notice notice);
    Notice findNoticeById(String n_id);
    void updateNotice(Notice notice);
    void deleteNotice(String n_id);
    Notice getRecentNotice();

}
