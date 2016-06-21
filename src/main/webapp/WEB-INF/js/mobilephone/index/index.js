function Swipe(container, options) {
    "use strict";
    var noop = function () {
    };
    var offloadFn = function (fn) {
        setTimeout(fn || noop, 0)
    };
    var browser = {
        addEventListener: !!window.addEventListener,
        touch: ('ontouchstart'in window) || window.DocumentTouch && document instanceof DocumentTouch,
        transitions: (function (temp) {
            var props = ['transitionProperty', 'WebkitTransition', 'MozTransition', 'OTransition', 'msTransition'];
            for (var i in props)if (temp.style[props[i]] !== undefined)return true;
            return false;
        })(document.createElement('swipe'))
    };
    if (!container)return;
    var element = container.children[0];
    var slides, slidePos, width, length;
    options = options || {};
    var index = parseInt(options.startSlide, 10) || 0;
    var speed = options.speed || 300;
    options.continuous = options.continuous !== undefined ? options.continuous : true;
    function setup() {
        slides = element.children;
        length = slides.length;
        if (slides.length < 2)options.continuous = false;
        if (browser.transitions && options.continuous && slides.length < 3) {
            element.appendChild(slides[0].cloneNode(true));
            element.appendChild(element.children[1].cloneNode(true));
            slides = element.children;
        }
        slidePos = new Array(slides.length);
        width = container.getBoundingClientRect().width || container.offsetWidth;
        element.style.width = (slides.length * width) + 'px';
        var pos = slides.length;
        while (pos--) {
            var slide = slides[pos];
            slide.style.width = width + 'px';
            slide.setAttribute('data-index', pos);
            if (browser.transitions) {
                slide.style.left = (pos * -width) + 'px';
                move(pos, index > pos ? -width : (index < pos ? width : 0), 0);
            }
        }
        if (options.continuous && browser.transitions) {
            move(circle(index - 1), -width, 0);
            move(circle(index + 1), width, 0);
        }
        if (!browser.transitions)element.style.left = (index * -width) + 'px';
        container.style.visibility = 'visible';
    }

    function prev() {
        if (options.continuous)slide(index - 1); else if (index)slide(index - 1);
    }

    function next() {
        if (options.continuous)slide(index + 1); else if (index < slides.length - 1)slide(index + 1);
    }

    function circle(index) {
        return (slides.length + (index % slides.length)) % slides.length;
    }

    function slide(to, slideSpeed) {
        if (index == to)return;
        if (browser.transitions) {
            var direction = Math.abs(index - to) / (index - to);
            if (options.continuous) {
                var natural_direction = direction;
                direction = -slidePos[circle(to)] / width;
                if (direction !== natural_direction)to = -direction * slides.length + to;
            }
            var diff = Math.abs(index - to) - 1;
            while (diff--)move(circle((to > index ? to : index) - diff - 1), width * direction, 0);
            to = circle(to);
            move(index, width * direction, slideSpeed || speed);
            move(to, 0, slideSpeed || speed);
            if (options.continuous)move(circle(to - direction), -(width * direction), 0);
        } else {
            to = circle(to);
            animate(index * -width, to * -width, slideSpeed || speed);
        }
        index = to;
        offloadFn(options.callback && options.callback(index, slides[index]));
    }

    function move(index, dist, speed) {
        translate(index, dist, speed);
        slidePos[index] = dist;
    }

    function translate(index, dist, speed) {
        var slide = slides[index];
        var style = slide && slide.style;
        if (!style)return;
        style.webkitTransitionDuration = style.MozTransitionDuration = style.msTransitionDuration = style.OTransitionDuration = style.transitionDuration = speed + 'ms';
        style.webkitTransform = 'translate(' + dist + 'px,0)' + 'translateZ(0)';
        style.msTransform = style.MozTransform = style.OTransform = 'translateX(' + dist + 'px)';
    }

    function animate(from, to, speed) {
        if (!speed) {
            element.style.left = to + 'px';
            return;
        }
        var start = +new Date;
        var timer = setInterval(function () {
            var timeElap = +new Date - start;
            if (timeElap > speed) {
                element.style.left = to + 'px';
                if (delay)begin();
                options.transitionEnd && options.transitionEnd.call(event, index, slides[index]);
                clearInterval(timer);
                return;
            }
            element.style.left = (((to - from) * (Math.floor((timeElap / speed) * 100) / 100)) + from) + 'px';
        }, 4);
    }

    var delay = options.auto || 0;
    var interval;

    function begin() {
        interval = setTimeout(next, delay);
    }

    function stop() {
        delay = 0;
        clearTimeout(interval);
    }

    var start = {};
    var delta = {};
    var isScrolling;
    var events = {
        handleEvent: function (event) {
            switch (event.type) {
                case'touchstart':
                    this.start(event);
                    break;
                case'touchmove':
                    this.move(event);
                    break;
                case'touchend':
                    offloadFn(this.end(event));
                    break;
                case'webkitTransitionEnd':
                case'msTransitionEnd':
                case'oTransitionEnd':
                case'otransitionend':
                case'transitionend':
                    offloadFn(this.transitionEnd(event));
                    break;
                case'resize':
                    offloadFn(setup.call());
                    break;
            }
            if (options.stopPropagation)event.stopPropagation();
        }, start: function (event) {
            var touches = event.touches[0];
            start = {x: touches.pageX, y: touches.pageY, time: +new Date};
            isScrolling = undefined;
            delta = {};
            element.addEventListener('touchmove', this, false);
            element.addEventListener('touchend', this, false);
        }, move: function (event) {
            if (event.touches.length > 1 || event.scale && event.scale !== 1)return
            if (options.disableScroll)event.preventDefault();
            var touches = event.touches[0];
            delta = {x: touches.pageX - start.x, y: touches.pageY - start.y}
            if (typeof isScrolling == 'undefined') {
                isScrolling = !!(isScrolling || Math.abs(delta.x) < Math.abs(delta.y));
            }
            if (!isScrolling) {
                event.preventDefault();
                stop();
                if (options.continuous) {
                    translate(circle(index - 1), delta.x + slidePos[circle(index - 1)], 0);
                    translate(index, delta.x + slidePos[index], 0);
                    translate(circle(index + 1), delta.x + slidePos[circle(index + 1)], 0);
                } else {
                    delta.x = delta.x /
                        ((!index && delta.x > 0 || index == slides.length - 1 && delta.x < 0) ? (Math.abs(delta.x) / width + 1) : 1);
                    translate(index - 1, delta.x + slidePos[index - 1], 0);
                    translate(index, delta.x + slidePos[index], 0);
                    translate(index + 1, delta.x + slidePos[index + 1], 0);
                }
            }
        }, end: function (event) {
            var duration = +new Date - start.time;
            var isValidSlide = Number(duration) < 250 && Math.abs(delta.x) > 20 || Math.abs(delta.x) > width / 2;
            var isPastBounds = !index && delta.x > 0 || index == slides.length - 1 && delta.x < 0;
            if (options.continuous)isPastBounds = false;
            var direction = delta.x < 0;
            if (!isScrolling) {
                if (isValidSlide && !isPastBounds) {
                    if (direction) {
                        if (options.continuous) {
                            move(circle(index - 1), -width, 0);
                            move(circle(index + 2), width, 0);
                        } else {
                            move(index - 1, -width, 0);
                        }
                        move(index, slidePos[index] - width, speed);
                        move(circle(index + 1), slidePos[circle(index + 1)] - width, speed);
                        index = circle(index + 1);
                    } else {
                        if (options.continuous) {
                            move(circle(index + 1), width, 0);
                            move(circle(index - 2), -width, 0);
                        } else {
                            move(index + 1, width, 0);
                        }
                        move(index, slidePos[index] + width, speed);
                        move(circle(index - 1), slidePos[circle(index - 1)] + width, speed);
                        index = circle(index - 1);
                    }
                    options.callback && options.callback(index, slides[index]);
                } else {
                    if (options.continuous) {
                        move(circle(index - 1), -width, speed);
                        move(index, 0, speed);
                        move(circle(index + 1), width, speed);
                    } else {
                        move(index - 1, -width, speed);
                        move(index, 0, speed);
                        move(index + 1, width, speed);
                    }
                }
            }
            element.removeEventListener('touchmove', events, false)
            element.removeEventListener('touchend', events, false)
        }, transitionEnd: function (event) {
            if (parseInt(event.target.getAttribute('data-index'), 10) == index) {
                if (delay)begin();
                options.transitionEnd && options.transitionEnd.call(event, index, slides[index]);
            }
        }
    }
    setup();
    if (delay)begin();
    if (browser.addEventListener) {
        if (browser.touch)element.addEventListener('touchstart', events, false);
        if (browser.transitions) {
            element.addEventListener('webkitTransitionEnd', events, false);
            element.addEventListener('msTransitionEnd', events, false);
            element.addEventListener('oTransitionEnd', events, false);
            element.addEventListener('otransitionend', events, false);
            element.addEventListener('transitionend', events, false);
        }
        window.addEventListener('resize', events, false);
    } else {
        window.onresize = function () {
            setup()
        };
    }
    return {
        setup: function () {
            setup();
        }, slide: function (to, speed) {
            stop();
            slide(to, speed);
        }, prev: function () {
            stop();
            prev();
        }, next: function () {
            stop();
            next();
        }, getPos: function () {
            return index;
        }, getNumSlides: function () {
            return length;
        }, kill: function () {
            stop();
            element.style.width = 'auto';
            element.style.left = 0;
            var pos = slides.length;
            while (pos--) {
                var slide = slides[pos];
                slide.style.width = '100%';
                slide.style.left = 0;
                if (browser.transitions)translate(pos, 0, 0);
            }
            if (browser.addEventListener) {
                element.removeEventListener('touchstart', events, false);
                element.removeEventListener('webkitTransitionEnd', events, false);
                element.removeEventListener('msTransitionEnd', events, false);
                element.removeEventListener('oTransitionEnd', events, false);
                element.removeEventListener('otransitionend', events, false);
                element.removeEventListener('transitionend', events, false);
                window.removeEventListener('resize', events, false);
            }
            else {
                window.onresize = null;
            }
        }
    }
}
if (window.jQuery || window.Zepto) {
    (function ($) {
        $.fn.Swipe = function (params) {
            return this.each(function () {
                $(this).data('Swipe', new Swipe($(this)[0], params));
            });
        }
    })(window.jQuery || window.Zepto)
}

