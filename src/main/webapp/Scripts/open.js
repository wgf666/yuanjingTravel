(function(a) {
	a(document).ready(function() {
		a(".reserver-order .tab-link").live("click", function(g) {
			var d = a(this),
				c = d.parents("li"),
				f = d.parents("ul"),
				b = d.parents(".reserver-order");
			g.preventDefault();
			a("li", f).removeClass("current");
			c.addClass("current");
			a(".reserver-list", b).addClass("hidden");
			a("#" + d.attr("data-tab"), b).removeClass("hidden")
		})
	})
})(jQuery);
(function(a) {
	var b, f, c, d = 1,
		e = [];
	a.fn.counterDown = function(i, h) {
		var g = a(this);
		if (g.size() == 0) {
			return false
		}
		if (a(i, g).size() == 0) {
			return false
		}
		f = i;
		if (h == undefined || h == false) {
			c = false
		} else {
			if (h == true) {
				c = true
			}
		}
		a.timer(g)
	};
	a.timer = function(g) {
		var k = a(g).size(),
			h = 1000,
			l = 0;
		if (c) {
			d = 10;
			h = 100
		}
		for (var j = 0; j < k; j++) {
			l = parseInt(a(f, g[j]).attr("data-time"));
			if (c) {
				l = parseInt(l / 100)
			}
			e.push(l)
		}
		a(g).count();
		b = setInterval(function() {
			a(g).count()
		}, h)
	};
	a.fn.count = function() {
		var g = a(this);
		g.each(function(i) {
			var k, h = a(this),
				j = false;
			if (e[i] < 0) {
				j = true
			}
			k = e[i];
			e[i] = e[i] - 1;
			if (k == 0 || j) {
				clearInterval(b);
				a(".days").text(0);
				a(".hours").text(0);
				a(".minutes").text(0);
				a(".seconds").text(0)
			} else {
				a(".days", h).text(Math.floor(k / (3600 * 24 * d)));
				a(".hours", h).text(Math.floor(k / (3600 * d) % 24));
				a(".minutes", h).text(Math.floor(k / (60 * d) % 60));
				if (!c) {
					a(".seconds", h).text(Math.floor((k / d) % 60))
				} else {
					a(".seconds", h).text(Math.floor((k / d) % 60) + "." + Math.floor(k % 10))
				}
			}
		})
	}
})(jQuery);
(function(a) {
	a(document).ready(function() {
		if (a.browser.msie && a.browser.version == 6) {
			a(".promotion").hover(function() {
				var b = a(this).children(".p-a"),
					c = b.children(".time"),
					d = b.children(".time-bg");
				c.show();
				d.show()
			}, function() {
				var b = a(this).children(".p-a"),
					c = b.children(".time"),
					d = b.children(".time-bg");
				c.hide();
				d.hide()
			})
		}
	})
})(jQuery);
(function(a) {
	a(document).ready(function() {
		a(".switch-box").delegate(".switch-nav-item", "click", function(d) {
			var c = a(this),
				b = c.parents(".switch-box"),
				f = a(".carrousel-wrap", b),
				g = b.children(".switch-nav");
			d.preventDefault();
			a(".switch-nav-item", g).removeClass("current");
			c.addClass("current");
			a(".switch-content-item", f).removeClass("current");
			a("#" + c.attr("data-tab"), f).addClass("current")
		})
	})
})(jQuery);
(function(a) {
	a(document).ready(function() {
		a(".free-content-item").live("mouseover", function() {
			a(this).addClass("current").siblings().removeClass("current")
		})
	})
})(jQuery);
(function(a) {
	a(document).ready(function() {
		var b = function(c) {
				var g = a(c),
					f = g.parents("li"),
					d = a(".travel-info-panel"),
					h = f.parents("ul"),
					e = {};
				h.find("li").removeClass("selected");
				f.addClass("selected");
				e = f.find(".travel-info");
				d.html(e.html()).hide().slideDown(500).css("top", parseInt(f.offset().top) - 120)
			};
		a(".site-list").delegate(".select-site-btn", "click", function(c) {
			var f = a(this),
				d = f.parents("li");
			c.preventDefault();
			  if (d.find(".travel-info").size() === 0) {
				 // a.ajax({
//					  url: f.attr("data-action"),
//					  dataType: "html",
//					  error: function() {
//						  alert("服务器繁忙，请稍后重试.")
//					  },
//					  success: function(e) {
//						  a(e).insertAfter(f);
//						  b(f)
//					  }
//				  })
			  } else {
				  b(f)
			  }
		  });
		a(".travel-info-panel .close-btn").live("click", function() {
			a(".travel-info-panel").slideUp(300, function() {
				a(".site-list li").removeClass("selected")
			})
		})
	})
})(jQuery);