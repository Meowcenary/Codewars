$(document).ready(function() {
    // global $, document
    $.fn.hexGridWidget = function (radius, columns, rows, cssClass) {
        // ???
        'use strict';

        // called throughout, will actually create the polygon element in the DOM
        var createSVG = function (tag) {
            return $(document.createElementNS('http://www.w3.org/2000/svg', tag || 'svg'));
        };

        return $(this).each(function () {
            var element = $(this),
                    // the encapsulated event that is triggered when a hex is clicked
                    hexClick = function () {
                        var hex = $(this);
                        element.trigger($.Event('hexclick', hex.data()));
                    },
                    height = Math.sqrt(3) / 2 * radius,
                    svgParent = createSVG('svg').attr('tabindex', 1).appendTo(element).css({
                        width: (1.5 * columns  +  0.5) * radius,
                        height: (2 * rows  +  1) * height
                    }),
                    column, row, center,
                    toPoint = function (dx, dy) {
                        return Math.round(dx + center.x) + ',' + Math.round(dy + center.y);
                    };

            for (row = 0; row < rows; row++) {
                for (column = 0; column < columns; column++) {
                    center = {x:Math.round((1 + 1.5 * column) * radius), y: Math.round(height * (1 + row * 2 + (column % 2)))};
                    createSVG('polygon').attr({
                        points: [
                            toPoint(-1 * radius / 2, -1 * height),
                            toPoint(radius / 2, -1 * height),
                            toPoint(radius, 0),
                            toPoint(radius / 2, height),
                            toPoint(-1 * radius / 2, height),
                            toPoint(-1 * radius, 0)
                        ].join(' '),
                        'class':cssClass,
                        tabindex:1
                    })
                    // .on adds trigger for click that calls hexClick function to raise expected event
                    // .attr gives the appended polygon element the data attributes 'hex-row' and 'hex-column'
                    .appendTo(svgParent).data({center:center, row:row, column:column}).on('click', hexClick).attr({'hex-row': row, 'hex-column': column});
                }
            }
        });
    };
})
