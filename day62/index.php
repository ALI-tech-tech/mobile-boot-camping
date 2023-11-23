<?php

$response = '[
    {
        "a" : "aaaaa",
        "b" : [
            {
                "c" : "c11",
                "d" : "d11",
                "f" : [ 5, 2 ]
            },
            {
                "c" : "c33",
                "d" : "d33",
                "f" : [ 5, 2 ]
            }
        ],
        "e" : 3
    },
    {
        "a" : "zzzzz",
        "b" : [
            {
                "c" : "c22",
                "d" : "d22",
                "f" : [ 9, 3 ]
            },
            {
                "c" : "c44",
                "d" : "d44",
                "f" : [ 9, 3 ]
            }
        ],
        "e" : 5
    }
    ]';

$arrr=json_decode($response,true);
function pri($arr){
    if (is_array($arr)) {
       if (array_is_list($arr)) {
        printlist($arr);
       }else {
        foreach ($arr as $key => $value) { 
           pri($value);
        }
       }
    }else{
        echo $arr;
        echo "<br>";
    }
    
}


function printlist($list){
    foreach ($list as $key ) {
        if (is_array($key)) {
            pri($key);
        }else{
            echo $key;
            echo "<br>";
        }
    }
}


pri($arrr);
?>