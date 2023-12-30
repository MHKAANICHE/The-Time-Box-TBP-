package com.mhk.tbp.config;

public enum AvailableMinute {
    MINUTE_00(":00"),
    MINUTE_30(":30");

    private final String minute;

    AvailableMinute(String minute) {
        this.minute = minute;
    }

    public String getMinute() {
        return minute;
    }
}
