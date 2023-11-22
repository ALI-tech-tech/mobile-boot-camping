<?php

// q1
$g = 1;
while ($g <= 5) {
    for ($i = 0; $i < $g; $i++) {
        echo "*";
    }
    echo "</br>";
    $g++;
}



// q2

$arr = array("abcd", "abc", "de", "hjjj", "g", "wer");
function mini($arr)
{

    $m = $arr[0];
    foreach ($arr as $a) {
        if (strlen($a) < strlen($m)) {
            $m = $a;
        }
    }
    echo ("Min element is " . $m . " with Length = " . strlen($m));
}

function maxx($arr)
{

    $m = $arr[0];
    foreach ($arr as $a) {
        if (strlen($a) > strlen($m)) {
            $m = $a;
        }
    }
    echo ("Max element is " . $m . " with Length = " . strlen($m));
}

mini($arr);
echo "</br>";
maxx($arr);


$map = '[
    {
    "name" : "Mohammed Ali",
    "age"  : "15",
    "school" : "School 1"
    },
    {
    "name" : "Hasan Salem",
    "age"  : "16",
    "school" : "School 2"
    },
    {
        "name" : "Hanan",
        "age"  : "16",
        "school" : "School 3"
        }
]    
';
echo "</br>";
$json = json_decode($map);

foreach ($json as $key => $value) {
   
    foreach ($value as $k=> $value) {
        if ($k=="name" || $k=="school") {
            
            echo "$value";
            echo "</br>";
        }
        
    }
}





?>