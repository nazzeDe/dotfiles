// Define main function (script entry)

function main(config, profileName) {
  // 提取机场全部节点
  const proxies = config.proxies || [];
  const proxyNames = proxies.map(p => p.name);
  if (proxyNames.length === 0) return config;

  // 匹配官方黑名单文档逻辑的自定义策略组
  config["proxy-groups"] = [
    {
      name: "PROXY", // 对应黑名单 rules 里的代理策略组
      type: "select",
      proxies: proxyNames,
    }
  ];

  // 黑名单模式 (使用 raw.githubusercontent.com)
  config["rule-providers"] = {
    reject: { 
      type: "http", 
      behavior: "domain", 
      interval: 86400, 
      url: "https://gh-proxy.org/https://raw.githubusercontent.com/Loyalsoldier/clash-rules/release/reject.txt", 
      path: "./ruleset/reject.yaml" 
    },
    private: { 
      type: "http", 
      behavior: "domain", 
      interval: 86400, 
      url: "https://gh-proxy.org/https://raw.githubusercontent.com/Loyalsoldier/clash-rules/release/private.txt", 
      path: "./ruleset/private.yaml" 
    },
    gfw: { 
      type: "http", 
      behavior: "domain", 
      interval: 86400, 
      url: "https://gh-proxy.org/https://raw.githubusercontent.com/Loyalsoldier/clash-rules/release/gfw.txt", 
      path: "./ruleset/gfw.yaml" 
    },
    "tld-not-cn": { 
      type: "http", 
      behavior: "domain", 
      interval: 86400, 
      url: "https://gh-proxy.org/https://raw.githubusercontent.com/Loyalsoldier/clash-rules/release/tld-not-cn.txt", 
      path: "./ruleset/tld-not-cn.yaml" 
    },
    telegramcidr: { 
      type: "http", 
      behavior: "ipcidr", 
      interval: 86400, 
      url: "https://gh-proxy.org/https://raw.githubusercontent.com/Loyalsoldier/clash-rules/release/telegramcidr.txt", 
      path: "./ruleset/telegramcidr.yaml" 
    },
    applications: { 
      type: "http", 
      behavior: "classical", 
      interval: 86400, 
      url: "https://gh-proxy.org/https://raw.githubusercontent.com/Loyalsoldier/clash-rules/release/applications.txt", 
      path: "./ruleset/applications.yaml" 
    }
  };

  config.rules = [
    "RULE-SET,applications,DIRECT",
    "DOMAIN,clash.razord.top,DIRECT",
    "DOMAIN,yacd.haishan.me,DIRECT",
    "RULE-SET,private,DIRECT",
    "RULE-SET,reject,REJECT",
    "RULE-SET,tld-not-cn,PROXY",
    "RULE-SET,gfw,PROXY",
    "RULE-SET,telegramcidr,PROXY",
    "MATCH,DIRECT" // 黑名单兜底：未命中上述任何墙内/广告规则的流量，统统直连
  ];

  return config;
}