function alertMsg(msg, mode, title) {
    msg = msg || '';
    mode = mode || 0;
    title = title || '温馨提示';
    var top = document.body.scrollTop || document.documentElement.scrollTop;
    var isIe = (document.all) ? true : false;
    var isIE6 = isIe && !window.XMLHttpRequest;
    var sTop = document.documentElement.scrollTop || document.body.scrollTop;
    var sLeft = document.documentElement.scrollLeft || document.body.scrollLeft;
    var winSize = function () {
        var xScroll, yScroll, windowWidth, windowHeight, pageWidth, pageHeight;
        if (window.innerHeight && window.scrollMaxY) {
            xScroll = document.body.scrollWidth;
            yScroll = window.innerHeight + window.scrollMaxY;
        } else if (document.body.scrollHeight > document.body.offsetHeight) {
            xScroll = document.body.scrollWidth;
            yScroll = document.body.scrollHeight;
        } else {
            xScroll = document.body.offsetWidth;
            yScroll = document.body.offsetHeight;
        }
        if (self.innerHeight) {
            windowWidth = self.innerWidth;
            windowHeight = self.innerHeight;
        } else if (document.documentElement && document.documentElement.clientHeight) {
            windowWidth = document.documentElement.clientWidth;
            windowHeight = document.documentElement.clientHeight;
        } else if (document.body) {
            windowWidth = document.body.clientWidth;
            windowHeight = document.body.clientHeight;
        }
        if (yScroll < windowHeight) {
            pageHeight = windowHeight;
        } else {
            pageHeight = yScroll;
        }
        if (xScroll < windowWidth) {
            pageWidth = windowWidth;
        } else {
            pageWidth = xScroll;
        }
        return {
            'pageWidth': pageWidth,
            'pageHeight': pageHeight,
            'windowWidth': windowWidth,
            'windowHeight': windowHeight
        }
    }();
    var styleStr = 'top:0;left:0;position:absolute;z-index:10000;background:black;width:100%;height:' + (winSize.pageHeight + 30) + 'px;';
    styleStr += (isIe) ? "filter:alpha(opacity=80);" : "opacity:0.8;";
    var shadowDiv = document.createElement('div');
    shadowDiv.style.cssText = styleStr;
    shadowDiv.id = "shadowDiv";
    if (isIE6) {
        var maskIframe = document.createElement('iframe');
        maskIframe.style.cssText = 'width:' + winSize.pageWidth + 'px;height:' + (winSize.pageHeight + 30) + 'px;position:absolute;visibility:inherit;z-index:-1;filter:alpha(opacity=0);';
        maskIframe.frameborder = 0;
        maskIframe.src = "about:blank";
        shadowDiv.appendChild(maskIframe);
    }
    document.body.insertBefore(shadowDiv, document.body.firstChild);
    var styleStr1 = 'display:block;position:fixed;_position:absolute;left:6%;top:' + (winSize.windowHeight / 2 - 90) + 'px;_top:' + (winSize.windowHeight / 2 + top - 150) + 'px;';
    var alertBox = document.createElement('div');
    alertBox.id = 'alertMsg';
    alertBox.style.cssText = styleStr1;
    var alertMsg_title = document.createElement('h3');
    alertMsg_title.innerHTML = title;
    var alertMsg_info = document.createElement('P');
    alertMsg_info.id = 'alertMsg_info';
    alertMsg_info.innerHTML = msg;
    alertBox.appendChild(alertMsg_title);
    alertBox.appendChild(alertMsg_info);
    var btn1 = document.createElement('a');
    btn1.id = 'alertMsg_btn1';
    btn1.href = 'javas' + 'cript:void(0)';
    btn1.innerHTML = '<cite>确定</cite>';
    btn1.onclick = function () {
        document.body.removeChild(alertBox);
        document.body.removeChild(shadowDiv);
        return true;
    };
    alertBox.appendChild(btn1);
    if (mode === 1) {
        var btn2 = document.createElement('a');
        btn2.id = 'alertMsg_btn2';
        btn2.href = 'javas' + 'cript:void(0)';
        btn2.innerHTML = '<cite>取消</cite>';
        btn2.onclick = function () {
            document.body.removeChild(alertBox);
            document.body.removeChild(shadowDiv);
            return false;
        };
        alertBox.appendChild(btn2);
    }
    document.body.appendChild(alertBox);
}
;
(function ($) {
    $.fn.extend({
        autocomplete: function (urlOrData, options) {
            var isUrl = typeof urlOrData == "string";
            options = $.extend({}, $.Autocompleter.defaults, {
                url: isUrl ? urlOrData : null,
                data: isUrl ? null : urlOrData,
                delay: isUrl ? $.Autocompleter.defaults.delay : 10,
                max: options && !options.scroll ? 10 : 150
            }, options);
            options.highlight = options.highlight || function (value) {
                    return value;
                };
            options.formatMatch = options.formatMatch || options.formatItem;
            return this.each(function () {
                new $.Autocompleter(this, options);
            });
        }, result: function (handler) {
            return this.bind("result", handler);
        }, search: function (handler) {
            return this.trigger("search", [handler]);
        }, flushCache: function () {
            return this.trigger("flushCache");
        }, setOptions: function (options) {
            return this.trigger("setOptions", [options]);
        }, unautocomplete: function () {
            return this.trigger("unautocomplete");
        }
    });
    $.Autocompleter = function (input, options) {
        var KEY = {
            UP: 38,
            DOWN: 40,
            DEL: 46,
            TAB: 9,
            RETURN: 13,
            ESC: 27,
            COMMA: 188,
            PAGEUP: 33,
            PAGEDOWN: 34,
            BACKSPACE: 8,
            LEFT: 37,
            RIGHT: 39
        };
        var $input = $(input).attr("autocomplete", "off").addClass(options.inputClass);
        var timeout;
        var previousValue = "";
        var cache = $.Autocompleter.Cache(options);
        var hasFocus = 0;
        var lastKeyPressCode;
        var config = {mouseDownOnSelect: false};
        var select = $.Autocompleter.Select(options, input, selectCurrent, config);
        var blockSubmit;
        $.browser.opera && $(input.form).bind("submit.autocomplete", function () {
            if (blockSubmit) {
                blockSubmit = false;
                return false;
            }
        });
        $input.bind(($.browser.opera ? "keypress" : "keydown") + ".autocomplete", function (event) {
            hasFocus = 1;
            lastKeyPressCode = event.keyCode;
            switch (event.keyCode) {
                case KEY.LEFT:
                    if (event.shiftKey)select.firstPage(); else select.prevPage();
                    break;
                case KEY.RIGHT:
                    if (event.shiftKey)select.lastPage(); else select.nextPage();
                    break;
                case KEY.UP:
                    event.preventDefault();
                    if (select.visible()) {
                        select.prev();
                    } else {
                        onChange(0, true);
                    }
                    break;
                case KEY.DOWN:
                    event.preventDefault();
                    if (select.visible()) {
                        select.next();
                    } else {
                        onChange(0, true);
                    }
                    break;
                case KEY.PAGEUP:
                    event.preventDefault();
                    if (select.visible()) {
                        select.pageUp();
                    } else {
                        onChange(0, true);
                    }
                    break;
                case KEY.PAGEDOWN:
                    event.preventDefault();
                    if (select.visible()) {
                        select.pageDown();
                    } else {
                        onChange(0, true);
                    }
                    break;
                case options.multiple && $.trim(options.multipleSeparator) == "," && KEY.COMMA:
                case KEY.TAB:
                case KEY.RETURN:
                    if (selectCurrent()) {
                        event.preventDefault();
                        blockSubmit = true;
                        return false;
                    }
                    break;
                case KEY.ESC:
                    select.hide();
                    break;
                default:
                    clearTimeout(timeout);
                    timeout = setTimeout(onChange, options.delay);
                    break;
            }
        }).focus(function () {
            hasFocus++;
        }).blur(function () {
            hasFocus = 0;
            if (!config.mouseDownOnSelect) {
                hideResults();
            }
        }).click(function () {
            if (hasFocus++ > 1 && !select.visible()) {
                onChange(0, true);
            }
        }).bind("search", function () {
            var fn = (arguments.length > 1) ? arguments[1] : null;

            function findValueCallback(q, data) {
                var result;
                if (data && data.length) {
                    for (var i = 0; i < data.length; i++) {
                        if (data[i].result.toLowerCase() == q.toLowerCase()) {
                            result = data[i];
                            break;
                        }
                    }
                }
                if (typeof fn == "function")fn(result); else $input.trigger("result", result && [result.data, result.value]);
            }

            $.each(trimWords($input.val()), function (i, value) {
                request(value, findValueCallback, findValueCallback);
            });
        }).bind("flushCache", function () {
            cache.flush();
        }).bind("setOptions", function () {
            $.extend(options, arguments[1]);
            if ("data"in arguments[1])
                cache.populate();
        }).bind("input", function () {
            onChange(0, true);
        }).bind("unautocomplete", function () {
            select.unbind();
            $input.unbind();
            $(input.form).unbind(".autocomplete");
            cache.flush();
        }).bind("change", function () {
            $input.search(function (result) {
                if (result) {
                    $input.trigger("result", result && [result.data, result.value]);
                } else {
                    $input.trigger("unmatch");
                }
            });
        });
        function selectCurrent() {
            var selected = select.selected();
            if (!selected)
                return false;
            var v = selected.result;
            previousValue = v;
            if (options.multiple) {
                var words = trimWords($input.val());
                if (words.length > 1) {
                    var seperator = options.multipleSeparator.length;
                    var cursorAt = $(input).selection().start;
                    var wordAt, progress = 0;
                    $.each(words, function (i, word) {
                        progress += word.length;
                        if (cursorAt <= progress) {
                            wordAt = i;
                            return false;
                        }
                        progress += seperator;
                    });
                    words[wordAt] = v;
                    v = words.join(options.multipleSeparator);
                }
                v += options.multipleSeparator;
            }
            $input.val(v);
            options.isAutoComplete = false;
            hideResultsNow();
            $input.trigger("result", [selected.data, selected.value]);
            return true;
        }

        function onChange(crap, skipPrevCheck) {
            if (options.onBegin) {
                var op = options.onBegin(options);
                if (op) {
                    $.extend(options, op);
                }
            }
            if (lastKeyPressCode == KEY.DEL) {
                select.hide();
                return;
            }
            var currentValue = $input.val();
            if (!skipPrevCheck && currentValue == previousValue)
                return;
            previousValue = currentValue;
            currentValue = lastWord(currentValue);
            if (currentValue.length >= options.minChars) {
                $input.addClass(options.loadingClass);
                if (!options.matchCase)
                    currentValue = currentValue.toLowerCase();
                request(currentValue, receiveData, hideResultsNow);
            } else {
                stopLoading();
                select.hide();
            }
        };
        function trimWords(value) {
            if (!value)
                return [""];
            if (!options.multiple)
                return [$.trim(value)];
            return $.map(value.split(options.multipleSeparator), function (word) {
                return $.trim(value).length ? $.trim(word) : null;
            });
        }

        function lastWord(value) {
            if (!options.multiple)
                return value;
            var words = trimWords(value);
            if (words.length == 1)
                return words[0];
            var cursorAt = $(input).selection().start;
            if (cursorAt == value.length) {
                words = trimWords(value)
            } else {
                words = trimWords(value.replace(value.substring(cursorAt), ""));
            }
            return words[words.length - 1];
        }

        function autoFill(q, sValue) {
            if (options.autoFill && (lastWord($input.val()).toLowerCase() == q.toLowerCase()) && lastKeyPressCode != KEY.BACKSPACE) {
                $input.val($input.val() + sValue.substring(lastWord(previousValue).length));
                $(input).selection(previousValue.length, previousValue.length + sValue.length);
            }
        };
        function hideResults() {
            clearTimeout(timeout);
            timeout = setTimeout(hideResultsNow, 200);
        };
        function hideResultsNow() {
            var wasVisible = select.visible();
            select.hide();
            clearTimeout(timeout);
            stopLoading();
            if (options.mustMatch) {
                $input.search(function (result) {
                    if (!result) {
                        if (options.multiple) {
                            var words = trimWords($input.val()).slice(0, -1);
                            $input.val(words.join(options.multipleSeparator) + (words.length ? options.multipleSeparator : ""));
                        }
                        else {
                            $input.val("");
                            $input.trigger("result", null);
                        }
                    }
                });
            }
        };
        function receiveData(q, data) {
            if (data && data.length && hasFocus) {
                stopLoading();
                select.display(data, q);
                autoFill(q, data[0].value);
                select.show();
            } else {
                hideResultsNow();
            }
        };
        function request(term, success, failure) {
            if (!options.matchCase)
                term = term.toLowerCase();
            var data = cache.load(term);
            if (data && data.length) {
                success(term, data);
            } else if ((typeof options.url == "string") && (options.url.length > 0)) {
                var extraParams = {timestamp: +new Date()};
                $.each(options.extraParams, function (key, param) {
                    extraParams[key] = typeof param == "function" ? param() : param;
                });
                $.ajax({
                    mode: "abort",
                    port: "autocomplete" + input.name,
                    dataType: options.dataType,
                    url: options.url,
                    data: $.extend({q: lastWord(term), limit: options.max}, extraParams),
                    success: function (data) {
                        var parsed = options.parse && options.parse(data) || parse(data);
                        cache.add(term, parsed);
                        success(term, parsed);
                    }
                });
            } else {
                select.emptyList();
                failure(term);
            }
        };
        function parse(data) {
            var parsed = [];
            var rows = data.split("\n");
            for (var i = 0; i < rows.length; i++) {
                var row = $.trim(rows[i]);
                if (row) {
                    row = row.split("|");
                    parsed[parsed.length] = {
                        data: row,
                        value: row[0],
                        result: options.formatResult && options.formatResult(row, row[0]) || row[0]
                    };
                }
            }
            return parsed;
        };
        function stopLoading() {
            $input.removeClass(options.loadingClass);
        };
    };
    $.Autocompleter.defaults = {
        inputClass: "ac_input",
        resultsClass: "ac_results",
        loadingClass: "ac_loading",
        minChars: 1,
        delay: 400,
        matchCase: false,
        matchSubset: true,
        matchContains: false,
        cacheLength: 10,
        max: 100,
        mustMatch: false,
        extraParams: {},
        selectFirst: true,
        formatItem: function (row) {
            return row[0];
        },
        formatMatch: null,
        autoFill: false,
        width: 0,
        multiple: false,
        multipleSeparator: ", ",
        highlight: function (value, term) {
            return value.replace(new RegExp("(?![^&;]+;)(?!<[^<>]*)(" + term.replace(/([\^\$\(\)\[\]\{\}\*\.\+\?\|\\])/gi, "\\$1") + ")(?![^<>]*>)(?![^&;]+;)", "gi"), "<strong>$1</strong>");
        },
        scroll: true,
        scrollHeight: 300,
        navi_class: 'ac_navi',
        navi_num: 5,
        navi_simple: false,
        per_page: 10,
        page: true,
        onBegin: null
    };
    $.Autocompleter.Cache = function (options) {
        var data = {};
        var length = 0;

        function matchSubset(s, sub) {
            if (!options.matchCase)
                s = s.toLowerCase();
            var i = s.indexOf(sub);
            if (options.matchContains == "word") {
                i = s.toLowerCase().search("\\b" + sub.toLowerCase());
            }
            if (i == -1)return false;
            return i == 0 || options.matchContains;
        };
        function add(q, value) {
            if (length > options.cacheLength) {
                flush();
            }
            if (!data[q]) {
                length++;
            }
            data[q] = value;
        }

        function populate() {
            if (!options.data)return false;
            var stMatchSets = {}, nullData = 0;
            if (!options.url)options.cacheLength = 1;
            stMatchSets[""] = [];
            for (var i = 0, ol = options.data.length; i < ol; i++) {
                var rawValue = options.data[i];
                rawValue = (typeof rawValue == "string") ? [rawValue] : rawValue;
                var value = options.formatMatch(rawValue, i + 1, options.data.length);
                if (value === false)
                    continue;
                var firstChar = value.charAt(0).toLowerCase();
                if (!stMatchSets[firstChar])
                    stMatchSets[firstChar] = [];
                var row = {
                    value: value,
                    data: rawValue,
                    result: options.formatResult && options.formatResult(rawValue) || value
                };
                stMatchSets[firstChar].push(row);
                if (nullData++ < options.max) {
                    stMatchSets[""].push(row);
                }
            }
            ;
            $.each(stMatchSets, function (i, value) {
                options.cacheLength++;
                add(i, value);
            });
        }

        setTimeout(populate, 25);
        function flush() {
            data = {};
            length = 0;
        }

        return {
            flush: flush, add: add, populate: populate, load: function (q) {
                if (!options.cacheLength || !length)
                    return null;
                if (!options.url && options.matchContains) {
                    var csub = [];
                    for (var k in data) {
                        if (k.length > 0) {
                            var c = data[k];
                            $.each(c, function (i, x) {
                                if (matchSubset(x.value, q)) {
                                    csub.push(x);
                                }
                            });
                        }
                    }
                    return csub;
                } else if (data[q]) {
                    return data[q];
                } else if (options.matchSubset) {
                    for (var i = q.length - 1; i >= options.minChars; i--) {
                        var c = data[q.substr(0, i)];
                        if (c) {
                            var csub = [];
                            $.each(c, function (i, x) {
                                if (matchSubset(x.value, q)) {
                                    csub[csub.length] = x;
                                }
                            });
                            return csub;
                        }
                    }
                }
                return null;
            }
        };
    };
    $.Autocompleter.Select = function (options, input, select, config) {
        var CLASSES = {ACTIVE: "ac_over"};
        var msg = {
            'page_info': '显示num_page_top - num_page_end 条 总共cnt条记录',
            'prev': '上一页',
            'first_title': '首页 (Shift + 左键)',
            'next': '下一页',
            'next_title': '下' + options.per_page + '条 (右键)',
            'prev_title': '上' + options.per_page + '条 (左键)',
            'last_title': '末页 (Shift + 右键)'
        };
        var listItems, active = -1, data, term = "", needsInit = true, element, list, $navi, pageNo = 1, lastPageNo = 1;

        function init() {
            if (!needsInit)
                return;
            element = $("<div/>").hide().addClass(options.resultsClass).css("position", "absolute").appendTo(document.body);
            element.append(options.tableHead);
            list = $("<ul/>").appendTo(element).mouseover(function (event) {
                if (target(event).nodeName && target(event).nodeName.toUpperCase() == 'LI') {
                    active = $("li", list).removeClass(CLASSES.ACTIVE).index(target(event));
                    $(target(event)).addClass(CLASSES.ACTIVE);
                }
            }).click(function (event) {
                $(target(event)).addClass(CLASSES.ACTIVE);
                select();
                input.focus();
                return false;
            }).mousedown(function () {
                config.mouseDownOnSelect = true;
            }).mouseup(function () {
                config.mouseDownOnSelect = false;
            });
            $navi = $('<div></div>').addClass(options.navi_class);
            $navi.appendTo(element);
            if (options.width > 0)
                element.css("width", options.width);
            needsInit = false;
        }

        function target(event) {
            var element = event.target;
            while (element && element.tagName != "LI")
                element = element.parentNode;
            if (!element)
                return [];
            return element;
        }

        function moveSelect(step) {
            listItems.slice(active, active + 1).removeClass(CLASSES.ACTIVE);
            movePosition(step);
            var activeItem = listItems.slice(active, active + 1).addClass(CLASSES.ACTIVE);
            if (options.scroll) {
                var offset = 0;
                listItems.slice(0, active).each(function () {
                    offset += this.offsetHeight;
                });
                if ((offset + activeItem[0].offsetHeight - list.scrollTop()) > list[0].clientHeight) {
                    list.scrollTop(offset + activeItem[0].offsetHeight - list.innerHeight());
                } else if (offset < list.scrollTop()) {
                    list.scrollTop(offset);
                }
            }
        };
        function movePosition(step) {
            active += step;
            if (active < 0) {
                active = listItems.size() - 1;
            } else if (active >= listItems.size()) {
                active = 0;
            }
        }

        function limitNumberOfItems(available) {
            return options.max && options.max < available ? options.max : available;
        }

        function fillList() {
            list.empty();
            var startNum = (pageNo - 1) * options.per_page;
            for (var i = startNum; i < startNum + options.per_page; i++) {
                if (!data[i])
                    continue;
                var formatted = options.formatItem(data[i].data, i + 1, options.per_page, data[i].value, term);
                if (formatted === false)
                    continue;
                var li = $("<li/>").html(options.highlight(formatted, term)).addClass(i % 2 == 0 ? "ac_even" : "ac_odd").appendTo(list)[0];
                $.data(li, "ac_data", data[i]);
            }
            listItems = list.find("li");
            if (options.selectFirst) {
                listItems.slice(0, 1).addClass(CLASSES.ACTIVE);
                active = 0;
            }
            if ($.fn.bgiframe)
                list.bgiframe();
            if (options.page)
                setNavi(data.length, listItems.length, pageNo);
        }

        function setNavi(cnt, cnt_page, page_num) {
            var pageSize = options.per_page;
            var num_page_top = pageSize * (page_num - 1) + 1;
            var num_page_end = num_page_top + cnt_page - 1;
            var cnt_result = msg['page_info'].replace('cnt', cnt).replace('num_page_top', num_page_top).replace('num_page_end', num_page_end);
            $navi.text(cnt_result);
            var navi_p = $('<p></p>');
            lastPageNo = Math.ceil(cnt / pageSize);
            var left = page_num - Math.ceil((options.navi_num - 1) / 2);
            var right = page_num + Math.floor((options.navi_num - 1) / 2);
            while (left < 1) {
                left++;
                right++;
            }
            while (right > lastPageNo) {
                right--;
            }
            while ((right - left < options.navi_num - 1) && left > 1) {
                left--;
            }
            if (page_num == 1) {
                if (!options.navi_simple) {
                    $('<span></span>').text('<< 1').addClass('page_end').appendTo(navi_p);
                }
                $('<span></span>').text(msg['prev']).addClass('page_end').appendTo(navi_p);
            } else {
                if (!options.navi_simple) {
                    $('<a></a>').attr({
                        'href': 'javascript:void(0)',
                        'class': 'navi_first'
                    }).text('<< 1').attr('title', msg['first_title']).appendTo(navi_p);
                }
                $('<a></a>').attr({
                    'href': 'javascript:void(0)',
                    'class': 'navi_prev'
                }).text(msg['prev']).attr('title', msg['prev_title']).appendTo(navi_p);
            }
            for (i = left; i <= right; i++) {
                var num_link = (i == page_num) ? '<span class="current">' + i + '</span>' : i;
                $('<a></a>').attr({'href': 'javascript:void(0)', 'class': 'navi_page'}).html(num_link).appendTo(navi_p);
            }
            if (page_num == lastPageNo) {
                $('<span></span>').text(msg['next']).addClass('page_end').appendTo(navi_p);
                if (!options.navi_simple) {
                    $('<span></span>').text(lastPageNo + ' >>').addClass('page_end').appendTo(navi_p);
                }
            } else {
                $('<a></a>').attr({
                    'href': 'javascript:void(0)',
                    'class': 'navi_next'
                }).text(msg['next']).attr('title', msg['next_title']).appendTo(navi_p);
                if (!options.navi_simple) {
                    $('<a></a>').attr({
                        'href': 'javascript:void(0)',
                        'class': 'navi_last'
                    }).text(lastPageNo + ' >>').attr('title', msg['last_title']).appendTo(navi_p);
                }
            }
            if (lastPageNo > 1) {
                $navi.append(navi_p).show();
                $('.navi_first').click(function (event) {
                    event.preventDefault();
                    firstPage();
                    input.focus();
                    return false;
                }).mousedown(function () {
                    config.mouseDownOnSelect = true;
                }).mouseup(function () {
                    config.mouseDownOnSelect = false;
                });
                $('.navi_prev').click(function (event) {
                    event.preventDefault();
                    prevPage();
                    input.focus();
                    return false;
                }).mousedown(function () {
                    config.mouseDownOnSelect = true;
                }).mouseup(function () {
                    config.mouseDownOnSelect = false;
                });
                $('.navi_page').click(function (event) {
                    event.preventDefault();
                    pageNo = parseInt($(this).text(), 10);
                    fillList();
                    input.focus();
                    return false;
                }).mousedown(function () {
                    config.mouseDownOnSelect = true;
                }).mouseup(function () {
                    config.mouseDownOnSelect = false;
                });
                $('.navi_next').click(function (event) {
                    event.preventDefault();
                    nextPage();
                    input.focus();
                    return false;
                }).mousedown(function () {
                    config.mouseDownOnSelect = true;
                }).mouseup(function () {
                    config.mouseDownOnSelect = false;
                });
                $('.navi_last').click(function (event) {
                    event.preventDefault();
                    lastPage();
                    input.focus();
                    return false;
                }).mousedown(function () {
                    config.mouseDownOnSelect = true;
                }).mouseup(function () {
                    config.mouseDownOnSelect = false;
                });
            }
        }

        function firstPage() {
            if (pageNo > 1) {
                pageNo = 1;
                fillList();
            }
        }

        function prevPage() {
            if (pageNo > 1) {
                pageNo--;
                fillList();
            }
        }

        function nextPage() {
            if (pageNo < lastPageNo) {
                pageNo++;
                fillList();
            }
        }

        function lastPage() {
            if (pageNo < lastPageNo) {
                pageNo = lastPageNo;
                fillList();
            }
        }

        return {
            firstPage: function () {
                if (pageNo > 1) {
                    pageNo = 1;
                    fillList();
                }
            }, lastPage: function () {
                if (pageNo < lastPageNo) {
                    pageNo = lastPageNo;
                    fillList();
                }
            }, nextPage: function () {
                if (pageNo < lastPageNo) {
                    pageNo++;
                    fillList();
                }
            }, prevPage: function () {
                if (pageNo > 1) {
                    pageNo--;
                    fillList();
                }
            }, display: function (d, q) {
                init();
                pageNo = 1;
                lastPageNo = 1;
                data = d;
                term = q;
                fillList();
            }, next: function () {
                moveSelect(1);
            }, prev: function () {
                moveSelect(-1);
            }, pageUp: function () {
                if (active != 0 && active - 8 < 0) {
                    moveSelect(-active);
                } else {
                    moveSelect(-8);
                }
            }, pageDown: function () {
                if (active != listItems.size() - 1 && active + 8 > listItems.size()) {
                    moveSelect(listItems.size() - 1 - active);
                } else {
                    moveSelect(8);
                }
            }, hide: function () {
                element && element.hide();
                listItems && listItems.removeClass(CLASSES.ACTIVE);
                active = -1;
            }, visible: function () {
                return element && element.is(":visible");
            }, current: function () {
                return this.visible() && (listItems.filter("." + CLASSES.ACTIVE)[0] || options.selectFirst && listItems[0]);
            }, show: function () {
                var offset = $(input).offset();
                element.css({
                    width: typeof options.width == "string" || options.width > 0 ? options.width : $(input).width(),
                    top: offset.top + input.offsetHeight,
                    left: offset.left
                }).show();
                if (options.scroll) {
                    list.scrollTop(0);
                    list.css({maxHeight: options.scrollHeight, overflow: 'auto'});
                    if ($.browser.msie && typeof document.body.style.maxHeight === "undefined") {
                        var listHeight = 0;
                        listItems.each(function () {
                            listHeight += this.offsetHeight;
                        });
                        var scrollbarsVisible = listHeight > options.scrollHeight;
                        list.css('height', scrollbarsVisible ? options.scrollHeight : listHeight);
                        if (!scrollbarsVisible) {
                            listItems.width(list.width() - parseInt(listItems.css("padding-left")) - parseInt(listItems.css("padding-right")));
                        }
                    }
                }
            }, selected: function () {
                var selected = listItems && listItems.filter("." + CLASSES.ACTIVE).removeClass(CLASSES.ACTIVE);
                return selected && selected.length && $.data(selected[0], "ac_data");
            }, emptyList: function () {
                list && list.empty();
            }, unbind: function () {
                element && element.remove();
            }
        };
    };
    $.fn.selection = function (start, end) {
        if (start !== undefined) {
            return this.each(function () {
                if (this.createTextRange) {
                    var selRange = this.createTextRange();
                    if (end === undefined || start == end) {
                        selRange.move("character", start);
                        selRange.select();
                    } else {
                        selRange.collapse(true);
                        selRange.moveStart("character", start);
                        selRange.moveEnd("character", end);
                        selRange.select();
                    }
                } else if (this.setSelectionRange) {
                    this.setSelectionRange(start, end);
                } else if (this.selectionStart) {
                    this.selectionStart = start;
                    this.selectionEnd = end;
                }
            });
        }
        var field = this[0];
        if (field.createTextRange) {
            var range = document.selection.createRange(), orig = field.value, teststring = "<->", textLength = range.text.length;
            range.text = teststring;
            var caretAt = field.value.indexOf(teststring);
            field.value = orig;
            this.selection(caretAt, caretAt + textLength);
            return {start: caretAt, end: caretAt + textLength}
        } else if (field.selectionStart !== undefined) {
            return {start: field.selectionStart, end: field.selectionEnd}
        }
    };
})(jQuery);