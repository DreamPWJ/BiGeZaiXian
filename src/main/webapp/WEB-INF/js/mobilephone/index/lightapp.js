!
    function() {
        window._CLOUDA_HASHMAP_ = {},
            window._CLOUDA_HASHMAP_.res = {
                "device/accelerometer": {
                    src: "/s/accelerometer_84625ae.js"
                },
                "device/activity": {
                    src: "/s/activity_b4ae78d.js"
                },
                "device/battery": {
                    src: "/s/battery_62f9a9a.js"
                },
                "device/cache": {
                    src: "/s/cache_64434ac.js"
                },
                "device/compass": {
                    src: "/s/compass_15c89de.js"
                },
                "device/connection": {
                    src: "/s/connection_fa5ab21.js",
                    pkg: "/pkg/connection-database-interceptor_273ed52.js"
                },
                "device/contact": {
                    src: "/s/contact_9719ace.js"
                },
                "device/database": {
                    src: "/s/database_f8493f4.js",
                    pkg: "/pkg/connection-database-interceptor_273ed52.js"
                },
                "device/device": {
                    src: "/s/device_1c3ccfe.js"
                },
                "device/fs": {
                    src: "/s/fs_a057f39.js",
                    pkg: "/pkg/fs-media_055229b.js"
                },
                "device/geolocation": {
                    src: "/s/geolocation_f049994.js"
                },
                "device/globalization": {
                    src: "/s/globalization_a9147bd.js"
                },
                "device/gyro": {
                    src: "/s/gyro_1f24b9b.js"
                },
                "device/interceptor": {
                    src: "/s/interceptor_c739c9e.js",
                    pkg: "/pkg/connection-database-interceptor_273ed52.js"
                },
                "device/keyboard": {
                    src: "/s/keyboard_ef6b174.js"
                },
                "device/localStorage": {
                    src: "/s/localStorage_17a6703.js"
                },
                "device/media": {
                    src: "/s/media_7055dfc.js",
                    pkg: "/pkg/fs-media_055229b.js"
                },
                "device/notification": {
                    src: "/s/notification_eef2b0f.js"
                },
                "device/orientation": {
                    src: "/s/orientation_36e568a.js"
                },
                "device/qr": {
                    src: "/s/qr_d2b8b4f.js"
                },
                "device/screen": {
                    src: "/s/screen_e87a873.js"
                },
                "lego/monitor": {
                    src: "/s/monitor_17191c7.js",
                    pkg: "/pkg/helper-utils-moplus-monitor_7cf38e1.js"
                },
                "lego/smartBar": {
                    src: "/s/smartBar_8ddc0d5.js",
                    pkg: "/pkg/push-smartBar_310dd9f.js"
                },
                "lib/helper": {
                    src: "/s/helper_91399aa.js",
                    pkg: "/pkg/helper-utils-moplus-monitor_7cf38e1.js"
                },
                "lib/moplus": {
                    src: "/s/moplus_57541ba.js",
                    pkg: "/pkg/helper-utils-moplus-monitor_7cf38e1.js"
                },
                "lib/utils": {
                    src: "/s/utils_5ae595d.js",
                    pkg: "/pkg/helper-utils-moplus-monitor_7cf38e1.js"
                },
                "mbaas/account": {
                    src: "/s/account_39de994.js",
                    pkg: "/pkg/account-pay_aef1a13.js"
                },
                "mbaas/app": {
                    src: "/s/app_93c6e64.js",
                    pkg: "/pkg/app-socialshare_1c3f0db.js"
                },
                "mbaas/face": {
                    src: "/s/face_b1e114e.js"
                },
                "mbaas/feedback": {
                    src: "/s/feedback_f7e8b90.js"
                },
                "mbaas/map": {
                    src: "/s/map_6877d84.js"
                },
                "mbaas/mbaas": {
                    src: "/s/mbaas_cf1f6f9.js"
                },
                "mbaas/pay": {
                    src: "/s/pay_18c83a1.js",
                    pkg: "/pkg/account-pay_aef1a13.js"
                },
                "mbaas/pcs": {
                    src: "/s/pcs_c6de68a.js"
                },
                "mbaas/player": {
                    src: "/s/player_ec5a980.js"
                },
                "mbaas/push": {
                    src: "/s/push_c9df838.js",
                    pkg: "/pkg/push-smartBar_310dd9f.js"
                },
                "mbaas/socialshare": {
                    src: "/s/socialshare_726d505.js",
                    pkg: "/pkg/app-socialshare_1c3f0db.js"
                },
                "mbaas/subscribe": {
                    src: "/s/subscribe_1815790.js"
                },
                "mbaas/vtt_tts": {
                    src: "/s/vtt_tts_76814d8.js"
                },
                "ui/BlendUI": {
                    src: "/s/BlendUI_46c857a.js"
                },
                "ui/BlendWebUI": {
                    src: "/s/BlendWebUI_7de2650.js"
                }
            }
    } ();; !
    function(e, n) {
        function t(e, t) {
            function r() {
                m[e] = !0,
                b.debug || o.removeChild(a);
                var n = e.slice(0, -3).replace(w, ""),
                    r = x.pop(),
                    i = y[r];
                i && n !== r && (y[n] = {
                    alias: r
                }),
                    a = null;
                var l = _[e] || [],
                    u = null;
                if (l.length > 0) {
                    for (; u = l.shift();) u && u();
                    _[e] = null
                }
                t && t()
            }
            if (u(m, e)) t && t();
            else if (u(_, e)) _[e] = _[e] || [],
                _[e].push(t);
            else {
                _[e] = [];
                var o = n.getElementsByTagName("head")[0],
                    a = n.createElement("script");
                a.type = "text/javascript",
                    a.charset = "utf-8",
                    a.src = e,
                    a.setAttribute("_md_", "_anymoore_" + e),
                    o.appendChild(a),
                s(t) && (n.addEventListener ? a.addEventListener("load", r, !1) : a.onreadystatechange = function() { / loaded | complete / .test(a.readyState) && (a.onreadystatechange = null, r())
                })
            }
        }
        function r(n) {
            var t = null;
            if ("undefined" != typeof e._CLOUDA_HASHMAP_.res) {
                var r = e._CLOUDA_HASHMAP_.res[n] || {};
                t = r.pkg ? r.pkg: r.src || n
            }
            return t = ".js" !== t.slice( - 3) ? t + ".js": t,
                w = "http:" === window.location.protocol ? "http://apps.bdimg.com/cloudaapi": "https://openapi.baidu.com/cloudaapi",
                -1 !== t.indexOf("http://") || -1 !== t.indexOf("https://") ? t: t = w + t
        }
        function o(e, n) {
            var o = i(e, "weak") || {};
            if (u(o, "exports")) return void n(e);
            var a = null;
            if ("undefined" != typeof r) a = r(e);
            else {
                var s = l(e);
                a = ".js" !== s.slice( - 3) ? s + ".js": s
            }
            a && t(a,
                function() {
                    n(e)
                })
        }
        function a(e) {
            var n = [];
            if (e && e.length > 0) for (var t = 0,
                                            r = e.length; r > t; t++)"require" !== e[t] && "exports" !== e[t] && "module" !== e[t] && n.push(e[t]);
            return n
        }
        function i(e, n) {
            var n = n || "strong";
            if (!e || !u(y, e)) return "strong" !== n ? {}: (d('%c_moduleMap中不存在该模块: "' + e + '"', "color:red"), !1);
            var t = y[e];
            return u(t, "alias") && (t = y[t.alias]),
                t
        }
        function l(e) {
            var n = [];
            if ( - 1 !== e.indexOf("://")) return e;
            n = e.split("/"),
                e = [];
            for (var t = 0,
                     r = n.length; r > t; t++)"." !== n[t] && (".." === n[t] ? e.length >= 2 && e.pop() : e.length && "" === n[t] || e.push(n[t]));
            return e = e.join("/")
        }
        function u(e, n) {
            return g.hasOwnProperty.call(e, n)
        }
        function s(e) {
            return "[object Function]" === h.call(e)
        }
        function f(e) {
            return "[object Array]" === h.call(e)
        }
        function c(e) {
            return "[object Object]" === h.call(e)
        }
        function d() {
            if (b.debug) {
                var n = Array.prototype.slice;
                e.console && e.console.log.apply(console, n.call(arguments))
            }
        }
        var p, v, g = Object.prototype,
            h = g.toString,
            y = {},
            m = {},
            _ = {},
            x = [],
            j = 0,
            b = {
                debug: 1,
                ts: 0
            },
            w = ""; ("undefined" == typeof e._define_ || "undefined" == typeof e._require_) && (v = function(e, n, t) {
            if (!u(y, e)) {
                if (s(e) || f(e) || c(e)) {
                    var r = "_anonymous_mod_" + j++;
                    1 === arguments.length ? (t = e, n = null) : 2 === arguments.length && (t = n, n = e),
                        e = r
                } else s(n) && 2 === arguments.length && (t = n, n = null);
                y[e] = {
                    id: e,
                    deps: n,
                    factory: t
                },
                    x.push(e)
            }
        },
            p = function(e, n) {
                function t(e) {
                    var n = i(e) || {},
                        t = [],
                        l = 0;
                    if (u(n, "deps") && n.deps && (t = a(n.deps), l = t.length), l > 0) {
                        f += l - 1;
                        for (var s = 0; l > s; s++) {
                            var c = t[s];
                            o(c, arguments.callee)
                        }
                    } else--f <= 0 && r()
                }
                function r() {
                    if (x.length > 0) for (var t = null; t = x.shift();) t && p.sync(t);
                    for (var r = [], o = 0; s > o; o++) r.push(p.sync(e[o]));
                    n && n.apply(void 0, r),
                        r = null
                }
                if ("string" == typeof e && (e = [e]), 1 === e.length && 1 === arguments.length) return p.sync(e.join(""));
                var l = a(e),
                    s = l.length,
                    f = s;
                if (s) for (var c = 0; s > c; c++) {
                    var d = l[c];
                    o(d, t)
                } else r()
            },
            p.sync = function(e) {
                var n, t, r, o = [];
                if (!u(y, e)) throw new Error('Required unknown module, id: "' + e + '"');
                if (n = i(e) || {},
                        u(n, "exports")) return n.exports;
                if (n.exports = t = {},
                        r = n.deps) for (var a = r.length,
                                             l = 0; a > l; l++) {
                    var f = r[l];
                    o.push("require" === f ? p: "module" === f ? n: "exports" === f ? t: p.sync(f))
                }
                if (c(n.factory)) n.exports = n.factory;
                else if (s(n.factory)) {
                    var d = n.factory.apply(void 0, o);
                    void 0 !== d && d !== t && (n.exports = d)
                }
                return n.exports
            },
            e._define_ = v, e._require_ = p, "undefined" == typeof e.clouda && (e.clouda = {}), e.clouda.define = v, e.clouda.require = p, v.amd = {},
            v.version = "0.9.0")
    } (window, document);; !
    function(win, doc) {
        function execApiStack(modules) {
            var modulesLen = modules.length;
            if (modulesLen) for (var stackIndex = 0; modulesLen > stackIndex; stackIndex++) eval(modules[stackIndex].func).apply(null, modules[stackIndex].arg)
        }
        function initApiStack(modules) {
            for (var api_tmp, type, i = modules.length - 1; i >= 0; i--) {
                clouda.device || (clouda.device = {}),
                clouda.mbaas || (clouda.mbaas = {}),
                clouda.lego || (clouda.lego = {}),
                    api_tmp = device_apis[modules[i]] ? device_apis[modules[i]] : !1;
                var legoApiTmp = lego_apis[modules[i]] ? lego_apis[modules[i]] : !1;
                if (api_tmp ? type = "device": legoApiTmp ? (type = "lego", api_tmp = legoApiTmp) : (type = "mbaas", api_tmp = mbaas_apis[modules[i]] ? mbaas_apis[modules[i]] : !1), "undefined" == typeof eval("clouda." + type + "['" + modules[i] + "']") && api_tmp) {
                    eval("clouda." + type + "['" + modules[i] + "']={}");
                    for (var f_str, j = 0,
                             len = api_tmp.length; len > j; j++) f_str = "function(){API_STACK.push({func:'clouda." + type + "." + modules[i] + "." + api_tmp[j] + "',arg:arguments});}",
                        eval("clouda." + type + "['" + modules[i] + "']['" + api_tmp[j] + "'] =" + f_str)
                }
            }
        }
        function getPathArr(e) {
            for (var t, a = window._CLOUDA_HASHMAP_.res,
                     i = [], o = 0, n = e.length; n > o; o++) t = e[o],
                a["device/" + t] ? i.push("device/" + t) : a["mbaas/" + t] ? i.push("mbaas/" + t) : a["lego/" + t] ? i.push("lego/" + t) : a["ui/" + t] && i.push("ui/" + t);
            return i
        }
        if ("object" == typeof win) {
            "undefined" == typeof win.clouda && (win.clouda = {}),
            win.Blend && win.Blend.ui && (clouda.ui = Blend.ui),
                win.Blend = win.blend = clouda;
            var device_apis = {
                    accelerometer: ["get", "startListen", "stopListen"],
                    activity: ["start", "checkSupport"],
                    battery: ["get", "startListen", "stopListen", "checkSupport"],
                    compass: ["get", "startListen", "stopListen"],
                    connection: ["get", "checkSupport"],
                    contact: ["find", "insert", "update", "remove", "count", "getCursor"],
                    device: ["getImei", "getSysVersion", "getDeviceModelName", "getScreenSize", "checkSupport"],
                    fs: ["post", "checkSupport", "download", "remove", "removeAll", "getMd5", "unzip", "getSurplusSize", "read", "getInfo"],
                    geolocation: ["get", "startListen", "stopListen", "checkSupport"],
                    globalization: ["getPreferredLanguage", "dateToString", "stringToDate", "getDatePattern", "getDateNames", "isDayLightSavingsTime", "getFirstDayOfWeek", "numberToString", "getNumberPattern", "getCurrencyPattern", "getlocale", "checkSupport"],
                    gyro: ["get", "startListen", "stopListen"],
                    localStorage: ["set", "get", "remove", "count", "empty"],
                    media: ["captureMedia", "operateMedia", "checkSupport"],
                    notification: ["alert", "confirm", "beep", "vibrate", "prompt", "startLoad", "stopLoad", "startProgress", "updateProgress", "stopProgress"],
                    qr: ["startCapture", "checkSupport"],
                    screen: ["captureScreen", "shareImage", "shareScreen"],
                    orientation: ["setOrientation", "checkSupport"],
                    keyboard: ["startListenKeyboard", "stopListenKeyboard"],
                    database: ["get", "set", "remove", "clear"],
                    cache: ["set", "remove"],
                    interceptor: ["set", "getUrlList"]
                },
                mbaas_apis = {
                    account: ["login", "closeLoginDialog", "checkSupport", "bdLogin"],
                    app: ["followSite", "checkFollow", "checkSupport"],
                    pay: ["init", "doPay", "checkSupport"],
                    socialshare: ["callShare", "checkSupport"],
                    push: ["registerUnicast", "unregisterUnicast", "registerMulticast", "unregisterMulticast", "getUniqueId", "isBind", "checkSupport"],
                    vtt: ["init", "showDialog"],
                    tts: ["say"],
                    subscribe: ["setPanel", "showPanel"],
                    feedback: ["addFeedback", "getFeedback"],
                    player: ["play"]
                },
                lego_apis = {
                    smartBar: ["show", "hide", "setViewItems", "setShowViewItem", "setTheme", "adjustPanel"],
                    monitor: ["create", "click", "error", "send", "sendSpeed"]
                },
                blendui_apis = {
                    BlendUI: ["ready"],
                    BlendWebUI: ["ready"]
                };
            win.cloudaapiInitCount || (win.cloudaapiInitCount = {},
                cloudaapiInitCount.lightInit = 0, cloudaapiInitCount.load = 0);
            var API_STACK = [];
            if ("function" != typeof clouda.lightapp && (clouda.lightapp = function(e, t) {
                    clouda.lightapp.ak = e;
                    var a = ["activity", "battery", "connection", "device", "fs", "geolocation", "globalization", "media", "qr", "account", "app", "pay"];
                    clouda.device && clouda.mbaas && clouda.mbaas.pay ? "function" == typeof t && t() : clouda.require(["/s/api-latest"],
                        function() {
                            "function" == typeof t && t();
                            var e = API_STACK.length;
                            if (e) {
                                execApiStack(API_STACK);
                                for (var i = {},
                                         o = 0; o < a.length; o++) i[a[o]] = !0;
                                for (var n = [], o = 0; e > o; o++) {
                                    var c = API_STACK[o].func;
                                    i[c.split(".")[2]] || n.push(API_STACK[o])
                                }
                                API_STACK = n,
                                    i = null,
                                    n = null
                            }
                        }),
                        initApiStack(a)
                }), "function" != typeof clouda.lightInit) {
                var defautAPI = ["monitor", "smartBar"];
                initApiStack(defautAPI),
                    clouda.lightInit = function(e, t) {
                        e.ak && (clouda.lightapp.ak = e.ak);
                        var a = e.module || [];
                        if (a.length > 0) {
                            for (var i = 0,
                                     o = a.length; o > i; i++) if ("vtt_tts" == a[i]) a.push("vtt"),
                                a.push("tts");
                            else if ("blendui" == a[i]) {
                                var n = /BlendUI/i;
                                a[i] = n.test(navigator.userAgent) ? "BlendUI": "BlendWebUI"
                            }
                            initApiStack(a)
                        }
                        cloudaapiInitCount.lightInit += 1,
                            clouda.require(["lib/helper", "lib/utils", "lib/moplus", "lego/monitor"],
                                function() {
                                    var e = {},
                                        i = a.join("|");
                                    e[i] = 1 * new Date,
                                        clouda.require(getPathArr(a),
                                            function() {
                                                if (cloudaapiInitCount.load += 1, "function" == typeof t && t(), API_STACK.length && cloudaapiInitCount.lightInit === cloudaapiInitCount.load && (execApiStack(API_STACK), API_STACK.length = 0), e[i] && e[i] > 0 && clouda.lego.monitor && clouda.lego.monitor.send) {
                                                    var a = 1 * new Date - e[i];
                                                    clouda.lego.monitor.send("comboapi", {
                                                        dur: a > 0 ? a: 1,
                                                        mods: encodeURIComponent(i)
                                                    })
                                                }
                                            })
                                })
                    }
            }
            var script = doc.getElementsByName("baidu-tc-cerfication");
            if (script.length) for (var l = script.length; l--;) if (script[l].getAttribute("data-appid")) {
                clouda.lightapp.appid = script[l].getAttribute("data-appid");
                break
            }
            var loadScript = function(e, t) {
                var a = document.createElement("script");
                a.setAttribute("src", e),
                    document.head.appendChild(a),
                    a.onload = function() {
                        t && t(a)
                    }
            }; !
                function() {
                    clouda.envs || (clouda.envs = {}),
                    (navigator.userAgent.match(/BaiduRuntimeO2OZone/i) || "undefined" != typeof BLightApp) && (clouda.envs.zhidahao = 1),
                    navigator.userAgent.match(/baiduboxapp/i) && (clouda.envs.kuang = 1, navigator.userAgent.match(/light/i) && (clouda.envs.zhidahao = 1))
                } (),
                clouda.ready = function(e) {
                    return "function" != typeof e ? void console.error("clouda.ready need a callback function") : void(clouda.STATUS && 1 == clouda.STATUS.SUCCESS ? e() : document.addEventListener("runtimeready",
                        function() {
                            e()
                        }))
                }
        }
    } (window, document);; !
    function() {
        function a() {
            l || (setTimeout(function() {
                    for (var a = 0,
                             e = c.length; e > a; a++) try {
                        c[a]()
                    } catch(o) {
                        console.error("callBack exe error", o.stack)
                    }
                    c = []
                },
                1), l = !0)
        }
        function e(e) {
            if ("complete" == document.readyState || "interactive" == document.readyState) try {
                e(),
                    a()
            } catch(o) {
                console.error("callBack exe error", o.stack)
            } else c.push(e)
        }
        function o(a, e, o) {
            t(a[e],
                function() {
                    1 >= o - e && callBackFn && callBackFn()
                })
        }
        function t(a, e, t) {
            if ("[object Array]" != Object.prototype.toString.apply(a)) {
                var r = document.createElement("script");
                r.onload = function() {
                    e && e()
                },
                    r.onerror = function() {
                        e && e(new Error("加载失败"))
                    },
                    r.src = a,
                    r.async = "async",
                t && t.defer && (r.defer = "defer"),
                    r.type = "text/javascript",
                    r.charset = "utf-8",
                    document.head.appendChild(r)
            } else for (var c = (a.length, 0), l = a.length; l > c; c++) o(a[c], c, l)
        }
        function r(a, e) {
            if (null !== a && "undefined" != a || null !== e && "undefined" !== e) {
                clouda.lego.smartBar._cacheAppCallBackFnName = n,
                    window[n] = function(a) {
                        a && 0 === a.error_code ? (clouda.lego.smartBar._cacheAppData = a, clouda.lego.smartBar._cacheAppState = "loadEnd", clouda.lightapp.ak = a.app_info.api_key) : clouda.lego.smartBar._cacheAppState = "loadError"
                    },
                    clouda.lego.smartBar._cacheAppState = "loadStart";
                var o = localStorage.getItem("xnSmartBarCacheKey_" + a),
                    r = {};
                o && (r.defer = !0);
                var c = d;
                a ? (c += "?m_code=" + a, clouda.lego.smartBar.loadDataType = "m_code") : e && (c += "?app_id=" + e, clouda.lego.smartBar.loadDataType = "app_id"),
                    t(c + "&callback=" + n,
                        function(a) {
                            clouda.lego.smartBar._cacheAppState = a ? "loadError": "loadEnd",
                                setTimeout(function() {
                                        delete window[n]
                                    },
                                    2e3)
                        },
                        r)
            }
        }
        var c = [],
            l = !1;
        window.addEventListener("DOMContentLoaded",
            function() {
                a()
            }),
            window.addEventListener("load",
                function() {
                    a()
                }),
        "undefined" != typeof clouda && (clouda.lego || (clouda.lego = {}), clouda.lego.smartBar || (clouda.lego.smartBar = {})),
            clouda.lego.smartBar._smartBarCSSELID = "xnSmartBarCacheCSSID";
        var n = "xnBBBBBCallBackFn" + parseInt(1e5 * Math.random() + 1e3, 10),
            d = "//m.baidu.com/lightapp/navbar/get";
        clouda.lego._initSmartBar = function(a, o) {
            e(function() {
                clouda.lego.smartBar._cacheAppState || (r(a, o), clouda.lego.mAppId = a, clouda.lightInit({
                    ak: null,
                    module: ["smartBar", "app", "push", "socialshare"]
                }))
            })
        },
        clouda.lightapp.appid && (clouda.lego.monitor && clouda.lego.monitor.create && clouda.lego.monitor.create(clouda.lightapp.appid, 0, 1, !0), clouda.lego._initSmartBar(null, clouda.lightapp.appid))
    } ();;
