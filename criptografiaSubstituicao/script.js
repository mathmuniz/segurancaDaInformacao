var chave1 = 'ADHIKMORSUWYZ';
var chave2 = 'VXBGJCQLNEFPT';

var fraseOriginal = 'Encontre-me a meia-noite';
const regex = /\W|_/;
fraseOriginal = fraseOriginal.toUpperCase();
var frase = [];

function criptografar(fraseOriginal, chave1, chave2){
    for(var i = 0;i < fraseOriginal.length;i++){
        for(var codigo = 0;codigo < chave1.length;codigo++){
            if(fraseOriginal[i] === chave1[codigo]){ 
                frase.push(chave2[codigo]);          
            }
            if(fraseOriginal[i] === '-'){
                frase.push('-')
                break;
            }
            if(fraseOriginal[i] === ' '){
                frase.push(' ');
                break;
            }
            if(regex.test(fraseOriginal[i])){
                frase.push(fraseOriginal[i]);
                break;
            }
            if(fraseOriginal[i] === chave2[codigo]){
                frase.push(chave1[codigo]);
            }
        }   
    }
}

criptografar(fraseOriginal, chave1, chave2);

var fraseEncriptografada = frase.join("");
console.log(fraseEncriptografada)

    




