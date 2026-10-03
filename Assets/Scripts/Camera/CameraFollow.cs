using UnityEngine;

public class CameraFollow : MonoBehaviour
{
    [SerializeField] private Transform target;
    [SerializeField] private Camera targetCamera;

    private float offsetZ = -10f;

    private void LateUpdate()
    {
        FollowPlayer();
    }

    public void FollowPlayer()
    {
        if (target != null)
        {
            Vector3 newPosition = target.position;

            newPosition.y = targetCamera.transform.position.y;
            newPosition.z += offsetZ; 
            
            targetCamera.transform.position = newPosition;
        }
    }
}