void
    function(winElement, docElement) {
        function getQueryStr(t) {
            var e = String(window.document.location.href),
                n = new RegExp("(^|)" + t + "=([^&]*)(&|$)", "gi").exec(e);
            return n ? n[2] : 0
        }
        function setCookie(t, e, n) {
            n = n || 15;
            var i = new Date;
            i.setTime((new Date).getTime() + 1e3 * n);
            try {
                docElement.cookie = t + "=" + escape(e) + ";path=/;expires=" + i.toGMTString()
            } catch(s) {}
        }
        function getCookie(t) {
            var e = docElement.cookie.match(new RegExp("(^| )" + t + "=([^;]*)(;|$)"));
            return null !== e ? unescape(e[2]) : null
        }
        function findParent(t, e) {
            for (var n = 0; e;) {
                if ((e.nodeName || e.tagName).toLowerCase() === t.toLowerCase()) return e;
                if (n >= 4) return null;
                n++,
                    e = e.parentNode
            }
            return null
        }
        function getAppStart() {
            var hash_ts = getQueryStr("bd_ts"),
                start = 0,
                refer = docElement.referrer,
                now = +new Date,
                hash_cookie = getCookie("bd_hash"),
                st = getCookie("bd_st");
            if (st) {
                try {
                    setCookie("bd_st", "", -1),
                        st = eval(st)
                } catch(e) {
                    st = {}
                }
                st.r && refer.replace(/#.*/, "").slice( - 50) != st.r || (start = st.s)
            } else refer.indexOf("baidu.com") > -1 && hash_ts > 0 && 7 == String(hash_ts).length && hash_cookie != hash_ts && (setCookie("bd_hash", hash_ts, 30), start = parseInt((now + "").slice(0, 6) + hash_ts, 10));
            return now - start >= 2e4 && (start = 0),
                start
        }
        function extend(t, e) {
            for (var n in t) n && (e[n] = t[n]);
            return e
        }
        window.bd || (window.bd = {}),
            window.bd._qdc = {
                _v: 1,
                _timing: {},
                _random: Math.random(),
                _st: getAppStart(),
                _is_send: !1,
                _opt: {
                    sample: .5,
                    log_path: "http://static.tieba.baidu.com/tb/opms/img/st.gif",
                    items: ["lt"]
                },
                _check: function() {
                    for (var t = this._opt.items,
                             e = this._timing,
                             n = !0,
                             i = t.length - 1; i >= 0; i--) e.hasOwnProperty(t[i]) || (n = !1);
                    n && this.send()
                },
                init: function(t) {
                    extend(t, this._opt),
                    t && t.app_id && "undefined" != typeof clouda && (clouda.lego || (clouda.lego = {}), clouda.lego._initSmartBar && clouda.lego._initSmartBar(t.app_id))
                },
                mark: function(t, e) {
                    this._st > 0 && (this._timing[t] = e || +new Date - this._st, this._check())
                },
                first_screen: function() {
                    var t = document.getElementsByTagName("img"),
                        e = +new Date,
                        n = [],
                        i = this;
                    this._setFS = function() {
                        for (var t = i._opt.fsHeight || document.documentElement.clientHeight,
                                 s = 0; s < n.length; s++) {
                            var o = n[s],
                                a = o.img,
                                r = o.time,
                                d = a.offsetTop || 0;
                            d > 0 && t > d && (e = r > e ? r: e)
                        }
                        i._timing.fs = e - i._st
                    };
                    for (var s = function() {
                            this.removeEventListener && this.removeEventListener("load", s, !1),
                                n.push({
                                    img: this,
                                    time: +new Date
                                })
                        },
                             o = 0; o < t.length; o++) {
                        var a = t[o];
                        a.addEventListener && !a.complete && a.addEventListener("load", s, !1)
                    }
                },
                send: function() {
                    if (this._random < this._opt.sample && this._st > 0 && !this._is_send) {
                        this._is_send = !0;
                        var t = this._timing,
                            e = [];
                        for (var n in t) e.push(n + "=" + t[n]);
                        e.push("_t=" + 1 * new Date);
                        var i = document.createElement("img");
                        i.src = this._opt.log_path + "?type=bdapp&v=" + this._v + "&app_id=" + this._opt.app_id + "&" + e.join("&")
                    }
                }
            },
            docElement.addEventListener("DOMContentLoaded",
                function() {
                    bd._qdc.mark("drt")
                },
                !1),
            winElement.addEventListener("load",
                function() {
                    "function" == typeof bd._qdc._setFS && bd._qdc._setFS(),
                        bd._qdc.mark("lt")
                }),
            docElement.addEventListener("click",
                function(t) {
                    t = t || window.event;
                    var e = t.target || t.srcElement,
                        n = findParent("a", e);
                    if (n) {
                        var i = n.getAttribute("href");
                        /^#|javascript:/.test(i) || setCookie("bd_st", '({"s":' + +new Date + ',"r":"' + docElement.URL.replace(/#.*/, "").slice( - 50) + '"})')
                    }
                },
                !1),
            bd._qdc.mark("ht")
    } (window, document);