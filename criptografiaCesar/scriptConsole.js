var fraseOriginal = "o bunitao das tapiocas";
var input = 13;
fraseOriginal = fraseOriginal.toUpperCase();

function cifraCesar(fraseOriginal, input) {
    var result = "";

    for (var i = 0; i < fraseOriginal.length; i++) {
        var letra = fraseOriginal[i];


        if (letra.match(/[a-z]/i)) {
            var codigo = fraseOriginal.charCodeAt(i);


            if (codigo >= 65 && codigo <= 90) {
                letra = String.fromCharCode(((codigo - 65 + input) % 26) + 65);
            }
        }
        result += letra;
    }
    return result;

}

    var fraseCriptografada = cifraCesar(fraseOriginal, input);
    console.log("Texto cifrado: " + fraseCriptografada);