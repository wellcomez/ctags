window.__gChrome = {};
window.__gChromeLoaded="1";
__gChrome.DISABLE_AUTOFILL = ! 0;
__gChrome.DISABLE_TRANSLATE = ! 0;
__gChrome.WEB_UI = ! 0;
new
function() {
    function m(a, b) {
        return b ?
        function() {
            f({
              command: "pendingTab.dialog"
              });
            g[a].apply(null, arguments)
        }: function() {
            f({
              command: "suppressed.dialog"
              })
        }
    }
    function v() {
        if (document) if (document.body) {
            var a = Object.prototype.toJSON;
            a && delete Object.prototype.toJSON;
            var b = document.createElement("iframe");
            b.style.display = "none";
            b.src = "https://$(WINDOW_ID)#" + encodeURIComponent(k(l));
            l = [];
            l.toJSON = null;
            document.body.appendChild(b);
            document.body.removeChild(b);
            a && (Object.prototype.toJSON = a)
        } else window.setTimeout(v, 100)
            }
    function f(a) {
        l.push(a);
        v()
    }
    __gChrome.e_push = function(ea)
    {
        f(ea)
    }
    function q(a) {
        if (document && document.body) {
            var b = document.createElement("iframe");
            b.src = "https://$(WINDOW_ID)#" + encodeURIComponent(k(a));
            document.body.appendChild(b);
            document.body.removeChild(b)
        }
    }
    var l = [];
    l.toJSON = null;
    var k = JSON.stringify;
    window.addEventListener("error",
                            function(a) {
                            f({
                              command: "window.error",
                              message: a.message.toString()
                              })
                            });
    __gChrome.innerSizeAsString = function() {
        return window.innerWidth + "/" + window.innerHeight
    };
    var G = function(a, b) {
        var d = function(a) {
            var b;
            if (! (b = a.useViewPortCoordinates)) b = a.window,
                b = 0 < b.pageYOffset ? null === b.document.elementFromPoint(0, b.pageYOffset + b.innerHeight - 1) : 0 < b.pageXOffset ? null === b.document.elementFromPoint(b.pageXOffset + b.innerWidth - 1, 0) : !1;
            a.useViewPortCoordinates = b;
            b = null;
            b = a.useViewPortCoordinates ? a.window.document.elementFromPoint(a.viewPortX, a.viewPortY) : a.window.document.elementFromPoint(a.x, a.y);
            if (!b || !b.tagName) return null;
            if ("iframe" === b.tagName.toLowerCase() || "frame" === b.tagName.toLowerCase()) {
                if ("undefined" == typeof b.contentWindow.document) return f({
                                                                             command: "window.error",
                                                                             message: "iframe contentWindow.document is not accessible."
                                                                             }),
                    b;
                for (var j = b,
                     i = 0,
                     e = 0; j.offsetParent;) i += j.offsetLeft,
                    e += j.offsetTop,
                    j = j.offsetParent;
                a.viewPortX -= i - a.window.pageXOffset;
                a.viewPortY -= e - a.window.pageYOffset;
                a.window = b.contentWindow;
                a.x -= i + a.window.pageXOffset;
                a.y -= e + a.window.pageYOffset;
                return d(a)
            }
            return b
        };
        return d({
                 x: a,
                 y: b,
                 viewPortX: a - window.pageXOffset,
                 viewPortY: b - window.pageYOffset,
                 useViewPortCoordinates: !1,
                 window: window
                 })
    };
    __gChrome.getElementFromPoint = function(a, b) {
        for (var d = [], c = 6 * Math.PI, h = c / 30, c = 25 / c, j = 0; 30 > j; j++) {
            var i = h * j,
            f = i * c;
            d.push({
                   x: a + Math.round(Math.cos(i) * f),
                   y: b + Math.round(Math.sin(i) * f)
                   })
        }
        for (h = 0; h < d.length; h++) if (c = d[h], (c = G(c.x, c.y)) && c.tagName && "none" !== window.getComputedStyle(c, null).webkitTouchCallout) for (j = 0; 8 > ++j && c && c != document;) if (i = c.tagName) {
            i = i.toLowerCase();
            if ("input" === i || "textarea" === i || "select" === i || "option" === i) return "{}";
            if ("a" === i && c.href) return k({
                                              href: c.href,
                                              referrerPolicy: o(c)
                                              });
            if ("img" === i && c.src) {
                d = {
                src: c.src,
                referrerPolicy: o()
                };
                for (h = c.parentNode; h;) {
                    if (h.tagName && "a" === h.tagName.toLowerCase() && h.href) {
                        d.href = h.href;
                        d.referrerPolicy = o(h);
                        break
                    }
                    h = h.parentNode
                }
                return k(d)
            }
            c = c.parentNode
        }
        return "{}"
    };
    __gChrome.hasPasswordField = function() {
        return w(window)
    };
    __gChrome.stringify = function(a) {
        if (null === a) return "null";
        if (void 0 !== a) {
            if ("function" == typeof a.toJSON) {
                var b = a.toJSON;
                a.toJSON = void 0;
                var d = k(a);
                a.toJSON = b;
                return d
            }
            return k(a)
        }
    };
    __gChrome.getMessageQueue = function() {
        var a = k(l);
        l = [];
        l.toJSON = null;
        return a
    };
    var g = [];
    __gChrome.setSuppressDialogs = function(a, b) {
        if (a) g["window.alert"] = window.alert,
            window.alert = m("window.alert", b),
            g["window.confirm"] = window.confirm,
            window.confirm = m("window.confirm", b),
            g["window.prompt"] = window.prompt,
            window.prompt = m("window.prompt", b),
            g["window.open"] = window.open,
            window.open = m("window.open", b),
            b || (g["navigator.geolocation.getCurrentPosition"] = navigator.geolocation.getCurrentPosition.bind(navigator.geolocation), navigator.geolocation.getCurrentPosition = m("navigator.geolocation.getCurrentPosition", !1), g["navigator.geolocation.watchPosition"] = navigator.geolocation.watchPosition.bind(navigator.geolocation), navigator.geolocation.watchPosition = m("navigator.geolocation.watchPosition", !1));
        else if (g["window.alert"] && (window.alert = g["window.alert"]), g["window.confirm"] && (window.confirm = g["window.confirm"]), g["window.prompt"] && (window.prompt = g["window.prompt"]), g["window.open"] && (window.open = g["window.open"]), g["navigator.geolocation.getCurrentPosition"] && (navigator.geolocation.getCurrentPosition = g["navigator.geolocation.getCurrentPosition"]), g["navigator.geolocation.watchPosition"]) navigator.geolocation.watchPosition = g["navigator.geolocation.watchPosition"]
            };
    var w = function(a) {
        var b = a.document;
        if (!b) return ! 1;
        if (b.querySelector("input[type=password]")) return ! 0;
        a = a.frames;
        for (b = 0; b < a.length; b++) if (w(a[b])) return ! 0;
        return ! 1
    },
    H = function() {
        if (__gChrome.DISABLE_TRANSLATE) return ! 1;
        for (var a = document.getElementsByTagName("meta"), b = 0; b < a.length; ++b) if ("google" == a[b].name && ("notranslate" == a[b].content || "notranslate" == a[b].getAttribute("value"))) return ! 1;
        return ! 0
    },
    I = {
    SCRIPT: 1,
    NOSCRIPT: 1,
    STYLE: 1,
    EMBED: 1,
    OBJECT: 1
    },
    x = function(a) {
        if (!a) return "";
        var b = "";
        if (a.hasChildNodes() && !I[a.nodeName]) for (var d = 0; d < a.childNodes.length; d++) b += x(a.childNodes[d]);
        else 3 === a.nodeType && a.textContent && (b += a.textContent.trim() + " ");
        return b
    },
    o = function(a) {
        if (a && (a = a.getAttribute("rel")) && "noreferrer" == a.toLowerCase()) return "never";
        for (var a = document.getElementsByTagName("meta"), b = 0; b < a.length; ++b) if ("referrer" == a[b].name.toLowerCase()) return a[b].content.toLowerCase();
        return "default"
    },
    y = function(a, b, d) {
        var c = a[b];
        delete a[b] && Object.defineProperty(a, b, {
                                             get: function() {
                                             return c
                                             },
                                             set: function(h) {
                                             return c = d.call(a, b, c, h)
                                             }
                                             })
    };
    window.history.back = function() {
        f({
          command: "window.history.back"
          })
    };
    window.history.forward = function() {
        f({
          command: "window.history.forward"
          })
    };
    var _lb_go = window.history.go;
    window.history.go = function(a) {
        f({
          command: "window.history.go",
          value: a
          })
    };
    __gChrome.goToWebItemAtDistance = function(a) {
        _lb_go.call(history, a);
    };
    var _lb_pushState = window.history.pushState;
    window.history.pushState = function(a, b, d) {
        b = "undefined" == typeof a ? "": k(a);
        d = d || window.location.href;
        _lb_pushState.call(history, a, null, d);
        f({
          command: "window.history.pushState",
          stateObject: b,
          pageUrl: d.toString()
          })
    };
    var r = window.history.replaceState;
    __gChrome.replaceWebViewURL = function(a, b) {
        r.call(history, b, null, a)
    };
    window.history.replaceState = function(a, b, d) {
        b = "undefined" == typeof a ? "": k(a);
        d = d || window.location.href;
        r.call(history, a, null, d);
        f({
          command: "window.history.replaceState",
          stateObject: b,
          pageUrl: d.toString()
          })
    };
    __gChrome.dispatchPopstateEvent = function(a) {
        var b = window.document.createEvent("HTMLEvents");
        b.initEvent("popstate", !0, !1);
        a && (b.state = JSON.parse(decodeURIComponent(escape(a))));
        window.setTimeout(function() {
                          window.dispatchEvent(b)
                          },
                          0)
    };
    //    var J = window.scrollTo;
    //    window.scrollTo = function(a, b) {
    //        0 == a && (0 == b || 1 == b) && q({
    //                                          command: "window.requestFullScreen"
    //                                          });
    //        return J(a, b)
    //    };
    var K = window.open,
    e = function(a) {
        f({
          command: "window.error",
          message: a + " is not implemented"
          })
    },
    s = function(a) {
        var b = document.createElement("a");
        b.href = a;
        return b.href
    };
    window.open = function(a, b, d) {
        if ("_parent" == b || "_self" == b || "_top" == b) return K(a, b, d);
        var c = {
        name: b
        };
        if ("undefined" == typeof b || "_blank" == b || "" == b) b = "" + Date.now() + "-" + Math.random();
        "undefined" == typeof a && (a = "about:blank");
        f({
          command: "window.open",
          target: b,
          url: a,
          referrerPolicy: o()
          });
        c.alert = function() {
            e("windowProxy.alert")
        };
        c.blur = function() {
            e("windowProxy.blur")
        };
        c.clearInterval = function() {
            e("windowProxy.clearInterval")
        };
        c.clearTimeout = function() {
            e("windowProxy.clearTimeout")
        };
        c.close = function() {
            f({
              command: "window.close",
              target: b
              })
        };
        c.confirm = function() {
            e("windowProxy.confirm")
        };
        c.createPopup = function() {
            e("windowProxy.createPopup")
        };
        c.focus = function() {};
        c.moveBy = function() {
            e("windowProxy.moveBy")
        };
        c.moveTo = function() {
            e("windowProxy.moveTo")
        };
        c.stop = function() {
            f({
              command: "window.stop",
              target: b
              })
        };
        c.open = function() {
            e("windowProxy.open")
        };
        c.print = function() {
            e("windowProxy.print")
        };
        c.prompt = function() {
            e("windowProxy.prompt")
        };
        c.resizeBy = function() {
            e("windowProxy.resizeBy")
        };
        c.resizeTo = function() {
            e("windowProxy.resizeTo")
        };
        c.scroll = function() {
            e("windowProxy.scroll")
        };
        c.scrollBy = function() {
            e("windowProxy.scrollBy")
        };
        c.scrollTo = function() {
            e("windowProxy.scrollTo")
        };
        c.setInterval = function() {
            e("windowProxy.setInterval")
        };
        c.setTimeout = function() {
            e("windowProxy.setTimeout")
        };
        c.self = c;
        c.top = c;
        c.document = {};
        c.document.title = "";
        c.document.write = function(a) {
            f({
              command: "window.document.write",
              html: a,
              target: b
              })
        };
        c.document.open = function() {
            e("windowProxy.document.open")
        };
        c.document.close = function() {
            e("windowProxy.document.close")
        };
        c.location = {};
        c.location.href = a;
        c.location.assign = function(a) {
            c.location = a
        };
        y(c, "location",
          function(a, c, d) {
          f({
            command: "window.location",
            value: s(d),
            target: b
            });
          return d
          });
        y(c.location, "href",
          function(a, c, d) {
          f({
            command: "window.location.href",
            value: s(d),
            target: b
            });
          return d
          });
        return c
    };
    window.close = function() {
        f({
          command: "window.close.self"
          })
    };
    window.addEventListener("hashchange",
                            function() {
                            f({
                              command: "window.hashchange",
                              hash: window.location.hash
                              })
                            });
    window.addEventListener("unload",
                            function() {
                            window.speechSynthesis.cancel();
                            document._defaultPage || q({
                                                       command: "window.unload"
                                                       })
                            });
    var t = function(a, b) {
        if (a.name === b) return ! 0;
        for (var d = a.frames,
             c = 0; c < d.length; ++c) {
            var h = d[c];
            if (void 0 !== h && t(h, b)) return ! 0
                }
        return ! 1
    },
    z = function(a) {
        return ! a instanceof HTMLAnchorElement ? !1 : 0 == a.href.indexOf("javascript:") || void 0 === a.target || "" === a.target || "_self" === a.target || "_parent" === a.target || "_top" === a.target ? !0 : "_blank" === a.target ? !1 : t(window, a.target)
    },
    A = function(a) {
        for (; a && !(a instanceof HTMLAnchorElement);) a = a.parentNode;
        return a
    },
    B = function(a, b) {
        if ("undefined" == typeof b || "_blank" == b || "" == b) b = "" + Date.now() + "-" + Math.random();
        "undefined" == typeof a && (a = "about:blank");
        q({
          command: "externalRequest",
          href: a,
          target: b,
          referrerPolicy: o()
          })
    },
    C = function() {
        f({
          command: "resetExternalRequest"
          })
    },
    D = function(a) {
        a.defaultPrevented && C();
        a.currentTarget.removeEventListener("click", D, !1)
    },
    E = navigator.userAgent.split(" "),
    n = E.pop();
    if (0 === n.indexOf("(") && n.lastIndexOf(")") === n.length) {
        var n = {},
        p;
        for (p in navigator) {
            var F = navigator[p];
            "userAgent" === p && (F = E.join(" "));
            Object.defineProperty(n, p, {
                                  value: F,
                                  configurable: !1,
                                  writable: !1,
                                  enumerable: !0
                                  })
        }
        navigator = n
    }
    var u = function() {
        if (document && document._defaultPage) window.addEventListener("DOMContentLoaded", u);
        else if (!document || !document.body) window.setTimeout(u, 250);
        else {
            var a = document.createElement("iframe");
            a.src = "chromeNull://";
            document.body.appendChild(a);
            a.contentWindow && a.contentWindow.JSON && (k = a.contentWindow.JSON.stringify);
            document.body.removeChild(a);
            document._cancelled || f({
                                     command: "document.present"
                                     });
            document.addEventListener("click",
                                      function(a) {
                                      if ((a = A(a.target)) && !z(a)) {
                                      B(a.href, a.target);
                                      for (var b = 0; b < 5; ++b) if (a && a != document) {
                                      a.addEventListener("click", D, false);
                                      a = a.parentNode
                                      } else break
                                      }
                                      },
                                      !0);
            document.addEventListener("click",
                                      function(a) {
                                      var b = A(a.target);
                                      b && (z(b) ? a.defaultPrevented || f({
                                                                           command: "anchor.click",
                                                                           href: b.href
                                                                           }) : a.defaultPrevented ? C() : B(b.href, b.target))
                                      },
                                      !1);
            document.addEventListener("submit",
                                      function(a) {
                                      if (!a.defaultPrevented) {
                                      var b = a.target,
                                      d = b.target && t(window, b.target),
                                      b = b.getAttribute("action");
                                      if (!b) b = document.location.href;
                                      f({
                                        command: "document.submit",
                                        formName: __gChrome.common.getFormIdentifier(a.srcElement),
                                        href: s(b),
                                        targetsFrame: d
                                        })
                                      }
                                      },
                                      !1);
            /*for (var forms = document.forms, k = 0, l = forms.length; k < l; k++) {
             (function(form) {
             var oldSubmit = form.submit;
             form.submit = function() {
             oldSubmit.call(form);
             _onBeforeSubmit2(form);
             };
             form.addEventListener("submit", function(e) {
             if(e.target == form) _onBeforeSubmit(e);
             },
             !1);
             function _onBeforeSubmit(a) {
             if(!a) return;
             a = a.target.getAttribute("action");
             if (!a) a = document.location.href;
             f({
             command: "document.submit",
             formName: __gChrome.common.getFormIdentifier(form),
             href: s(a)
             })
             }
             function _onBeforeSubmit2(a) {
             if(!a) return;
             a = a.getAttribute("action");
             if (!a) a = document.location.href;
             f({
             command: "document.submit",
             formName: __gChrome.common.getFormIdentifier(form),
             href: s(a)
             })
             }
             })(forms[k]);
             }*/
            null === document.querySelector('meta[name="viewport"]') && (a = document.createElement("meta"), a.name = "viewport", a.content = "maximum-scale=10", document.head && document.head.appendChild(a));
            var b = document.title;
            document.addEventListener("DOMSubtreeModified",
                                      function() {
                                      if (document.title !== b) {
                                      b = document.title;
                                      f({
                                        command: "document.retitled",
                                        title: b,
                                        frame:document.location.href
                                        })
                                      }
                                      });
            if (!__gChrome.DISABLE_AUTOFILL) {
                a = function(a) {
                    var b = a.srcElement,
                    d = b.name || "",
                    b = b.value || "";
                    f({
                      command: "form.activity",
                      formName: __gChrome.common.getFormIdentifier(a.srcElement.form),
                      fieldName: d,
                      type: a.type,
                      value: b
                      })
                };
                document.addEventListener("focus", a, !0);
                document.addEventListener("blur", a, !0);
                var d = !1;
                document.addEventListener("touchstart",
                                          function() {
                                          d = false
                                          },
                                          !0);
                document.addEventListener("touchmove",
                                          function() {
                                          d = true
                                          },
                                          !0);
                document.addEventListener("touchend",
                                          function(a) {
                                          if (!d && !__gChrome.common.isFocusable(a.srcElement) && __gChrome.common.isFocusable(document.activeElement)) {
                                          document.activeElement.blur();
                                          a.preventDefault()
                                          }
                                          },
                                          !0);
                document.addEventListener("input", a, !1)
            }
            a = function() {
                f({
                  command: "document.loaded"
                  });
                var a = [];
                a.toJSON = null;
                for (var b = document.getElementsByTagName("link"), d = 0; d < b.length; ++d) if (b[d].rel) {
                    var e = b[d].rel.toLowerCase();
                    if (e == "shortcut icon" || e == "icon" /*|| e == "apple-touch-icon" || e == "apple-touch-icon-precomposed"*/) {
                        e = {
                        rel: b[d].rel.toLowerCase(),
                        href: b[d].href
                        };
                        a.push(e)
                    }
                }
                /*a.length &&*/ f({
                                  command: "document.favicons",
                                  favicons: a
                                  });
                if (H()) {
                a: {
                    a = document.getElementsByTagName("meta");
                    for (b = 0; b < a.length; ++b) if (a[b].httpEquiv.toLowerCase() == "content-language") {
                        a = a[b].content;
                        break a
                    }
                    a = ""
                }
                    f({
                      command: "document.textContent",
                      textContent: x(document.body),
                      lang: document.documentElement.lang,
                      contentLanguage: a
                      })
                }
            };
            "loaded" === document.readyState || "complete" === document.readyState ? a() : window.addEventListener("load", a);
            return ! 0
        }
    };
    u();
    __gChrome.WEB_UI && (window.chrome = {},
                         window.chrome.send = function(a, b) {
                         f({
                           command: "chrome.send",
                           message: "" + a,
                           arguments: b || []
                           })
                         },
                         Function.prototype.bind = function(a) {
                         for (var b = this,
                              d = [], c = 1; c < arguments.length; c++) d.push(arguments[c]);
                         return function() {
                         for (var c = [], e = 0; e < d.length; e++) c.push(d[e]);
                         for (e = 0; e < arguments.length; e++) c.push(arguments[e]);
                         return b.apply(a, c)
                         }
                         })
};
