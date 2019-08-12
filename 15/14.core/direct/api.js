
Ext.BLANK_IMAGE_URL = 'ext-3.0-rc2/resources/images/default/s.gif';

Ext.app.REMOTING_API = {
    type: 'remoting',
    url: 'jsp/router.jsp',
    actions: {
        TestAction: [{
            name: 'doEcho',
            len: 1
        }, {
            name: 'multiply',
            len: 1
        }, {
            name: 'getTree',
            len: 1
        }],
        Profile: [{
            name: 'getBasicInfo',
            len: 1
        }, {
            name: 'getPhoneInfo',
            len: 1
        }, {
            name: 'getLocationInfo',
            len: 1
        }]
    }
};
