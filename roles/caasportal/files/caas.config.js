module.exports = {
  ldap: {
    url: 'ldap://domsrvhk04.HNA.NET:380',
    baseDN: 'DC=HNA,DC=NET',
    bindDN: '${username}@hna.net',
    searchDN: 'CN=mailuser,CN=Users,${baseDN}',
    excludes: [
      /^(\/auth)?\/login/,
      /^(\/i)?\/static/,
      /^\/api\/auth\/tokens\/verify/,
      /^\/cross\/.+/,
      /\/login/,
      /\/common/,
    ],
    ignoreUsers: [
      {
        uid: 'eking',
        pass: 'eking',
      },
      {
        uid: 'changrong',
        pass: 'eking',
      },
      {
        uid: 'pds',
        pass: 'eking',
      },
      {
        uid: 'test',
        pass: 'eking',
      },
    ],
  },
}
