SELECT boxtheme.ThemeName AS 'Theme', count(transactioninfo.ThemeID)
FROM boxtheme JOIN transactioninfo ON boxtheme.ThemeID=transactioninfo.ThemeID
GROUP BY boxtheme.ThemeID