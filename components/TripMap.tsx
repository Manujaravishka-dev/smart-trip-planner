'use client';
import { MapContainer, TileLayer, Marker, Polyline, Popup, useMap } from 'react-leaflet';
import L from 'leaflet';
import 'leaflet/dist/leaflet.css';

export type TripStop={name:string;lat:number;lng:number;type:string};
const icon=(n:number)=>L.divIcon({className:'trip-marker',html:`<span>${n}</span>`,iconSize:[34,42],iconAnchor:[17,42]});
function Fit({stops}:{stops:TripStop[]}){const map=useMap(); if(stops.length>1){setTimeout(()=>map.fitBounds(stops.map(s=>[s.lat,s.lng] as [number,number]),{padding:[55,55]}),0)} return null}
export default function TripMap({stops}:{stops:TripStop[]}){const positions=stops.map(s=>[s.lat,s.lng] as [number,number]);return <MapContainer center={[7.4,80.7]} zoom={8} scrollWheelZoom className="leaflet-map"><TileLayer attribution='&copy; OpenStreetMap contributors' url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"/><Fit stops={stops}/><Polyline positions={positions} pathOptions={{color:'#2563eb',weight:5,opacity:.9}}/>{stops.map((s,i)=><Marker key={s.name} position={[s.lat,s.lng]} icon={icon(i+1)}><Popup><b>{s.name}</b><br/>{s.type}</Popup></Marker>)}</MapContainer>}
