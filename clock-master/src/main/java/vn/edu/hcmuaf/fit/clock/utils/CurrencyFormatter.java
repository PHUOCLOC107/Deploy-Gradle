package vn.edu.hcmuaf.fit.clock.utils;

import java.text.NumberFormat;
import java.util.Locale;

public class CurrencyFormatter {
    public static String formatCurrency(double amount) {
        Locale locale = new Locale("vi", "VN");
        NumberFormat currencyFormatter = NumberFormat.getInstance(locale);
        return currencyFormatter.format(amount) + " ₫";
    }

    public static void main(String[] args) {
        System.out.println(formatCurrency(1000000));
    }
}
