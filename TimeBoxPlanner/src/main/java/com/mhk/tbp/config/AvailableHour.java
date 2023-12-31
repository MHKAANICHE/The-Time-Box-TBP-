package com.mhk.tbp.config;

public enum AvailableHour {
    HOUR_5(5),
    HOUR_6(6),
    HOUR_7(7),
    HOUR_8(8),
    HOUR_9(9),
    HOUR_10(10),
    HOUR_11(11),
    HOUR_12(12),
    HOUR_13(13),
    HOUR_14(14),
    HOUR_15(15),
    HOUR_16(16),
    HOUR_17(17),
    HOUR_18(18),
    HOUR_19(19),
    HOUR_20(20),
    HOUR_21(21),
    HOUR_22(22),
    HOUR_23(23);

    private final int hour;

    AvailableHour(int hour) {
        this.hour = hour;
    }

    public int getHour() {
        return hour;
    }
    
    public static AvailableHour getByHour(int hour) {
        for (AvailableHour availableHour : values()) {
            if (availableHour.getHour() == hour) {
                return availableHour;
            }
        }
        // If the hour is not found
        throw new IllegalArgumentException("Invalid hour: " + hour);
    }
    
    
}

