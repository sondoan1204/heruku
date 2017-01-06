<%-- 
    Document   : Rss
    Created on : Dec 20, 2016, 7:49:44 PM
    Author     : SONPC
--%>

<%@page import="model.FeedMessage"%>
<%@page import="model.Feed"%>
<%@page import="model.RSSFeedParser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            RSSFeedParser parser = new RSSFeedParser(
                    "http://vnexpress.net/rss/du-lich.rss");
            Feed feed = parser.readFeed();
            %>
            
            
            <h2><%=feed.getTitle()%><br><%=feed.getPubDate()%></h2>
        
            <%
            int count = 0;
            for (FeedMessage message : feed.getMessages()) {
                count++;
                if (count == 6) {
                    break;
                }
        %>
        <div class="row">
            <div class="medium-7 columns">
                <a href="<%=message.getLink()%>" target="_blank">
                    <%=message.getTitle()%>
                </a>
            </div>

            <div class="medium-5 columns">

                <div class="divider"></div>
                <%=message.getDescription()%>
                <span class="proj-spec"><%=message.getAuthor()%></span>


            </div>
        </div>
        <%}%>
    </body>
</html>
