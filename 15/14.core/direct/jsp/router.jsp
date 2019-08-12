<%
    String contentType = request.getContentType();
    if (contentType.equals("application/json; charset=UTF-8")) {
        java.io.InputStream is = request.getInputStream();
        java.io.ByteArrayOutputStream os = new java.io.ByteArrayOutputStream();
        byte[] b = new byte[1024];
        int len = -1;
        while ((len = is.read(b, 0, 1024)) != -1) {
            os.write(b, 0, len);
        }
        String data = new String(os.toByteArray());
        System.out.println(data);
        String tid = data.substring(data.length() - 2, data.length() - 1);
        if (data.indexOf("Profile") == -1 && data.indexOf("doEcho") != -1) {
%>

{
    type: 'rpc',
    action: 'TestAction',
    method: 'doEcho',
    tid: <%=tid%>,
    result: 'x'
}

<%
        } else if (data.indexOf("multiply") != -1) {
%>

{
    type: 'rpc',
    action: 'TestAction',
    method: 'multiply',
    tid: <%=tid%>,
    result: 8
}

<%
        } else if (data.indexOf("getTree") != -1) {
%>

{
    type: 'rpc',
    action: 'TestAction',
    method: 'getTree',
    tid: <%=tid%>,
    result: [{
        id: 'text',
        text: 'text',
        leaf: false
    }]
}

<%
        } else if (data.indexOf("Profile") != -1) {
%>

[{
    type: 'rpc',
    action: 'TestAction',
    method: 'doEcho',
    tid: 2,
    result: 'sample'
}, {
    type: 'rpc',
    action: 'Profile',
    method: 'getBasicInfo',
    tid: 3,
    result: {
        success: true,
        data: {
            name: 'name',
            email: 'email',
            company: 'company'
        }
    }
}, {
    type: 'rpc',
    action: 'Profile',
    method: 'getPhoneInfo',
    tid: 4,
    result: {
        success: true,
        data: {
            office: 'office',
            cell: 'cell',
            home: 'home'
        }
    }
}, {
    type: 'rpc',
    action: 'Profile',
    method: 'getLocationInfo',
    tid: 5,
    result: {
        success: true,
        data: {
            street: 'street',
            city: 'city',
            state: 'state',
            zip: 'zip'
        }
    }
}]

<%
        }
    }
%>
