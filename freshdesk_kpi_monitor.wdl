DateTime.GetCurrentDateTime.Local DateTimeFormat: DateTime.DateTimeFormat.DateAndTime CurrentDateTime=> CurrentDateTime
Text.ConvertDateTimeToText.FromCustomDateTime DateTime: CurrentDateTime CustomFormat: $'''ddd, MMM d, yyyy hh:mm tt''' Result=> FormattedDateTime
Text.ConvertTextToDateTime.ToDateTime Text: FormattedDateTime DateTime=> FormattedDateTimenum
WebAutomation.LaunchChrome.LaunchChrome Url: $'''https://landaueraushelp.freshdesk.com/a/dashboard/default''' WindowState: WebAutomation.BrowserWindowState.Maximized ClearCache: False ClearCookies: False WaitForPageToLoadTimeout: 60 Timeout: 60 PiPUserDataFolderMode: WebAutomation.PiPUserDataFolderModeEnum.AutomaticProfile TargetDesktop: $'''{\"DisplayName\":\"Local computer\",\"Route\":{\"ServerType\":\"Local\",\"ServerAddress\":\"\"},\"DesktopType\":\"local\"}''' BrowserInstance=> Browser
WAIT 10
WebAutomation.ExtractData.ExtractList BrowserInstance: Browser Control: $'''html > body > div:eq(7) > div:eq(1) > div:eq(1) > div:eq(1) > div > div > div > div:eq(1) > div > div:eq(0) > div > div:eq(2) > div > div > div > table > tbody > tr''' ExtractionParameters: {[$'''td > div > div:eq(0)''', $'''Own Text''', $'''(?<=#)\\d{6}'''] } PostProcessData: True TimeoutInSeconds: 60 ExtractedData=> DataFromWebPage
LOOP FOREACH link IN DataFromWebPage
    WebAutomation.GoToWebPage.GoToWebPageCloseDialog BrowserInstance: Browser Url: $'''https://landaueraushelp.freshdesk.com/a/tickets/%link%''' WaitForPageToLoadTimeout: 60
    DISABLE WebAutomation.ExtractData.ExtractSingleValue BrowserInstance: Browser ExtractionParameters: {[$'''html > body > div:eq(7) > div:eq(1) > div:eq(1) > div:eq(1) > div:eq(0) > div:eq(0) > div > div > div > div:eq(0) > div > div:eq(7) > div > div:eq(1) > div > div > div:eq(1) > div:eq(1) > div''', $'''Own Text''', $''''''] } TimeoutInSeconds: 60 ExtractedData=> emailBody
ON ERROR

END
    WebAutomation.ExtractData.ExtractSingleValue BrowserInstance: Browser ExtractionParameters: {[$'''html > body > div:eq(7) > div:eq(1) > div:eq(1) > div:eq(1) > div:eq(0) > div:eq(0) > div > div > div > div:eq(1) > div > div > div > div > div:eq(0) > div > div:eq(0) > div > div:eq(1) > span''', $'''Own Text''', $'''(?<=\\bby\\s).*'''] } TimeoutInSeconds: 60 ExtractedData=> firstResponseDueTextNum
    ON ERROR

    END
    Text.ConvertTextToDateTime.ToDateTime Text: firstResponseDueTextNum DateTime=> firstResponseDueDatenum
    IF firstResponseDueDatenum > FormattedDateTimenum THEN
        Display.ShowMessageDialog.ShowMessage Title: $'''Informing that you can reply for this ticket early''' Message: $'''Hi you can reply to this email early.<br><br>

First response due date is %firstResponseDueDatenum%<br><br>

and today\'s date is %FormattedDateTimenum%<br><br>

Here is the ticket ID: %link%<br><br>

Here is the link to this ticket: https://landaueraushelp.freshdesk.com/a/tickets/%link%''' Icon: Display.Icon.None Buttons: Display.Buttons.OK DefaultButton: Display.DefaultButton.Button1 IsTopMost: False ButtonPressed=> ButtonPressed3
    END
END
WebAutomation.CloseWebBrowser BrowserInstance: Browser
