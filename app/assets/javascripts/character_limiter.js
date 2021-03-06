(function($) {
    $.fn.extend( {
        limiter: function(limit, elem) {
            $(this).on("keyup focus", function() {
                setCount(this, elem);
            });
            function setCount(src, elem) {
                var chars = src.value.length;
                if (chars > limit) {
                    src.value = src.value.substr(0, limit);
                    chars = limit;
                }
                elem.html( limit - chars + " characters left" );
            }
            setCount($(this)[0], elem);
        }
    });
})(jQuery);

jQuery(document).ready(function($){
    var elem = $(".countdown");
    $("#micropost_content").limiter(140, elem);
});
