(function(b) {
    b.Zebra_DatePicker = function(U, E) {
        var ha = {
                always_show_clear: !1,
                always_visible: !1,
                days: "Sunday Monday Tuesday Wednesday Thursday Friday Saturday".split(" "),
                days_abbr: !1,
                direction: 0,
                disabled_dates: !1,
                first_day_of_week: 1,
                format: "Y-m-d",
                inside: !0,
                lang_clear_date: "Clear",
                months: "January February March April May June July August September October November December".split(" "),
                months_abbr: !1,
                offset: [505, 505],
                pair: !1,
                readonly_element: !0,
                show_icon: !0,
                show_week_number: !1,
                start_date: !1,
                view: "days",
                weekend_days: [0, 6],
                zero_pad: !0,
                onChange: null,
                onClear: null,
                onSelect: null
            },
            p, j, t, z, B, F, G, I, V, P, X, r, u, y, s, l, Q, J, K, W, R, v, w, S, L, N, aa, ba, ca, C, Y, a = this;
        a.settings = {};
        var n = b(U),
            ea = function(c) {
                c || (a.settings = b.extend({}, ha, E));
                a.settings.readonly_element && n.attr("readonly", "readonly");
                var d = {
                        days: ["d", "j"],
                        months: ["F", "m", "M", "n", "t"],
                        years: ["o", "Y", "y"]
                    },
                    m = !1,
                    f = !1,
                    k = !1;
                for (type in d) b.each(d[type], function(b, c) {
                    -1 < a.settings.format.indexOf(c) && ("days" == type ? m = !0 : "months" == type ? f = !0 : "years" == type && (k = !0))
                });
                C = m && f && k ? ["years", "months", "days"] : !m && f && k ? ["years", "months"] : !m && !f && k ? ["years"] : ["years", "months", "days"]; - 1 == b.inArray(a.settings.view, C) && (a.settings.view = C[C.length - 1]);
                W = [];
                b.isArray(a.settings.disabled_dates) && 0 < a.settings.disabled_dates.length && b.each(a.settings.disabled_dates, function() {
                    for (var a = this.split(" "), c = 0; 4 > c; c++) {
                        a[c] || (a[c] = "*");
                        a[c] = -1 < a[c].indexOf(",") ? a[c].split(",") : Array(a[c]);
                        for (var d = 0; d < a[c].length; d++)
                            if (-1 < a[c][d].indexOf("-")) {
                                var e = a[c][d].match(/^([0-9]+)\-([0-9]+)/);
                                if (null != e) {
                                    for (var f = h(e[1]); f <= h(e[2]); f++) - 1 == b.inArray(f, a[c]) && a[c].push(f + "");
                                    a[c].splice(d, 1)
                                }
                            }
                        for (d = 0; d < a[c].length; d++) a[c][d] = isNaN(h(a[c][d])) ? a[c][d] : h(a[c][d])
                    }
                    W.push(a)
                });
                var d = new Date,
                    g = !a.settings.reference_date ? n.data("zdp_reference_date") && void 0 != n.data("zdp_reference_date") ? n.data("zdp_reference_date") : d : a.settings.reference_date,
                    e, A;
                w = v = void 0;
                r = g.getMonth();
                V = d.getMonth();
                u = g.getFullYear();
                P = d.getFullYear();
                y = g.getDate();
                X = d.getDate();
                if (!0 === a.settings.direction) v = g;
                else if (!1 === a.settings.direction) w = g, N = w.getMonth(), L = w.getFullYear(), S = w.getDate();
                else if (!b.isArray(a.settings.direction) && O(a.settings.direction) && 0 < h(a.settings.direction) || b.isArray(a.settings.direction) && (!0 === a.settings.direction[0] || O(a.settings.direction[0]) && 0 < a.settings.direction[0] || (e = T(a.settings.direction[0]))) && (!1 === a.settings.direction[1] || O(a.settings.direction[1]) && 0 <= a.settings.direction[1] || (A = T(a.settings.direction[1])))) v = e ? e : new Date(u, r, y + (!b.isArray(a.settings.direction) ? h(a.settings.direction) : h(!0 === a.settings.direction[0] ? 0 : a.settings.direction[0]))), r = v.getMonth(), u = v.getFullYear(), y = v.getDate(), A && +A >= +v ? w = A : !A && (!1 !== a.settings.direction[1] && b.isArray(a.settings.direction)) && (w = new Date(u, r, y + h(a.settings.direction[1]))), w && (N = w.getMonth(), L = w.getFullYear(), S = w.getDate());
                else if (!b.isArray(a.settings.direction) && O(a.settings.direction) && 0 > h(a.settings.direction) || b.isArray(a.settings.direction) && (!1 === a.settings.direction[0] || O(a.settings.direction[0]) && 0 > a.settings.direction[0]) && (O(a.settings.direction[1]) && 0 <= a.settings.direction[1] || (e = T(a.settings.direction[1])))) w = new Date(u, r, y + (!b.isArray(a.settings.direction) ? h(a.settings.direction) : h(!1 === a.settings.direction[0] ? 0 : a.settings.direction[0]))), N = w.getMonth(), L = w.getFullYear(), S = w.getDate(), e && +e < +w ? v = e : !e && b.isArray(a.settings.direction) && (v = new Date(L, N, S - h(a.settings.direction[1]))), v && (r = v.getMonth(), u = v.getFullYear(), y = v.getDate());
                if (v && D(u, r, y)) {
                    for (; D(u);) v ? u++ : u--, r = 0;
                    for (; D(u, r);) v ? r++ : r--, 11 < r ? (u++, r = 0) : 0 > r && (u--, r = 0), y = 1;
                    for (; D(u, r, y);) v ? y++ : y--;
                    d = new Date(u, r, y);
                    u = d.getFullYear();
                    r = d.getMonth();
                    y = d.getDate()
                }(e = T(n.val() || (a.settings.start_date ? a.settings.start_date : ""))) && D(e.getFullYear(), e.getMonth(), e.getDate()) && n.val("");
                da(e);
                if (!a.settings.always_visible && (c || (a.settings.show_icon ? (e = '<button type="button" class="Zebra_DatePicker_Icon' + ("disabled" == n.attr("disabled") ? " Zebra_DatePicker_Icon_Disabled" : "") + '">Pick a date</button>', t = b(e), a.icon = t, Y = t.add(n)) : Y = n, Y.bind("click", function(c) {
                        c.preventDefault();
                        n.attr("disabled") || ("none" != j.css("display") ? a.hide() : a.show())
                    }), void 0 != t && t.insertAfter(U)), void 0 != t)) {
                    a.settings.inside && t.addClass("Zebra_DatePicker_Icon_Inside");
                    e = n.position();
                    A = n.outerHeight(!1);
                    var d = parseInt(n.css("marginTop"), 10) || 0,
                        g = n.outerWidth(!1),
                        ia = parseInt(n.css("marginLeft"), 10) || 0,
                        x = t.outerWidth(!0),
                        q = t.outerHeight(!0);
                    a.settings.inside ? t.css({
                        left: e.left + ia + g - x,
                        top: e.top + d + (A - q) / 2
                    }) : t.css({
                        left: e.left + g,
                        top: e.top + (A - q) / 2
                    })
                }
                void 0 != t && (n.is(":visible") ? t.css("display", "block") : t.css("display", "none"));
                c || (e = '<div class="Zebra_DatePicker"><table class="dp_header"><tr><td class="dp_previous">&laquo;</td><td class="dp_caption">&nbsp;</td><td class="dp_next">&raquo;</td></tr></table><table class="dp_daypicker"></table><table class="dp_monthpicker"></table><table class="dp_yearpicker"></table><table class="dp_footer"><tr><td>' + a.settings.lang_clear_date + "</td></tr></table></div>", j = b(e), a.datepicker = j, z = b("table.dp_header", j), B = b("table.dp_daypicker", j), F = b("table.dp_monthpicker", j), G = b("table.dp_yearpicker", j), I = b("table.dp_footer", j), a.settings.always_visible ? n.attr("disabled") || (a.settings.always_visible.append(j), a.show()) : b("body").append(j), j.delegate("td:not(.dp_disabled, .dp_weekend_disabled, .dp_not_in_month, .dp_blocked, .dp_week_number)", "mouseover", function() {
                    b(this).addClass("dp_hover")
                }).delegate("td:not(.dp_disabled, .dp_weekend_disabled, .dp_not_in_month, .dp_blocked, .dp_week_number)", "mouseout", function() {
                    b(this).removeClass("dp_hover")
                }), c = b("td", z), b.browser.mozilla ? c.css("MozUserSelect", "none") : b.browser.msie ? c.bind("selectstart", function() {
                    return !1
                }) : c.mousedown(function() {
                    return !1
                }), b(".dp_previous", z).bind("click", function() {
                    b(this).hasClass("dp_blocked") || ("months" == p ? l-- : "years" == p ? l -= 12 : 0 > --s && (s = 11, l--), M())
                }), b(".dp_caption", z).bind("click", function() {
                    p = "days" == p ? -1 < b.inArray("months", C) ? "months" : -1 < b.inArray("years", C) ? "years" : "days" : "months" == p ? -1 < b.inArray("years", C) ? "years" : -1 < b.inArray("days", C) ? "days" : "months" : -1 < b.inArray("days", C) ? "days" : -1 < b.inArray("months", C) ? "months" : "years";
                    M()
                }), b(".dp_next", z).bind("click", function() {
                    b(this).hasClass("dp_blocked") || ("months" == p ? l++ : "years" == p ? l += 12 : 12 == ++s && (s = 0, l++), M())
                }), B.delegate("td:not(.dp_disabled, .dp_weekend_disabled, .dp_not_in_month, .dp_week_number)", "click", function() {
                    Z(l, s, h(b(this).html()), "days", b(this))
                }), F.delegate("td:not(.dp_disabled)", "click", function() {
                    var c = b(this).attr("class").match(/dp\_month\_([0-9]+)/);
                    s = h(c[1]); - 1 == b.inArray("days", C) ? Z(l, s, 1, "months", b(this)) : (p = "days", a.settings.always_visible && n.val(""), M())
                }), G.delegate("td:not(.dp_disabled)", "click", function() {
                    l = h(b(this).html()); - 1 == b.inArray("months", C) ? Z(l, 1, 1, "years", b(this)) : (p = "months", a.settings.always_visible && n.val(""), M())
                }), b("td", I).bind("click", function(c) {
                    c.preventDefault();
                    n.val("");
                    a.settings.always_visible || (l = s = K = J = Q = null, I.css("display", "none"));
                    a.hide();
                    if (a.settings.onClear && "function" == typeof a.settings.onClear) a.settings.onClear(n)
                }), a.settings.always_visible || b(document).bind({
                    mousedown: a._mousedown,
                    keyup: a._keyup
                }), M())
            };
        a.hide = function() {
            a.settings.always_visible || (fa("hide"), j.css("display", "none"))
        };
        a.show = function() {
            p = a.settings.view;
            var c = T(n.val() || (a.settings.start_date ? a.settings.start_date : ""));
            c ? (J = c.getMonth(), s = c.getMonth(), K = c.getFullYear(), l = c.getFullYear(), Q = c.getDate(), D(K, J, Q) && (n.val(""), s = r, l = u)) : (s = r, l = u);
            M();
            if (a.settings.always_visible) j.css("display", "block");
            else {
                var c = j.outerWidth(),
                    d = j.outerHeight(),
                    m = (void 0 != t ? t.offset().left + t.outerWidth(!0) : n.offset().left + n.outerWidth(!0)) + a.settings.offset[0],
                    f = (void 0 != t ? t.offset().top : n.offset().top) - d + a.settings.offset[1],
                    k = b(window).width(),
                    g = b(window).height(),
                    e = b(window).scrollTop(),
                    A = b(window).scrollLeft();
                m + c > A + k && (m = A + k - c);
                m < A && (m = A);
                f + d > e + g && (f = e + g - d);
                f < e && (f = e);
                j.css({
                    left: m,
                    top: f
                });
                j.fadeIn(b.browser.msie && b.browser.version.match(/^[6-8]/) ? 0 : 150, "linear");
                fa()
            }
        };
        a.update = function(c) {
            a.original_direction && (a.original_direction = a.direction);
            a.settings = b.extend(a.settings, c);
            ea(!0)
        };
        var T = function(c) {
                c += "";
                if ("" != b.trim(c)) {
                    var d;
                    d = a.settings.format.replace(/\s/g, "").replace(/([-.*+?^${}()|[\]\/\\])/g, "\\$1");
                    for (var m = "dDjlNSwFmMnYy".split(""), f = [], k = [], g = 0; g < m.length; g++) - 1 < (position = d.indexOf(m[g])) && f.push({
                        character: m[g],
                        position: position
                    });
                    f.sort(function(a, c) {
                        return a.position - c.position
                    });
                    b.each(f, function(a, c) {
                        switch (c.character) {
                            case "d":
                                k.push("0[1-9]|[12][0-9]|3[01]");
                                break;
                            case "D":
                                k.push("[a-z]{3}");
                                break;
                            case "j":
                                k.push("[1-9]|[12][0-9]|3[01]");
                                break;
                            case "l":
                                k.push("[a-z]+");
                                break;
                            case "N":
                                k.push("[1-7]");
                                break;
                            case "S":
                                k.push("st|nd|rd|th");
                                break;
                            case "w":
                                k.push("[0-6]");
                                break;
                            case "F":
                                k.push("[a-z]+");
                                break;
                            case "m":
                                k.push("0[1-9]|1[012]+");
                                break;
                            case "M":
                                k.push("[a-z]{3}");
                                break;
                            case "n":
                                k.push("[1-9]|1[012]");
                                break;
                            case "Y":
                                k.push("[0-9]{4}");
                                break;
                            case "y":
                                k.push("[0-9]{2}")
                        }
                    });
                    if (k.length && (f.reverse(), b.each(f, function(a, c) {
                            d = d.replace(c.character, "(" + k[k.length - a - 1] + ")")
                        }), k = RegExp("^" + d + "$", "ig"), segments = k.exec(c.replace(/\s/g, "")))) {
                        var e, l, n, j = "Sunday Monday Tuesday Wednesday Thursday Friday Saturday".split(" "),
                            q = "January February March April May June July August September October November December".split(" "),
                            s, p = !0;
                        f.reverse();
                        b.each(f, function(c, d) {
                            if (!p) return !0;
                            switch (d.character) {
                                case "m":
                                case "n":
                                    l = h(segments[c + 1]);
                                    break;
                                case "d":
                                case "j":
                                    e = h(segments[c + 1]);
                                    break;
                                case "D":
                                case "l":
                                case "F":
                                case "M":
                                    s = "D" == d.character || "l" == d.character ? a.settings.days : a.settings.months;
                                    p = !1;
                                    b.each(s, function(a, b) {
                                        if (p) return !0;
                                        if (segments[c + 1].toLowerCase() == b.substring(0, "D" == d.character || "M" == d.character ? 3 : b.length).toLowerCase()) {
                                            switch (d.character) {
                                                case "D":
                                                    segments[c + 1] = j[a].substring(0, 3);
                                                    break;
                                                case "l":
                                                    segments[c + 1] = j[a];
                                                    break;
                                                case "F":
                                                    segments[c + 1] = q[a];
                                                    l = a + 1;
                                                    break;
                                                case "M":
                                                    segments[c + 1] = q[a].substring(0, 3), l = a + 1
                                            }
                                            p = !0
                                        }
                                    });
                                    break;
                                case "Y":
                                    n = h(segments[c + 1]);
                                    break;
                                case "y":
                                    n = "19" + h(segments[c + 1])
                            }
                        });
                        if (p && (c = new Date(n, (l || 1) - 1, e || 1), c.getFullYear() == n && c.getDate() == (e || 1) && c.getMonth() == (l || 1) - 1)) return c
                    }
                    return !1
                }
            },
            ga = function() {
                var c = (new Date(l, s + 1, 0)).getDate(),
                    d = (new Date(l, s, 1)).getDay(),
                    m = (new Date(l, s, 0)).getDate(),
                    d = d - a.settings.first_day_of_week,
                    d = 0 > d ? 7 + d : d;
                $(a.settings.months[s] + ", " + l);
                var f = "<tr>";
                a.settings.show_week_number && (f += "<th>" + a.settings.show_week_number + "</th>");
                for (var k = 0; 7 > k; k++) f += "<th>" + (b.isArray(a.settings.days_abbr) && void 0 != a.settings.days_abbr[(a.settings.first_day_of_week + k) % 7] ? a.settings.days_abbr[(a.settings.first_day_of_week + k) % 7] : a.settings.days[(a.settings.first_day_of_week + k) % 7].substr(0, 2)) + "</th>";
                f += "</tr><tr>";
                for (k = 0; 42 > k; k++) {
                    0 < k && 0 == k % 7 && (f += "</tr><tr>");
                    if (0 == k % 7 && a.settings.show_week_number) {
                        var g = new Date(l, s, k - d + 1),
                            e = g.getFullYear(),
                            n = g.getMonth() + 1,
                            g = g.getDate(),
                            h = void 0,
                            j = void 0,
                            q = void 0,
                            p = q = void 0,
                            r = void 0,
                            q = j = h = void 0;
                        3 > n ? (h = e - 1, j = (h / 4 | 0) - (h / 100 | 0) + (h / 400 | 0), q = ((h - 1) / 4 | 0) - ((h - 1) / 100 | 0) + ((h - 1) / 400 | 0), q = j - q, p = 0, r = g - 1 + 31 * (n - 1)) : (h = e, j = (h / 4 | 0) - (h / 100 | 0) + (h / 400 | 0), q = ((h - 1) / 4 | 0) - ((h - 1) / 100 | 0) + ((h - 1) / 400 | 0), q = j - q, p = q + 1, r = g + ((153 * (n - 3) + 2) / 5 | 0) + 58 + q);
                        h = (h + j) % 7;
                        g = (r + h - p) % 7;
                        j = r + 3 - g;
                        q = 0 > j ? 53 - ((h - q) / 5 | 0) : j > 364 + q ? 1 : (j / 7 | 0) + 1;
                        f += '<td class="dp_week_number">' + q + "</td>"
                    }
                    e = k - d + 1;
                    k < d ? f += '<td class="dp_not_in_month">' + x(m - d + k + 1, a.settings.zero_pad ? 2 : 0) + "</td>" : e > c ? f += '<td class="dp_not_in_month">' + x(e - c, a.settings.zero_pad ? 2 : 0) + "</td>" : (n = (a.settings.first_day_of_week + k) % 7, g = "", D(l, s, e) ? (g = -1 < b.inArray(n, a.settings.weekend_days) ? "dp_weekend_disabled" : g + " dp_disabled", s == V && (l == P && X == e) && (g += " dp_disabled_current")) : (-1 < b.inArray(n, a.settings.weekend_days) && (g = "dp_weekend"), s == J && (l == K && Q == e) && (g += " dp_selected"), s == V && (l == P && X == e) && (g += " dp_current")), f += "<td" + ("" != g ? ' class="' + b.trim(g) + '"' : "") + ">" + (a.settings.zero_pad ? x(e, 2) : e) + "</td>")
                }
                B.html(b(f + "</tr>"));
                a.settings.always_visible && (aa = b("td:not(.dp_disabled, .dp_weekend_disabled, .dp_not_in_month, .dp_blocked, .dp_week_number)", B));
                B.css("display", "")
            },
            fa = function(a) {
                if (b.browser.msie && b.browser.version.match(/^6/)) {
                    if (!R) {
                        var d = h(j.css("zIndex")) - 1;
                        R = jQuery("<iframe>", {
                            src: 'javascript:document.write("")',
                            scrolling: "no",
                            frameborder: 0,
                            allowtransparency: "true",
                            css: {
                                zIndex: d,
                                position: "absolute",
                                top: -1E3,
                                left: -1E3,
                                width: j.outerWidth(),
                                height: j.outerHeight(),
                                filter: "progid:DXImageTransform.Microsoft.Alpha(opacity=0)",
                                display: "none"
                            }
                        });
                        b("body").append(R)
                    }
                    switch (a) {
                        case "hide":
                            R.css("display", "none");
                            break;
                        default:
                            a = j.offset(), R.css({
                                top: a.top,
                                left: a.left,
                                display: "block"
                            })
                    }
                }
            },
            D = function(c, d, m) {
                if (b.isArray(a.settings.direction) || 0 !== h(a.settings.direction)) {
                    var f = h(H(c, "undefined" != typeof d ? x(d, 2) : "", "undefined" != typeof m ? x(m, 2) : "")),
                        k = (f + "").length;
                    if (8 == k && ("undefined" != typeof v && f < h(H(u, x(r, 2), x(y, 2))) || "undefined" != typeof w && f > h(H(L, x(N, 2), x(S, 2)))) || 6 == k && ("undefined" != typeof v && f < h(H(u, x(r, 2))) || "undefined" != typeof w && f > h(H(L, x(N, 2)))) || 4 == k && ("undefined" != typeof v && f < u || "undefined" != typeof w && f > L)) return !0
                }
                if (W) {
                    "undefined" != typeof d && (d += 1);
                    var g = !1;
                    b.each(W, function() {
                        if (!g && (-1 < b.inArray(c, this[2]) || -1 < b.inArray("*", this[2])))
                            if ("undefined" != typeof d && -1 < b.inArray(d, this[1]) || -1 < b.inArray("*", this[1]))
                                if ("undefined" != typeof m && -1 < b.inArray(m, this[0]) || -1 < b.inArray("*", this[0])) {
                                    if ("*" == this[3]) return g = !0;
                                    var a = (new Date(c, d - 1, m)).getDay();
                                    if (-1 < b.inArray(a, this[3])) return g = !0
                                }
                    });
                    if (g) return !0
                }
                return !1
            },
            O = function(a) {
                return (a + "").match(/^\-?[0-9]+$/) ? !0 : !1
            },
            $ = function(c) {
                b(".dp_caption", z).html(c);
                if (b.isArray(a.settings.direction) || 0 !== h(a.settings.direction)) {
                    c = l;
                    var d = s,
                        m, f;
                    "days" == p ? (f = 0 > d - 1 ? H(c - 1, "11") : H(c, x(d - 1, 2)), m = 11 < d + 1 ? H(c + 1, "00") : H(c, x(d + 1, 2))) : "months" == p ? (f = c - 1, m = c + 1) : "years" == p && (f = c - 7, m = c + 7);
                    D(f) ? (b(".dp_previous", z).addClass("dp_blocked"), b(".dp_previous", z).removeClass("dp_hover")) : b(".dp_previous", z).removeClass("dp_blocked");
                    D(m) ? (b(".dp_next", z).addClass("dp_blocked"), b(".dp_next", z).removeClass("dp_hover")) : b(".dp_next", z).removeClass("dp_blocked")
                }
            },
            M = function() {
                if ("" == B.text() || "days" == p) {
                    if ("" == B.text()) {
                        a.settings.always_visible || j.css("left", -1E3);
                        j.css({
                            display: "block"
                        });
                        ga();
                        var c = B.outerWidth(),
                            d = B.outerHeight();
                        z.css("width", c);
                        F.css({
                            width: c,
                            height: d
                        });
                        G.css({
                            width: c,
                            height: d
                        });
                        I.css("width", c);
                        j.css({
                            display: "none"
                        })
                    } else ga();
                    F.css("display", "none");
                    G.css("display", "none")
                } else if ("months" == p) {
                    $(l);
                    c = "<tr>";
                    for (d = 0; 12 > d; d++) {
                        0 < d && 0 == d % 3 && (c += "</tr><tr>");
                        var m = "dp_month_" + d;
                        D(l, d) ? m += " dp_disabled" : !1 !== J && J == d ? m += " dp_selected" : V == d && P == l && (m += " dp_current");
                        c += '<td class="' + b.trim(m) + '">' + (b.isArray(a.settings.months_abbr) && void 0 != a.settings.months_abbr[d] ? a.settings.months_abbr[d] : a.settings.months[d].substr(0, 3)) + "</td>"
                    }
                    F.html(b(c + "</tr>"));
                    a.settings.always_visible && (ba = b("td:not(.dp_disabled)", F));
                    F.css("display", "");
                    B.css("display", "none");
                    G.css("display", "none")
                } else if ("years" == p) {
                    $(l - 7 + " - " + (l + 4));
                    c = "<tr>";
                    for (d = 0; 12 > d; d++) 0 < d && 0 == d % 3 && (c += "</tr><tr>"), m = "", D(l - 7 + d) ? m += " dp_disabled" : K && K == l - 7 + d ? m += " dp_selected" : P == l - 7 + d && (m += " dp_current"), c += "<td" + ("" != b.trim(m) ? ' class="' + b.trim(m) + '"' : "") + ">" + (l - 7 + d) + "</td>";
                    G.html(b(c + "</tr>"));
                    a.settings.always_visible && (ca = b("td:not(.dp_disabled)", G));
                    G.css("display", "");
                    B.css("display", "none");
                    F.css("display", "none")
                }
                a.settings.onChange && ("function" == typeof a.settings.onChange && void 0 != p) && (c = "days" == p ? B.find("td:not(.dp_disabled, .dp_weekend_disabled, .dp_not_in_month, .dp_blocked)") : "months" == p ? F.find("td:not(.dp_disabled, .dp_weekend_disabled, .dp_not_in_month, .dp_blocked)") : G.find("td:not(.dp_disabled, .dp_weekend_disabled, .dp_not_in_month, .dp_blocked)"), c.each(function() {
                    if ("days" == p) b(this).data("date", l + "-" + x(s + 1, 2) + "-" + x(h(b(this).text()), 2));
                    else if ("months" == p) {
                        var a = b(this).attr("class").match(/dp\_month\_([0-9]+)/);
                        b(this).data("date", l + "-" + x(h(a[1]) + 1, 2))
                    } else b(this).data("date", h(b(this).text()))
                }), a.settings.onChange(p, c, n));
                (a.settings.always_show_clear || a.settings.always_visible || "" != n.val()) && "block" != I.css("display") ? I.css("display", "") : I.css("display", "none")
            },
            Z = function(c, d, h, f, k) {
                var g = new Date(c, d, h, 12, 0, 0);
                f = "days" == f ? aa : "months" == f ? ba : ca;
                var e;
                e = "";
                for (var j = g.getDate(), p = g.getDay(), r = a.settings.days[p], q = g.getMonth() + 1, u = a.settings.months[q - 1], t = g.getFullYear() + "", v = 0; v < a.settings.format.length; v++) {
                    var w = a.settings.format.charAt(v);
                    switch (w) {
                        case "y":
                            t = t.substr(2);
                        case "Y":
                            e += t;
                            break;
                        case "m":
                            q = x(q, 2);
                        case "n":
                            e += q;
                            break;
                        case "M":
                            u = b.isArray(a.settings.months_abbr) && void 0 != a.settings.months_abbr[q - 1] ? a.settings.months_abbr[q - 1] : a.settings.months[q - 1].substr(0, 3);
                        case "F":
                            e += u;
                            break;
                        case "d":
                            j = x(j, 2);
                        case "j":
                            e += j;
                            break;
                        case "D":
                            r = b.isArray(a.settings.days_abbr) && void 0 != a.settings.days_abbr[q - 1] ? a.settings.days_abbr[q - 1] : a.settings.days[q - 1].substr(0, 3);
                        case "l":
                            e += r;
                            break;
                        case "N":
                            p++;
                        case "w":
                            e += p;
                            break;
                        case "S":
                            e = 1 == j % 10 && "11" != j ? e + "st" : 2 == j % 10 && "12" != j ? e + "nd" : 3 == j % 10 && "13" != j ? e + "rd" : e + "th";
                            break;
                        default:
                            e += w
                    }
                }
                n.val(e);
                a.settings.always_visible && (J = g.getMonth(), s = g.getMonth(), K = g.getFullYear(), l = g.getFullYear(), Q = g.getDate(), f.removeClass("dp_selected"), k.addClass("dp_selected"));
                a.hide();
                da(g);
                if (a.settings.onSelect && "function" == typeof a.settings.onSelect) a.settings.onSelect(e, c + "-" + x(d + 1, 2) + "-" + x(h, 2), g, n)
            },
            H = function() {
                for (var a = "", b = 0; b < arguments.length; b++) a += arguments[b] + "";
                return a
            },
            x = function(a, b) {
                for (a += ""; a.length < b;) a = "0" + a;
                return a
            },
            h = function(a) {
                return parseInt(a, 10)
            },
            da = function(b) {
                if (a.settings.pair)
                    if (!a.settings.pair.data || !a.settings.pair.data("Zebra_DatePicker")) a.settings.pair.data("zdp_reference_date", b);
                    else {
                        var d = a.settings.pair.data("Zebra_DatePicker");
                        d.update({
                            reference_date: b,
                            direction: 0 == d.settings.direction ? 1 : d.settings.direction
                        });
                        d.settings.always_visible && d.show()
                    }
            };
        a._keyup = function(b) {
            ("block" == j.css("display") || 27 == b.which) && a.hide();
            return !0
        };
        a._mousedown = function(c) {
            if ("block" == j.css("display")) {
                if (a.settings.show_icon && b(c.target).get(0) === t.get(0)) return !0;
                0 == b(c.target).parents().filter(".Zebra_DatePicker").length && a.hide()
            }
            return !0
        };
        ea()
    };
    b.fn.Zebra_DatePicker = function(U) {
        return this.each(function() {
            if (void 0 != b(this).data("Zebra_DatePicker")) {
                var E = b(this).data("Zebra_DatePicker");
                void 0 != E.icon && E.icon.remove();
                E.datepicker.remove();
                b(document).unbind("keyup", E._keyup);
                b(document).unbind("mousedown", E._mousedown)
            }
            E = new b.Zebra_DatePicker(this, U);
            b(this).data("Zebra_DatePicker", E)
        })
    }
})(jQuery);