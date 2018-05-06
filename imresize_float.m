function value = imresize_float(image,scale)
    minimum=min(min(min(image)));
    maximum=max(max(max(image)));
    uint = (image-minimum).*255./(maximum-minimum);
    res= imresize(uint,scale,'nearest');
    value= res.*(maximum-minimum)+minimum;
end