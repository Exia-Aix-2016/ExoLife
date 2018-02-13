function img = linear(source)
    img = 255 / (max(source) - min(source)) * (source - min(source));
endfunction