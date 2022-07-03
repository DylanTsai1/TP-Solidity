// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract TorneoFutbol {

    
    string [] private equipos;
    uint [] private golesDeEquipo;
    mapping (string => string[]) private jugadores; 
    mapping (string => uint ) private puntosEquipo;

   
    
    function AgregarEquipo(string memory NombreDeEquipo) public 
    {
     equipos.push(NombreDeEquipo);
    }

    function AgregarJugador (string memory NombreDeJugador, string memory NombreDeEquipo) public 
    {
     jugadores[NombreDeEquipo].push(NombreDeJugador);
    }

    function SacarUltimoJugadorDeEquipo (string memory NombreDeEquipo) public
    {
     jugadores[NombreDeEquipo].pop();
    }

    function RegistrarPartido (string memory Equipo1, uint GolesDeEquipo1, string memory Equipo2, uint GolesDeEquipo2) public
    {
        if (GolesDeEquipo1 > GolesDeEquipo2)
        {
            puntosEquipo[Equipo1]+=3;
        }
        else if (GolesDeEquipo1 < GolesDeEquipo2)
        {
            puntosEquipo[Equipo2]+=3;
        }
        else
        {
              puntosEquipo[Equipo1]+=1;
              puntosEquipo[Equipo2]+=1;
        }
    }

    function getListas_jugadores(string memory jugadoresDeEquipo) public view returns (string [] memory)
    {
     return jugadores[jugadoresDeEquipo]; 
    }  
    
    function getPuntos_Equipo(string memory puntosDeEquipo) public view returns (uint)

    {
     return puntosEquipo[puntosDeEquipo];
    }
    
    function getPuntero() public view returns (string memory)
    { 
        string memory PunteroDelMomento;

     for (uint i = 0; i <= equipos.length; i++)
      {
       if (puntosEquipo [equipos[i]] > puntosEquipo[equipos[0]])
      {
        PunteroDelMomento = equipos[i];
      }
     }
     return PunteroDelMomento;
    } 
         
        

}